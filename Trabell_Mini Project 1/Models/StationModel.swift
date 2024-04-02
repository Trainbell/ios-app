//
//  StationTimelineModel.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import Foundation

struct StationModel: Hashable, Identifiable {
    
    let id: Int
    let stationName: String
    let address: String
    let latitude: Double
    let longitude: Double
}
