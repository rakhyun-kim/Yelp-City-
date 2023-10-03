//
//  ContentView.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var query = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What are you looking for", text: $query)
            Button(action: {
                
            }, label: {
                Text("Go")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
            })
        }
        .padding()
        .task {
           await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
