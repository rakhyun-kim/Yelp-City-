//
//  OnboardingVIewDetails.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 11/2/23.
//

import SwiftUI

struct OnboardingVIewDetails: View {
    
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        
        ZStack {
            
            Color(bgColor)
            
            VStack(spacing: 0) {
                
                Spacer()
                Image("onboarding")
                
                Text(headline)
                    .font(Font.system(size: 23))
                    .bold()
                    .padding(.top, 32)
                
                Text(subHeadline)
                    .padding()
                
                Spacer()
                
                Button {
                    
                    buttonAction()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(.white)
                            .frame(height: 45)
                            .padding()
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.bottom, 115)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingVIewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255),
                          headline: "Welcome to City Sights", subHeadline: "City sights helps you find the best of the city!") {
        // Nothing
    }
}
