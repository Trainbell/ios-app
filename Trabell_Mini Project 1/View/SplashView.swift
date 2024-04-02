//
//  SplashScreenView.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 31/03/24.
//

import SwiftUI
import SwiftData

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else {
            self.init(red: 0, green: 0, blue: 0)
            return
        }
        
        let red = Double((hexNumber & 0xff0000) >> 16) / 255.0
        let green = Double((hexNumber & 0x00ff00) >> 8) / 255.0
        let blue = Double(hexNumber & 0x0000ff) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct SplashView: View {
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack {
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
    
}

#Preview {
    SplashView()
    
}
