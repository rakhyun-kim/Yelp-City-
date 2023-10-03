//
//  DataService.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/3/23.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async {
        
        // Check if api key exists
        guard apiKey != nil else {
            return
        }
        
        // 1. Create url
        if let url = URL(string:"https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&catagories=restaurants&limit=10") {
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            // 3. Send request
            do {
                let(data, response) = try await URLSession.shared.data(for:request)
                
                print(data)
                print(response)
            
                // 4. Parse JSON data
            }
            catch {
                print(error)
            }
           
        }

        
    }
}
