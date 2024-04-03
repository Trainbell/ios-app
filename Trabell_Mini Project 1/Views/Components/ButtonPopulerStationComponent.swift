//
//  ButtonPopulerStationComponent.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 03/04/24.
//

import SwiftUI

struct ButtonPopulerStationComponent: View {
    //var stationModel: StationModel
    var buttonTitle: String
    let callback: () -> Void
    
    var body: some View{
        HStack {
            Button(buttonTitle) {
                if buttonTitle == "Tanah Abang" || buttonTitle == "Rawa Buntu" {
                                callback()                             }
                
            } 
            .buttonStyle(.borderedProminent)
            .tint(Color(hex: "6F9D80"))
            .buttonBorderShape(.roundedRectangle(radius: 16))
            .frame(height: 28)
            .fontWeight(.medium)
            .font(.caption)
            .padding(.trailing, 6)
            
        }
    }}

//#Preview {
//    ButtonPopulerStationComponent(buttonTitle: "")
//}
