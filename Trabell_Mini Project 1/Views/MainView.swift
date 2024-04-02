//
//  MainView.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import SwiftUI


struct MainView: View {
    @State var showSheet = false
    
    // HANYA SEMENTARA NANTI DI TIMPA CODE JEHA
    var body: some View {
        VStack{
            Button("test") {
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet) {
            SearchSheetView()
                .presentationDetents([.fraction(0.95)])
                .presentationDragIndicator(.visible)
        }
    
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}

