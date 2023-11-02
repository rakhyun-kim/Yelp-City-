//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/2/23.
//

import SwiftUI

@main
struct CitySights: App {
    var body: some Scene {
        
        @State var model = BusinessModel()
        
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: Binding.constant(true)) {
                    // TODO
                } content: {
                    OnBoardingView()
                       
                }


        }
    }
}
