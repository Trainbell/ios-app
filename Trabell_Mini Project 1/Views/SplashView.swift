//
//  SplashView.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 31/03/24.
//

import Combine
import SwiftUI

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
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()

//            Text("Ringing in the right stops, gently and surely!")
//                .font(.footnote)
//                .foregroundColor(Color(hex: "#57575C"))
//                .frame(maxWidth: .infinity, alignment: .center)
//                .padding(.top, -25)
        }

        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#EEE8D1"), Color(hex: "#F9ECDE")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
        .background(
            NavigationLink(
                destination: HomeView(),
                isActive: $isActive,
                label: {
                    EmptyView()
                }
            )
            .isDetailLink(false)
        )
//        .onChange(of: locationUtils.statusLocation){ _, newvalue in
//            self.isActive = true
//            print("get called")
//        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                isActive = true
//                if(locationUtils.getLocationAuthorization() == .authorizedAlways){
//                    isActive = true
//                } else {
//                    locationUtils.requestAuthorizationIfNeeded()
//                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
