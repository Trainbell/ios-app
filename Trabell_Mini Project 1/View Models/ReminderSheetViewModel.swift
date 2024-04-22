//
//  ReminderSheetViewModel.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 17/04/24.
//

import Combine
import Foundation

class ReminderSheetViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let locationUtils = LocationUtils.shared
    private var appViewModel: AppViewModel?

    @Published var isLoading = false
    @Published var destinationStation: StationModel?
    @Published var listStation: [StationModel] = []
    @Published var isRoutine = false
    @Published var currentStation: StationModel?

    deinit {
        locationUtils.closeStream()
    }

    func initialize(destinationStation: StationModel, appViewModel: AppViewModel) {
        self.appViewModel = appViewModel
        isLoading = true
        self.destinationStation = destinationStation

        Task {
            do {
                let location = try await locationUtils.getLocation()
                DispatchQueue.main.async { [self] in
                    self.currentStation = StationUtils.getNearestStation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    if currentStation != nil && listStation.isEmpty {
                        listStation = StationUtils.getRouteStation(from: currentStation!, to: destinationStation)
                    }
                    self.isLoading = false
                    subscribeToLocationUpdates()
                }

            } catch {
                print("Failed to get location: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }

    func setReminder() {
        if listStation.isEmpty || currentStation == nil || destinationStation == nil {
            return
        }
        print("Set Reminder")
        let reminder = ReminderModel(
            listStation: listStation, currentStation: currentStation!, destinationStation: destinationStation!
        )
        appViewModel?.setReminder(reminder: reminder)
    }

    func deleteReminder() {
        appViewModel?.deleteReminder()
    }

    private func subscribeToLocationUpdates() {
        locationUtils.getLocationStream()
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    print("Failed to get location: \(error)")
                case .finished:
                    print("Finished receiving location updates")
                }
            }, receiveValue: { location in
                print("Received location update: \(location)")
                // Handle the received location update
            })
            .store(in: &cancellables)
    }
}
