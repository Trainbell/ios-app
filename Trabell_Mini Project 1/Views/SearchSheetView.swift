//
//  SearchSheetView.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 01/04/24.
//

import SwiftUI
import Combine

struct SearchSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State var searchTerm = ""
    @FocusState private var isSearchFocused: Bool
    @State var isNavigateToReminder = false
    @State var searchResults: [StationModel] = []
    @State var selectedStation: StationModel? = nil
    
    func navigateToReminder()  {
        isNavigateToReminder.toggle()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(hex: "8E8E83"))
                                .padding(.trailing, -10)
                            TextField("Search for your destination station", text: $searchTerm)
                                .onReceive(Just(searchTerm)) { newText in
                                    withAnimation {
                                        if (newText.count == 0){
                                            searchResults = []
                                        } else if(newText.count < 3) {
                                            searchResults = stationModels
                                        } else {
                                            searchResults = stationModels.filter {$0.stationName.lowercased().contains(searchTerm.lowercased())}
                                        }
                                    }
                                }
                                .font(.subheadline)
                                .font(.body)
                                .focused($isSearchFocused)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 12)
                                .fontWeight(.medium)
                                .foregroundColor(Color(hex: "8E8E83"))
                            
                            if isSearchFocused {
                                Button(action: {
                                    isSearchFocused = false
                                    searchTerm = ""
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(Color(hex: "8E8E83"))
                                }
                            }
                        }
                        .padding(.horizontal)
                        .background(Color(hex: "F5F5F0"))
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
                    }
                    .frame(alignment: .top)
                    .padding(.top, 40)
                    .padding(.horizontal)
                    
                    if searchTerm.isEmpty {
                        VStack {
                            Text("Popular Station")
                                .font(.headline)
                                .fontWeight(.bold)
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading, 20)
                                .padding(.top, 21)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    ButtonPopulerStationComponent(buttonTitle: "Tanah Abang", callback: {
                                        selectedStation = stationModels.first { $0.stationName.contains("Tanah Abang") }
                                        navigateToReminder()
                                    })
                                    
                                    ButtonPopulerStationComponent(buttonTitle: "Duri", callback: {})
                                    ButtonPopulerStationComponent(buttonTitle: "Tangerang", callback: {})
                                }
                                HStack {
                                    ButtonPopulerStationComponent(buttonTitle: "Jatinegara", callback: {})
                                    ButtonPopulerStationComponent(buttonTitle: "Rawa Buntu", callback: {
                                        selectedStation = stationModels.first { $0.stationName.contains("Rawa Buntu") }
                                        navigateToReminder()
                                    })
                                    
                                    ButtonPopulerStationComponent(buttonTitle: "Manggarai", callback: {})
                                }
                            }
                            .frame(maxWidth:  .infinity, minHeight: 0)
                            .padding(.top, 3)
                            .padding(.leading, -55)
                        }
                    }
                    
                    if searchResults.isEmpty || searchTerm.isEmpty {
                        VStack(alignment:  .center) {
                            Spacer()
                                .frame(height: 80)
                            Image("Search Illust")
                                .resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 204.98, height: 168.83)
                                .rotationEffect(.degrees(-10))
                                .padding(.bottom, 31)
                            
                            Text("Navigate the rails with ease, your journey starts with a search.")
                                .foregroundColor(Color(hex: "44443D"))
                                .font(.caption)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(width: 190)
                                .opacity(0.7)
                        }
                        .padding(50)
                        Spacer()
                    } else {
                        VStack {
                            ForEach(searchResults, id: \.id) { item in
                                VStack {
                                    Button(action: {
                                        selectedStation = item
                                        
                                    }) {
                                        SearchItemComponent(station: item)
                                    }
                                    Divider()
                                        .padding(.vertical, 12)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("ColorBackground"))
            .background(NavigationLink(
                destination: ReminderSheetView(destinationStation: $selectedStation), isActive: $isNavigateToReminder,
                label: { EmptyView() }
            ))
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SearchSheetView()
}
