//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/2/23.
//

import SwiftUI

@main
struct CitySights: App {
    
    @State var model = BusinessModel()
    @AppStorage("Onboarding") var needsOnboarding = true
    
    var body: some Scene {
        
        WindowGroup {
            HomeView()
                .environment(model)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // on dismiss
                    needsOnboarding = false
                } content: {
                    OnBoardingView()
                        .environment(model)
                       
                }
                .onAppear {
                    // If no onboarding is needed, still get location
                    if needsOnboarding == false {
                        model.getUserLocation()
                    }
                }


        }
    }
}
