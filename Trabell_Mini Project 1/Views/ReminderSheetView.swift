//
//  ReminderSheetView.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import SwiftUI
import StepperView

struct ReminderSheetView: View {
    
    init() {
        print(getListStep(listStation: stationModels))
        print(getListIndicator(listStation: stationModels))
    }
    
    @State var indicator = stationModels.map { _ in
        StepperIndicationType<AnyView>.circle(Colors.teal.rawValue, 12)
    }
    
    @State var step = stationModels.map { station in
        CustomStepTextView(text: station.stationName)
    }
    
    
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
                    .foregroundColor(Color(hex: "0x6F9D80"))
                
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 22))
                    .foregroundColor(Color(hex: "0x44443D"))
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                StepperView()
                    .addSteps(
                        self.step
                    )
                    .indicators(
                        self.indicator
                    )
                    .lineOptions(StepperLineOptions.rounded(4, 8, Color.blue))
                    .stepLifeCycles((stationModels).map { _ in StepLifeCycle.pending })
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
        return listStation.map {_ in
            StepperIndicationType.custom(IndicatorImageView(indicator: .pin))
        }
    }
    
    func getListStep(listStation: [StationModel]) -> [CustomStepTextView] {
        return listStation.map { station in
            CustomStepTextView(text: station.stationName )
        }
    }
}

#Preview {
    ReminderSheetView()
}
