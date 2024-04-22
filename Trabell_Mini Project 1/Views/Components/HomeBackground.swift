//
//  HomeBackground.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 16/04/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct HomeBackground: View {
    @EnvironmentObject var appViewModel: AppViewModel
    let onTap: () -> Void

    var body: some View {
        if appViewModel.reminder != nil {
            ZStack(alignment: .topLeading) {
                AnimatedImage(name: "trainactive.gif")
                VStack() {
                    VStack(alignment: .leading) {
                        Text("Destination Station,")
                            .font(Font.custom("K2D-Regular", size: 16))
                            .foregroundColor(.colorText)
                        Text("\(appViewModel.reminder?.destinationStation.stationName ?? "-")")
                            .font(Font.custom("K2D-Bold", size: 24))
                            .foregroundColor(.colorText)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.leading, 20)

                    VStack(alignment: .trailing){
                        Text("Arrive in")
                            .font(Font.custom("K2D-SemiBold", size: 20))
                            .foregroundColor(.colorText)
                            .padding(.bottom, 2)
                            .padding(.top, 1)
                        
                        HStack(spacing: 4) {
                            Image(systemName: "mappin.and.ellipse.circle")
                                .font(.system(size: 14))
                                .foregroundColor(.colorText)
                            
                            Text("15 km")
                                .font(Font.custom("K2D-Regular", size: 14))
                                .foregroundColor(.colorText)
                        }

                        Button(action: onTap) {
                            Text("Details")
                                .frame(width: 70)
                              .font(Font.custom("Avenir", size: 16))
                              .bold()
                              .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.24).opacity(0.9))
                        }
                        .tint(.white)
                        .buttonBorderShape(.roundedRectangle(radius: 12))
                        .controlSize(.small)
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 4)
                        .padding(.trailing, -4)
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 20)
            
                }
                .frame(maxWidth: .infinity)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
            }
        } else {
            Image("HomeBG - 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .trailing) {
                    VStack {
                        Text("Make\nYour Own\nReminder")
                            .font(Font.custom("K2D-Bold", size: 24))
                            .foregroundColor(.colorText)

                        Button(action: onTap) {
                            Text("Start")
                                .frame(width: 70)
                              .font(Font.custom("Avenir", size: 16))
                              .bold()
                              .foregroundColor(.black)
                        }
                        .tint(.colorYellow)
                        .buttonBorderShape(.roundedRectangle(radius: 12))
                        .controlSize(.small)
                        .buttonStyle(.borderedProminent)

                    }.padding(.trailing, 24)
                }
        }
    }
}
