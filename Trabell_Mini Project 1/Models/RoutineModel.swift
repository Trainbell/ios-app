//
//  RoutineModel.swift
//  Trabell_Mini Project 1
//
//  Created by Lucinda Artahni on 03/04/24.
//

import Foundation

struct RoutineModel: Hashable, Identifiable, Equatable {
    internal init( stationName: String, address: String, latitude: Double, longitude: Double) {
        self.id = UUID().uuidString
        self.stationName = stationName
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
    
    let id: String
    let stationName: String
    let address: String
    let latitude: Double
    let longitude: Double
}
