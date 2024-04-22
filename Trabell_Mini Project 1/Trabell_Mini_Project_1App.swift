//
//  Trabell_Mini_Project_1App.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 31/03/24.
//

import SwiftUI
import SwiftData

@main
struct Trabell_Mini_Project_1App: App {
    var appViewModel = AppViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                SplashScreenView()
            } .environmentObject(appViewModel)
        }
        
    }
}
