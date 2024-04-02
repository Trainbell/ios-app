//
//  StepperComponents.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import SwiftUI
import StepperView

struct CustomStepTextView: View {
    var text : String
    var desc: String
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "0xF44443D"))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(desc)
                .font(.system(size: 12))
                .foregroundColor(Color(hex: "0xF#44443D"))
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
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
                    .overlay(Circle()
                        .foregroundColor(Color(hex: "0xF0D714F"))
                        .overlay(Circle()
                            .foregroundColor(Color(hex: "0xF8EBDD"))
                            .frame(width: 15, height: 15))
                            .frame(width: 25, height: 25))
                    .foregroundColor(Color(hex: "0xF8EBDD"))
                    .frame(width: 36, height: 36)
            } else {
                Circle()
                    .foregroundColor(indicator == .pin ? Color(hex: "0xFFFBC05") : Color(hex: "0xF0D714F"))
                    .overlay(Image(indicator == .pin ? "ic_pin_location" : "ic_train")
                        .resizable()
                        .frame(width: 29, height: 29))
                    .frame(width: 36, height: 36)
                
            }
        }
    }
}

#Preview {
    IndicatorImageView(indicator: .none )
}
