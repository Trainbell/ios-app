//
//  StationUtils.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import CoreLocation

class StationUtils {
   static func getRouteStation(from current: StationModel, to destination: StationModel) -> [StationModel] {
        
        guard let currentIndex = stationModels.firstIndex(of: current),
              let destinationIndex = stationModels.firstIndex(of: destination) else {
            return []
        }
        
        let startIndex = min(currentIndex, destinationIndex)
        let endIndex = max(currentIndex, destinationIndex)
        
        let result = stationModels[startIndex...endIndex]
        
        if currentIndex > destinationIndex {
            return Array(result.reversed())
        } else {
            return Array(result)
        }
    }
    
//    static func getLocationUtils
    
    static func getNearestStation(latitude: Double, longitude: Double) -> StationModel? {
        let currentLocation = CLLocation(latitude: latitude, longitude: longitude)
        var nearestLocation: StationModel?
        var shortestDistance: CLLocationDistance = Double.greatestFiniteMagnitude
        
        stationModels.forEach{ station in
            let locationCoordinate = CLLocation(latitude: station.latitude, longitude: station.longitude)
            let distance = currentLocation.distance(from: locationCoordinate)
            
            if distance < shortestDistance {
                shortestDistance = distance
                nearestLocation = station
            }
        }
        
        return nearestLocation
    }
    
    
}
