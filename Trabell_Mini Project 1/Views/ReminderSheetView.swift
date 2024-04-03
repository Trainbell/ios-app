//
//  ReminderSheetView.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import SwiftUI
import StepperView

struct ReminderSheetView: View {
    @Binding var destinationStation: StationModel?
    @ObservedObject var locationUtil = LocationUtils()
    @Binding var isPresented: Bool
    @State var listStation: [StationModel] = []
    @State var isRoutine = false
    @State var currentStation = StationUtils.getNearestStation(latitude: -6.314835075294274, longitude: 106.67623201918188)
    //var onBookmark: (StationModel) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(destinationStation?.stationName ?? "")
                    .font(.system(size: 24))
                    .bold()
                Spacer()
                Button(action: {
                    if let index = stationModels.firstIndex(where: { $0.stationName == destinationStation!.stationName }) {
                        stationModels[index].isRoutine.toggle()
                        }
                    isRoutine.toggle()
                    
                }){
                    if(self.isRoutine == true){
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
                    self.isPresented = false
                }){
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(Color(hex: "0x44443D"))
                    
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            
            Divider()
            
            if (!self.listStation.isEmpty){
                ScrollView(.vertical, showsIndicators: false) {
                    StepperView()
                        .addSteps(
                            getListStep(listStation: listStation)
                        )
                        .alignments((stationModels).map { _ in .bottom })
                        .indicators(
                            getListIndicator(listStation: listStation)
                        )
                        .lineOptions(StepperLineOptions.rounded(4, 8, Color(hex:"0xF6F9D80")))
                        .stepLifeCycles((listStation).map { _ in StepLifeCycle.completed })
                        .spacing(40)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 50)
                }
                
            }
            Button(
                action: {
                    
                }, label:  {
                    Text("Set Reminder")
                        .frame(maxWidth: .infinity)
                }
            )
            .tint(Color(hex: "0xF8970E"))
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(hex: "0xF8EBDD"))
        .onAppear {
            self.isRoutine = self.destinationStation?.isRoutine ?? false
            self.locationUtil.requestLocation()
        }
        .onChange(of: locationUtil.userLocation){ _, location in
            print("change")
            guard let location = location else {
                return
            }
            self.currentStation = StationUtils.getNearestStation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            if(self.currentStation != nil && self.listStation.isEmpty){
                self.listStation = StationUtils.getRouteStation(from: self.currentStation!, to: self.destinationStation!)
            }
        }
    }
    
    func getListIndicator(listStation: [StationModel] ) -> [StepperIndicationType<IndicatorImageView>] {
        return listStation.map { station in
            if(listStation.first == station){
                return StepperIndicationType.custom(IndicatorImageView(indicator: .pin))
            }
            if (station == currentStation){
                return StepperIndicationType.custom(IndicatorImageView(indicator: .train))
            }
            return StepperIndicationType.custom(IndicatorImageView(indicator: .none))
        }
    }
    
    func getListStep(listStation: [StationModel]) -> [CustomStepTextView] {
        return listStation.map { station in
            CustomStepTextView(text: station.stationName, desc: station.address )
        }
    }
}

