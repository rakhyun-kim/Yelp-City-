//
//  DataService.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/3/23.
//

import Foundation
import CoreLocation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?) async -> [Business] {
        
        // Check if api key exists
        guard apiKey != nil else {
            return [Business]()
        }
        // Default lat, long
        var lat = 35.665517
        var long = 139.770398
        
        // User lat, long
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        // 1. Create url
        if let url = URL(string:"https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&catagories=restaurants&limit=10") {
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            // 3. Send request
            do {
                let(data, response) = try await URLSession.shared.data(for:request)
                
                // 4. Parse JSON data
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
            }
            catch {
                print(error)
            }
        }
        return [Business]()
    }
     
    
}
