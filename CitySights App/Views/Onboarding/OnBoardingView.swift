//
//  OnBoardingView.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 11/2/23.
//

import SwiftUI

struct OnBoardingView: View {
    

    var body: some View {
        
        TabView {
           
            OnboardingVIewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                   headline: "Welcome to City Sights", subHeadline: "City sights helps you find the best of the city!") {
                 print("First")
            }
            .ignoresSafeArea()
            
            OnboardingVIewDetails(bgColor: Color(.blue),
                                   headline: "Discover your city", subHeadline: "We`ll show you the best restaurants, venues, and more, based on your location!") {
                 print("Second")
            }
            .ignoresSafeArea()
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingView()
}
