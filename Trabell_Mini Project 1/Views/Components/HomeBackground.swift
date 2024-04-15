//
//  HomeBackground.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 16/04/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct HomeBackground: View {
    @Binding var active : Bool
    let onTap: () -> Void
    
    var body: some View {
        if active {
            AnimatedImage(name: "trainactive.gif")
                .overlay(alignment: .trailing) {
                    VStack {
                        Text("Arrive in")
                            .bold()
                            .font(.system(size: 24))
                            .foregroundStyle(Color(red: 0.266, green: 0.266, blue: 0.24))

                        ZStack {
                            Button {
                                onTap()
                            }
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 27)
                                        .fill(Color(red: 0.984, green: 0.729, blue: 0.286))
                                        .frame(width: 112, height: 34)
                                    Text("Details")
                                        .foregroundStyle(.black)
                                        .bold()
                                }
                            }
                        }

                    }.padding(.trailing, 24)
                }
        } else {
            Image("HomeBG - 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .trailing) {
                    VStack {
                        Text("Make\nYour Own\nReminder")
                            .bold()
                            .font(.system(size: 24))
                            .foregroundStyle(Color(red: 0.266, green: 0.266, blue: 0.24))

                        ZStack {
                            Button {
                                onTap()
                            }
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 27)
                                        .fill(Color(red: 0.984, green: 0.729, blue: 0.286))
                                        .frame(width: 112, height: 34)
                                    Text("Start")
                                        .foregroundStyle(.black)
                                        .bold()
                                }
                            }
                        }

                    }.padding(.trailing, 24)
                }
        }
    

    }
}
