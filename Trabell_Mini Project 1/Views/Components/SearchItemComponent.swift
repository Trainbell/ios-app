//
//  SearchItemComponent.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 03/04/24.
//

import SwiftUI

struct SearchItemComponent: View {
    var station: StationModel
    
    var body: some View {
        HStack {
            Image("ic_train")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(hex: "0D714F"))
                .frame(width: 24, height: 24)
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
    SearchItemComponent(station: stationModels.first!)
}
