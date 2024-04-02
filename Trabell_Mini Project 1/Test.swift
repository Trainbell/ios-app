//
//  Test.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 01/04/24.
//

import SwiftUI

struct Test: View {
    @State private var showSearchBar = false //tambahin ke home
        
    var body: some View {
       
        ZStack {
            Button("Search Station!"){
                showSearchBar.toggle() //tambahin ke home
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)//ini tes doang gausa dimasukin
        
        
            //tambahin ke home
            .sheet(isPresented: $showSearchBar) {
                SearchBar()

        
        }
            
        
        
    }
        
}

#Preview {
    Test()
}
