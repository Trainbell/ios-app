//
//  ReminderSheetView.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import Combine
import CoreLocation
import StepperView
import SwiftUI
import UserNotifications

struct ReminderSheetView: View {
    @Binding var destinationStation: StationModel?

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var appViewModel: AppViewModel
    @StateObject var viewModel = ReminderSheetViewModel()

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.destinationStation?.stationName ?? "")
                    .font(.system(size: 24))
                    .bold()
                Spacer()
                Button(action: {
                    if let index = stationModels.firstIndex(where: { $0.stationName == viewModel.destinationStation!.stationName }) {
                        stationModels[index].isRoutine.toggle()
                    }
                    viewModel.isRoutine.toggle()

                }) {
                    if viewModel.isRoutine == true {
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 22))
                            .padding(.trailing, 0.2069)
                            .foregroundColor(Color(hex: "6F9D80"))
                    } else {
                        Image(systemName: "bookmark")
                            .font(.system(size: 22))
                            .padding(.trailing, 0.2069)
                            .foregroundColor(Color(hex: "0x44443D"))
                    }
                }

                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(Color(hex: "0x44443D"))
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)

            Divider()

            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                Group {
                    if !viewModel.listStation.isEmpty {
                        ScrollView(.vertical, showsIndicators: false) {
                            StepperView()
                                .addSteps(
                                    getListStep()
                                )
                                .alignments(stationModels.map { _ in .bottom })
                                .indicators(
                                    getListIndicator()
                                )
                                .lineOptions(StepperLineOptions.rounded(4, 8, Color(hex: "0xF6F9D80")))
                                .stepLifeCycles(viewModel.listStation.map { _ in StepLifeCycle.pending })
                                .spacing(40)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 50)
                        }
                    }
                    Button(
                        action: {
                            if appViewModel.reminder != nil {
                                let center = UNUserNotificationCenter.current()
                                center.removeAllPendingNotificationRequests()
                                appViewModel.deleteReminder()
                            } else {
                                setAlarm()
                            }
                        }, label: {
                            Text("Set Reminder")
                                .frame(maxWidth: .infinity)
                        }
                    )
                    .tint(appViewModel.reminder != nil ? Color("ColorRed") : Color("ColorYellow"))
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .onAppear {
            viewModel.initialize(destinationStation: destinationStation!, appViewModel: appViewModel)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("ColorBackground"))
    }

    func getListIndicator() -> [StepperIndicationType<IndicatorImageView>] {
        return viewModel.listStation.map { station in
            if viewModel.listStation.last == station {
                return StepperIndicationType.custom(IndicatorImageView(indicator: .pin))
            }
            if station == viewModel.currentStation {
                return StepperIndicationType.custom(IndicatorImageView(indicator: .train))
            }
            return StepperIndicationType.custom(IndicatorImageView(indicator: .none))
        }
    }

    func getListStep() -> [CustomStepTextView] {
        let currentStation = CLLocation(latitude: viewModel.currentStation!.latitude, longitude: viewModel.currentStation!.longitude)
        return viewModel.listStation.map { station in
            let stationLocation = CLLocation(latitude: station.latitude, longitude: station.longitude)
            let distance = stationLocation.distance(from: currentStation)
            return CustomStepTextView(text: station.stationName, distance: Int(distance.rounded()))
        }
    }

    func setAlarm() {
        let center = UNUserNotificationCenter.current()

        // Request authorization to display notifications
        center.requestAuthorization(options: [.alert, .sound, .criticalAlert]) { granted, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }

            if granted {
                print("Here")
                // Create a trigger for the notification to fire immediately
                viewModel.setReminder()
                let content = UNMutableNotificationContent()
                content.title = "Alarm"
                content.body = "This is your alarm."
                content.sound = UNNotificationSound.defaultCritical

                let location = CLLocationCoordinate2D(latitude: destinationStation!.latitude, longitude: destinationStation!.longitude)
                let region = CLCircularRegion(center: location, radius: 50, identifier: destinationStation!.stationName)
                region.notifyOnEntry = true
                region.notifyOnExit = false

                for _ in 1 ... 4 {
                    let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    center.add(request)
                }
            }
        }
    }
}
