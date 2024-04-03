//
//  RoutineView.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 03/04/24.
//

import SwiftUI

struct RoutineSheetView: View {
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text("Routine")
                        .font(.system(size: 24))
                    .bold()
                    
                    Spacer()
                }
                .padding(20)
                Spacer()
                
                Divider()
            
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(hex: "0xF8EBDD"))
    }
}

#Preview {
    RoutineSheetView()
}
