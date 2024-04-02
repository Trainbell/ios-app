//
//  StationUtils.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import CoreLocation

class StationUtils {
    func getNearestStation(latitude: Double, longitude: Double) -> StationModel? {
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
