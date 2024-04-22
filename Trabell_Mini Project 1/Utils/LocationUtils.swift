//
//  LocationUtils.swift
//  Trabell_Mini Project 1
//
//  Created by Rifat Khadafy on 02/04/24.
//

import Combine
import CoreLocation
import Foundation

class LocationUtils: NSObject, CLLocationManagerDelegate {
    static let shared = LocationUtils()
    private var locationManager = CLLocationManager()
    private var isAuthorizationAlways = false
    private var locationContinuation: CheckedContinuation<CLLocation, Error>?
    private var locationSubject = PassthroughSubject<CLLocation, Error>()

    private var locationStream: AnyPublisher<CLLocation, Error> {
        return locationSubject.eraseToAnyPublisher()
    }

    override init() {
        super.init()
        locationManager.delegate = self
        isAuthorizationAlways = locationManager.authorizationStatus == .authorizedAlways
    }

    /*
      Request one time location
     */
    func getLocation() async throws -> CLLocation {
        return try await withCheckedThrowingContinuation { continuation in
            self.locationContinuation = continuation
            requestLocationAlways()
            self.locationManager.requestLocation()
        }
    }

    func getLocationStream() -> AnyPublisher<CLLocation, Error> {
        requestLocationAlways()
        locationManager.startUpdatingLocation()
        return locationStream
    }
    
    func closeStream()  {
        locationManager.stopUpdatingLocation()
    }

    func requestLocationAlways() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            print("Permission is not determined")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Permission is resctricted")
        case .denied:
            print("Permission is denied")
        case .authorizedAlways:
            print("Permission is always")
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            print("Default")
        }
    }

    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationContinuation?.resume(returning: location)
        locationContinuation = nil
        locationSubject.send(location)
    }

    func locationManager(_: CLLocationManager, didFailWithError error: Error) {
        locationContinuation?.resume(throwing: error)
        locationContinuation = nil
//        locationSubject.send(completion: .failure(error))
    }

    func locationManager(_: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            isAuthorizationAlways = true
        } else if status == .authorizedWhenInUse {
            requestLocationAlways()
        } else {
            isAuthorizationAlways = false
        }
    }

    func getLocationAuthorization() -> CLAuthorizationStatus {
        return locationManager.authorizationStatus
    }
}
