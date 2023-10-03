//
//  Business.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/3/23.
//

import Foundation

struct Business: Decodable, Identifiable {
    var id: String?
    var alias: String?
    var categories: [Category]
    var coordinates: Coordinate?
    var displayPhone: String?
    var distance: Double?
    var imageUrl: String?
    var isClose: Bool?
    var location: Location?
    var name: String?
    var phone: String?
    var price: String?
    var rating: Double?
    var reviewCount: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case displayPhone = "display_phone"
        case isClose = "is_close"
        case imageUrl = "image_url"
        case reviewCount = "review_count"
        
        case id
        case alias
        case categories
        case coordinates
        case distance
        case location
        case name
        case phone
        case price
        case rating
        case url
        
    }
}

struct Category: Decodable {
    var alias: String?
    var title: String?
}

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var county: String?
    var displayAddress: [String]?
    var state: String?
    var zipCode: String?
    
    enum CodingKeys: String, CodingKey {
        
        case zipCode = "zip_code"
        case displayAddress = "isplay_address"
        
        case address1
        case address2
        case address3
        case city
        case county
        case state
    }
}
