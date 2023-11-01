//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/2/23.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
    var body: some Scene {
        
        @State var model = BusinessModel()
        
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
