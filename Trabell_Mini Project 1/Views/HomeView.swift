//
//  ContentView.swift
//  Trabell
//
//  Created by Vincent Junior Halim on 27/03/24.
//

import SwiftUI

struct HomeView: View {
    @State var showSheet = false
    @State var showRoutine = false
    
    var body: some View {
        let background_color = Color(red: 0.976, green: 0.925, blue: 0.87)
        ZStack{
            VStack{
                HStack {
                    Image("HomeBG - 1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment:.trailing){
                            VStack{
                                Text("Make\nYour Own\nReminder")
                                    .bold()
                                    .foregroundStyle(Color(red: 0.266, green: 0.266, blue: 0.24))
                                    .frame(width: 100)
                                ZStack{
                                    Button{
                                        showSheet.toggle()
                                    }
                                label:{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 27)
                                            .fill(Color(red: 0.984, green: 0.729, blue: 0.286))
                                            .frame(width: 112,height: 34)
                                        Text("Start")
                                            .foregroundStyle(.black)
                                            .bold()
                                    }
                                }
                                    
                                }
                                
                            }.padding()
                            
                        }
                }.overlay(alignment: .bottom){
                    ZStack{
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 27,topTrailing: 27))
                            .fill(background_color)
                            .frame(maxHeight: 75)
                        HStack{
                            Text("Routines")
                                .foregroundStyle(Color(red: 0.266, green: 0.266, blue: 0.2392))
                                .font(.title2)
                                .bold()
                                .padding()
                            
                            Spacer()
                            Button(action: {
                                showRoutine.toggle()
                            }, label: {
                                Text("View More")
                                    .font(.caption)
                            })
                            .padding()
                        }
                        
                    }
                }
                
                HStack{
                    Button{
                        showSheet.toggle()
                    }
                label:{
                    ZStack{
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(red: 0.7764, green: 0.7764, blue: 0.7294))
                        .frame(width: 143,height: 102)
                    
                        VStack{
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.5127))
                            Text("Add Routine")
                                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.5127))
                        }
                    }
                }
                    .padding()
                    Spacer()
                }
                .padding(.top, -20)
                
                VStack{
                    HStack{
                        Text("Recents")
                            .font(.title2)
                            .frame(alignment: .leading)
                            .foregroundStyle(Color(red: 0.266, green: 0.266, blue: 0.2392))
                            .bold()
                            .padding()
                        Spacer()
                    
                            
                    }
                    VStack{
                        Image("Recents")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.5)
                        Text("No recent station stops, but we're ready to bell when you're en route!")
                            .frame(width: 300)
                            .multilineTextAlignment(.center)
                            .padding()
                    }.background(Color(white: 1, opacity: 0.5))
                        .cornerRadius(27)
                        .padding(.top, -10)
                        
                }
                
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.all)
            .background(background_color)
            .sheet(isPresented: $showSheet) {
                SearchSheetView()
                    .presentationDetents([.fraction(0.95)])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(48)
            }
            .sheet(isPresented: $showRoutine){
                RoutineSheetView()
                .presentationCornerRadius(48)
                .presentationDragIndicator(.visible)
            }
        
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
