//
//  HomeView.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 01/04/24.
//

import SwiftUI

struct MainView: View {
    @State var showBsd = false
    
    // HANYA SEMENTARA NANTI DI TIMPA CODE JEHA
    var body: some View {
        VStack{
            Button("test") {
               showBsd = true
            }
        }
        .sheet(isPresented: $showBsd) {
            ReminderSheet()
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    MainView()
}
