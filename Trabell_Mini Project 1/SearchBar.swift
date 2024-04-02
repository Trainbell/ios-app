//
//  SearchBar.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 01/04/24.
//

import SwiftUI

struct SearchBar: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var searchTerm = ""
    @FocusState private var isSearchFocused: Bool
    

    var body: some View {

        VStack (alignment: .leading) {
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
               
            
            HStack {
                Button("Tanah Abang"){
                    //action
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(hex: "6F9D80"))
                .buttonBorderShape(.roundedRectangle(radius: 16))
                .frame(height: 28)
                .fontWeight(.medium)
                .font(.caption)
                
            }
            .padding(.top, 3)
            .padding(.leading, 20)
            
            
            Spacer()
            
            

        }
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "F8EBDD"))
        .presentationCornerRadius(48)
        .presentationDragIndicator(.visible)

    }
        
    
}

#Preview {
    SearchBar()
}




