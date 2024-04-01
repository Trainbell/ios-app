//
//  SearchBar.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 01/04/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var showSearchBar: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var searchTerm = ""
    @FocusState private var isSearchFocused: Bool
    

    var body: some View {

        VStack {
            HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(hex: "8E8E83"))
                            TextField("Search", text: $searchTerm)
                                .font(.subheadline)
                                .focused($isSearchFocused)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 12)
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
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(20)
            Spacer()
            

        }
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "F8EBDD"))
        .presentationCornerRadius(48)
        .presentationDragIndicator(.visible)

    }
        
    
}



