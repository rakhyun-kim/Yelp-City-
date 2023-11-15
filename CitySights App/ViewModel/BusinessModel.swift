//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 11/1/23.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessModel: NSObject, CLLocationManagerDelegate {
   
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currenUserLocation: CLLocationCoordinate2D?
    
    var locationAuthStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getbusinesses(query: String?, options: String?, category: String?) {
        Task {
            businesses = await service.businessSearch(userLocation: currenUserLocation, query: query, options: options, category: category)
        }
    }
    
    func getUserLocation() {
        
        // Check if we have permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            
            currenUserLocation = nil
            locationManager.requestLocation()
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        self.locationAuthStatus = manager.authorizationStatus
        // Detect if user allowed, then request location
        if manager.authorizationStatus == .authorizedWhenInUse {
            
            currenUserLocation = nil
            manager.requestLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        
        if currenUserLocation == nil {
            
            currenUserLocation = locations.last?.coordinate
            
            // Call business search
            getbusinesses(query: nil, options: nil, category: nil)
        }
        manager.stopUpdatingLocation()
    }
}
