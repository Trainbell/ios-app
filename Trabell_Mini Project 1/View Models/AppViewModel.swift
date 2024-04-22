//
//  AppViewModel.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 17/04/24.
//

import Foundation

class AppViewModel: ObservableObject {
//    @Published var isActive: Bool = UserDefaults.standard.bool(forKey: "ActiveKey")
    @Published var reminder: ReminderModel?

//    func setToogleReminder() {
//        DispatchQueue.main.async {
//            self.isActive.toggle()
//            UserDefaults.standard.setValue(self.isActive, forKey: "ActiveKey")
//        }
//    }
//    
    func setReminder(reminder: ReminderModel) {
        DispatchQueue.main.async {
            self.reminder = reminder
        }
    }
    
    func deleteReminder() {
        self.reminder = nil
    }
}
