//
//  ReminderSheet.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 01/04/24.
//

import SwiftUI
import StepperView

struct ReminderSheet: View {
    
    let steps = [
        Text("Rawa Buntu Station").font(.caption),
        Text("Kebayoran Station").font(.caption),
        Text("Pondok Ranji Station").font(.caption),
    ]
    
    
    
    let alignments = [StepperAlignment.center, .top, .center, .bottom]
    
    let indicationTypes = [
        StepperIndicationType<AnyView>.image(Image(systemName: "arrowshape.turn.up.right.fill"), 12),
        StepperIndicationType.image(Image(systemName: "arrowshape.turn.up.right.circle"), 12),
        StepperIndicationType.image(Image(systemName: "arrowshape.turn.up.right.circle"), 24),
    ]
    
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
        .background(Color(hex: 0xF8EBDD))
        
    }
}

struct CustomStepTextView: View {
    var text:String
    var body: some View {
        VStack {
            TextView(text: text, font: Font.system(size: 16, weight: Font.Weight.regular))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: -15)
        }
    }
}

struct IndicatorImageView: View {
    var name:String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white)
                .overlay(Image(systemName: name)
                    .resizable()
                    .frame(width: 30, height: 30))
                .frame(width: 40, height: 40)
        }
        
    }
}


#Preview {
    ReminderSheet()
}
