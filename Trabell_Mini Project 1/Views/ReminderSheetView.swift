//
//  ReminderSheetView.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import SwiftUI
import StepperView

struct ReminderSheetView: View {
    
    @Binding var isPresented: Bool
    @State var currentStation = StationUtils().getNearestStation(latitude: -6.314835075294274, longitude: 106.67623201918188)
    
    var body: some View {
        VStack {
            HStack {
                Text("Rawa Buntu Station")
                    .font(.system(size: 24))
                    .bold()
                Spacer()
                Image(systemName: "bookmark")
                    .font(.system(size: 22))
                    .padding(.trailing, 0.2069)
                    .foregroundColor(Color(hex: "0x44443D"))
                
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
            
            ScrollView(.vertical, showsIndicators: false) {
                StepperView()
                    .addSteps(
                        getListStep(listStation: stationModels)
                    )
                    .alignments((stationModels).map { _ in .bottom })
                    .indicators(
                        getListIndicator(listStation: stationModels)
                    )
                    .lineOptions(StepperLineOptions.rounded(4, 8, Color(hex:"0xF6F9D80")))
                    .stepLifeCycles((stationModels).map { _ in StepLifeCycle.completed })
                    .spacing(40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 50)
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

