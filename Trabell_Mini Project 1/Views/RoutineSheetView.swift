//
//  RoutineSheetView.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 03/04/24.
//

import SwiftUI

struct RoutineSheetView: View {
    @State var routineStation: StationModel? = nil
    @State var showSheet = false
    @State var showSearchSheet = false

    var body: some View {
        VStack {
            HStack {
                Text("Routine")
                    .font(.system(size: 24))
                    .bold()

                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, -5)

            Divider()
                .padding()

            ScrollView {
                VStack {
                    ForEach(stationModels.filter { $0.isRoutine == true }) { station in
                        VStack {
                            Button(action: {
                                routineStation = station
                                showSheet.toggle()

                            }) {
                                RoutineComponent(station: station)
                            }
                            Divider()
                                .padding(.vertical, 12)
                        }
                    }
                }
                .padding(.leading, 22)
            }
            Button(
                action: {
                    showSearchSheet.toggle()

                }, label: {
                    Text("Add Routine")
                        .frame(maxWidth: .infinity)
                }
            )
            .tint(Color(hex: "0xF8970E"))
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .buttonStyle(.borderedProminent)
//            .controlSize(.extraLarge)
        }
        .padding(.top, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(hex: "0xF8EBDD"))
        .sheet(isPresented: $showSheet) {
//            ReminderSheetView(destinationStation: routineStation!)
        }
        .sheet(isPresented: $showSearchSheet) {
            SearchSheetView()
                .presentationDetents([.fraction(0.95)])
                .presentationDragIndicator(.visible)
//                .presentationCornerRadius(48)
        }
    }
}

#Preview {
    RoutineSheetView()
}
