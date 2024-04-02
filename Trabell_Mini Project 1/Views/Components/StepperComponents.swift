//
//  StepperComponents.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import SwiftUI
import StepperView

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

enum IndicatorImage {
    case pin
    case train
    case none
}

struct IndicatorImageView: View {
    var indicator: IndicatorImage
    var body: some View {
        ZStack {
            if (indicator == .none) {
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: 40, height: 40)
            } else {
                Circle()
                    .foregroundColor(Color.white)
                    .overlay(Image(getImage())
                        .resizable()
                        .frame(width: 30, height: 30))
                    .frame(width: 40, height: 40)
            }
        }
    }
    
    func getImage() -> String {
        if (indicator == .pin){
            "ic_pin_location"
        } else {
            "ic_train"
        }
    }
}
