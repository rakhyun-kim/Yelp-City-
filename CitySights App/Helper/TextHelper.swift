//
//  TextHelper.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/3/23.
//

import Foundation

struct TextHelper {
    
    static func distanceAwayText(meters: Double) -> String {
        
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        }
        else {
            return "\(Int(round(meters))) m away"
        }
    }
}
