//
//  RoutineComponent.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 03/04/24.
//

import SwiftUI

struct RoutineComponent: View {
    
    var station: StationModel
    
    var body: some View {
        HStack {
            Image(systemName: "bookmark.fill")
                .font(.system(size: 22))
                .padding(.trailing, 0.2069)
                .foregroundColor(Color(hex: "6F9D80"))
                .padding(.trailing, 5)
            VStack (alignment: .leading) {
                Text(station.stationName)
                    .foregroundStyle(Color(hex: "44443D"))
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, -5)
                
                Text(station.address)
                    .foregroundStyle(Color(hex: "44443D"))
                    .font(.caption2)
                    .frame(width: 298, height: 18)
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    RoutineComponent(station: stationModels.first!)
}
