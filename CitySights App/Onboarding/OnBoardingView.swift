//
//  OnBoardingView.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 11/2/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    @Environment(BusinessModel.self) var model
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        
        ZStack {
            
            if selectedViewIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            }
            else {
                Color(.blue)
            }
            
            TabView (selection: $selectedViewIndex) {
                
                OnboardingVIewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                                      headline: "Welcome to City Sights", subHeadline: "City sights helps you find the best of the city!") {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                    
                }
                                      .tag(0)
                                      .ignoresSafeArea()
                
                OnboardingVIewDetails(bgColor: Color(.blue),
                                      headline: "Discover your city", subHeadline: "We`ll show you the best restaurants, venues, and more, based on your location!") {
                    // Ask user for permission to locate
                    model.getUserLocation()
                    dismiss()
                }
                                      .tag(1)
                                      .ignoresSafeArea()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack (spacing: 16){
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnBoardingView()
}
