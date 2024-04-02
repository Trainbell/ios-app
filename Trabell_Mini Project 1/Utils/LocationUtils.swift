//
//  LocationUtils.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import CoreLocation

class LocationUtils: NSObject, CLLocationManagerDelegate, ObservableObject {
     var locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    @Published var statusLocation: Bool?
    
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func requestAuthorizationIfNeeded() {
        switch (locationManager.authorizationStatus) {
        case .notDetermined:
            print("Permission is not determined")
            self.locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Permission is resctricted")
        case .denied:
            print("Permission is denied")
        case .authorizedAlways:
            print("Permission is always")
            self.statusLocation = true
        case .authorizedWhenInUse:
            print("Permission is when in use")
            self.locationManager.requestAlwaysAuthorization()
        @unknown default:
            print("uknown")
        }
    }
    
    func requestLocation() {
        requestAuthorizationIfNeeded()
        self.locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
        print(location)
//        self.userLocationObserver?(location)
//        let stasiunUi = CLLocation(
//            latitude: -6.3607632630938555, longitude: 106.83177617294017
//        )
//
//        
//    
//        if(stasiunUi.distance(from: location) <= 50){
//            self.locationManager.stopUpdatingLocation()
//            self.statusLocation = true
//        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            statusLocation = true
        } else if status == .authorizedWhenInUse {
            requestAuthorizationIfNeeded()
        } else {
            statusLocation = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Error: \(error) \(manager.authorizationStatus)")
    }
    
    func getLocationAuthorization() -> CLAuthorizationStatus{
        return self.locationManager.authorizationStatus
    }
    
}
