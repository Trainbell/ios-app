//
//  ReminderSheetView.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import SwiftUI
import StepperView

struct ReminderSheetView: View {
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
            StepperView()
                .addSteps([
                    CustomStepTextView(text: "Card details"),
                    CustomStepTextView(text: "Application review"),
                    CustomStepTextView(text: "Authenticate OTP"),
                    CustomStepTextView(text: "Create password")
                ])
                .indicators([
                    StepperIndicationType.custom(IndicatorImageView(name: "train.side.front.car")),
                    StepperIndicationType.custom(IndicatorImageView(name: "train.side.front.car")),
                    StepperIndicationType.circle(Color.green, 40),
                    StepperIndicationType.custom(IndicatorImageView(name:"pending"))
                ])
                .lineOptions(StepperLineOptions.rounded(4, 8, Color.blue))
                .stepLifeCycles([StepLifeCycle.completed, .completed, .completed, .pending])
                .spacing(40)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
            
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
}

#Preview {
    ReminderSheetView()
}
