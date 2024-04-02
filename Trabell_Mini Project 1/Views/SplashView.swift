//
//  SplashScreenView.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 31/03/24.
//

import SwiftUI
import SwiftData


struct SplashScreenView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("Trabell Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 225, height: 73)
                .padding(.bottom, 55)
            Spacer()
            
            Text("Ringing in the right stops, gently and surely!")
                .font(.footnote)
                .foregroundColor(Color(hex: "#57575C"))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, -25)
            
        }
        
        .background(LinearGradient(gradient: Gradient(colors: [Color (hex: "#EEE8D1"), Color (hex: "#F9ECDE")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
        .background(
            NavigationLink(
                destination: MainView(),
                isActive: $isActive,
                label: {
                    EmptyView()
                })
            .isDetailLink(false)
            
        )
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                self.isActive = true
            }
        }
        
    }
    
    
}

#Preview {
    SplashScreenView()
    
}
