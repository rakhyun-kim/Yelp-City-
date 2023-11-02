//
//  ContentView.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/2/23.
//

import SwiftUI

struct HomeView: View {
 
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
    
    var body: some View {
        @Bindable var model = model
        
        VStack{
            HStack {
                TextField("What are you looking for", text: $model.query)
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
            // Show picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            // Show map or list
            if selectedTab == 1 {
                MapView()
            }
            else {
                ListView()
            }
            
            }
        .onAppear(perform: {
            model.getbusinesses()
        })
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
