//
//  HomeView.swift
//  Trabell
//
//  Created by Vincent Junior Halim on 27/03/24.
//

import SwiftUI
import UserNotifications

struct HomeView: View {
    @State var showSheet = false
    @State var showRoutine = false
    @State var active = true

    var body: some View {
        let background_color = Color(red: 0.976, green: 0.925, blue: 0.87)
        ZStack {
            VStack {
                HStack {
                    HomeBackground(){
                        showSheet.toggle()
                    }
                }.overlay(alignment: .bottom) {
                    ZStack {
                        UnevenRoundedRectangle(
                            cornerRadii: .init(topLeading: 27, topTrailing: 27))
                            .fill(background_color)
                            .frame(maxHeight: 75)
                        HStack {
                            Text("Routines")
                                .foregroundStyle(Color(red: 0.266, green: 0.266, blue: 0.2392))
                                .font(.title2)
                                .bold()

                            Spacer()
                            Button(action: {
                                showRoutine.toggle()
                            }, label: {
                                Text("View More")
                                    .font(.system(size: 12))
                            })
                            .foregroundColor(Color("ColorAccent"))
                        }
                        .padding(.horizontal, 16)
                    }
                }

                HStack {
                    Button {
                        showSheet.toggle()
                    }
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color("ColorWhiteBG"))
                                .frame(width: 143, height: 102)

                            VStack {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(Color("ColorAccent"))
                                Text("Add Routine")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("ColorAccent"))
                                    .padding(.top, 4)
                            }
                        }
                    }
                    .padding(.leading, 16)
                    Spacer()
                }
                .padding(.top, -20)

                VStack {
                    HStack {
                        Text("Recents")
                            .font(.title2)
                            .frame(alignment: .leading)
                            .foregroundStyle(Color(red: 0.266, green: 0.266, blue: 0.2392))
                            .bold()

                        Spacer()
                    }
                    VStack {
                        Image("Recents")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.5)
                        Text("No recent station stops, but we're ready to bell when you're en route!")
                            .frame(width: 235)
                            .font(.system(size: 12))
                            .foregroundColor(Color("ColorText"))
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("ColorWhiteBG"))
                    .cornerRadius(27)

                }.padding()

                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
            .background(background_color)
            .sheet(isPresented: $showSheet) {
                SearchSheetView()
                    .presentationDetents([.fraction(0.95)])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showRoutine) {
                RoutineSheetView()
                    .presentationDragIndicator(.visible)
            }

            .navigationBarBackButtonHidden(true)
    }

    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()

        // Request authorization to display notifications
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting authorization: \(error.localizedDescription)")
            }

            if granted {
                let content = UNMutableNotificationContent()
                content.title = "Reminder"
                content.body = "This is your reminder."
                content.sound = UNNotificationSound.default

                var dateComponents = DateComponents()
                dateComponents.hour = 8
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
            }
        }
    }
}

#Preview {
    HomeView()
}

