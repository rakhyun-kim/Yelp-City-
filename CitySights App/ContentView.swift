//
//  ContentView.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var businesses = [Business]()
    @State var query = ""
    var service = DataService()
    
    var body: some View {
        VStack{
            HStack {
                TextField("What are you looking for", text: $query)
                Button(action: {
                    // TODO: Implement query
                }, label: {
                    Text("Go")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                })
                
            }
            List (businesses) { b in
                Text(b.name ?? "Nil")
            }
            .padding()
            .task {
                businesses = await service.businessSearch()
            }
        }
    }
}

#Preview {
    ContentView()
}
