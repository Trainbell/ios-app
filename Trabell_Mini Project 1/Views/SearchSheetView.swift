//
//  SearchBar.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 01/04/24.
//

import SwiftUI


struct SearchSheetView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var searchTerm = ""
    @FocusState private var isSearchFocused: Bool
    @State var showSheet = false
    @State var searchResults: [StationModel] = []
    @State var selectedStation: StationModel? = nil

    
    
    var body: some View {
        
        ScrollView {
            VStack  {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(hex: "8E8E83"))
                            .padding(.trailing, -10)
                        TextField("Search for your destination station", text: $searchTerm)
                            .onChange(of: searchTerm) { _, newText in
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
                .padding(.top, 54)
                .padding(.horizontal)
                
                Text("Popular Station")
                    .font(.headline)
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 20)
                    .padding(.top, 21)
                
                
                VStack (alignment: .leading){
                    HStack {
                        ButtonPopulerStationComponent(buttonTitle: "Tanah Abang", callback: {
                            selectedStation = stationModels.first { $0.stationName.contains("Tanah Abang") }
                            showSheet.toggle()
                        })
                        
                        
                        ButtonPopulerStationComponent(buttonTitle: "Duri", callback: {})
                        ButtonPopulerStationComponent(buttonTitle: "Tangerang", callback: {})
                    }
                    HStack{
                        ButtonPopulerStationComponent(buttonTitle: "Jatinegara", callback: {})
                        ButtonPopulerStationComponent(buttonTitle: "Rawa Buntu", callback: {
                            selectedStation = stationModels.first { $0.stationName.contains("Rawa Buntu") }
                            showSheet.toggle()
                        })
                        
                        ButtonPopulerStationComponent(buttonTitle: "Manggarai", callback: {})

                        
                    }
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                .padding(.top, 3)
                .padding(.leading, -55)
                
                
                if searchResults.isEmpty {
                    VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        Spacer()
                            .frame(height: 80)
                        Image("Search Illust")
                            .resizable().aspectRatio( contentMode: .fit)
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
                            VStack{
                                Button(action: {
                                    selectedStation = item
                                    showSheet.toggle()
                                    
                                }){
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
        .background(Color(hex: "F8EBDD"))
        .sheet(isPresented: $showSheet){
            ReminderSheetView(destinationStation: $selectedStation, isPresented: $showSheet)
                .presentationCornerRadius(48)
            
        }
        
    }
}


#Preview {
    SearchSheetView()
}




