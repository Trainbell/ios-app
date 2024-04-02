//
//  SearchBar.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 01/04/24.
//

import SwiftUI


struct SearchBar: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var searchTerm = ""
    @FocusState private var isSearchFocused: Bool
    
    @State var stationItems = [StationModel]()
    
    var searchResults: [StationModel] {
        searchTerm.isEmpty ? [] : stationItems.filter{$0.stationName.contains(searchTerm)}
    }

    var body: some View {

        VStack  {
            HStack {
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(hex: "8E8E83"))
                        .padding(.trailing, -10)
                    TextField("Search for your destination station", text: $searchTerm)
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
                    buttonPopularStation(buttonTitle: "Tanah Abang")
                    buttonPopularStation(buttonTitle: "Duri")
                    buttonPopularStation(buttonTitle: "Tangerang")
                }
                HStack{
                    buttonPopularStation(buttonTitle: "Jatinegara")
                    buttonPopularStation(buttonTitle: "Rawa Buntu")
                    buttonPopularStation(buttonTitle: "Manggarai")
                }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            .padding(.top, 3)
            .padding(.leading, -55)
            
            if searchTerm.isEmpty{
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) { //change into list of search station
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
                //postpone
                List {
                    ForEach(searchResults) { item in
                        VStack{
                            //stationData(station: item)
                            Text(item.stationName)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "F8EBDD"))
        .presentationCornerRadius(48)
        .presentationDragIndicator(.visible)
        
        .ignoresSafeArea(.keyboard, edges: .bottom)

    }
}

struct buttonPopularStation: View{
    var buttonTitle: String
    
    var body: some View{
        HStack {
            Button(buttonTitle){
                //action
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(hex: "6F9D80"))
            .buttonBorderShape(.roundedRectangle(radius: 16))
            .frame(height: 28)
            .fontWeight(.medium)
            .font(.caption)
            .padding(.trailing, 6)
           
        }
    }
}


#Preview {
    SearchBar()
}

struct stationData: View {
    var station: StationModel

    
    var body: some View {
        HStack {
            Image("train logo")
                .resizable()
                .frame(width: 24, height: 24)
            VStack (alignment: .leading) {
                Text(station.stationName)
                    .foregroundStyle(Color(hex: "44443D"))
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, -5)
                
                Text(station.address)
                    .foregroundStyle(Color(hex: "44443D"))
                    .font(.caption2)
                    .frame(width: 298, height: 18)

            }
                        


                        Spacer()
        }
    }
    
}

//#Preview {
//    Group {
//            stationData(station: stationModels[0])
//            stationData(station: stationModels[1])
//            
//        }
//}



