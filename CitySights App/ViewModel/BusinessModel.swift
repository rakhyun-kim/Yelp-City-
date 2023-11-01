//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 11/1/23.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
   
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    
    var service = DataService()
    
    func getbusinesses() {
        Task {
            businesses = await service.businessSearch()
        }
    }
}
