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
    
    @State var query: String = ""
    @FocusState var queryBoxFocused: Bool
    @State var showOptions = false
    
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "restaurants"
    
   
    
    var body: some View {
        @Bindable var model = model
        
        VStack{
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation{
                            showOptions = true
                        }
                    }
                
                Button(action: {
                    withAnimation {
                        showOptions = false
                        queryBoxFocused = false
                    }
                    
                    // Peorform a serch
                    model.getbusinesses(query: query,
                                        options: getOptionString(),
                                        category: categorySelection)
                }, label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                })
            }
            .padding(.horizontal)
            
            // Query option. show if textbox is focused
            if showOptions {
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            
                            Text("arts")
                                .tag("arts")
                        }
                    }
                }
                .padding(.horizontal, 40)
                .transition(.push(from: .top))
            }
            // Show picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            // Show map or list
            if model.locationAuthStatus == .denied {
                Text("Please allow location services for this app to see sights near you.")
                    .padding(.horizontal)
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text("Opne Privacy settings")
                }
                .buttonStyle(.bordered)

            }
            if selectedTab == 1 {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
            else {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionString() -> String {
        
        var optionArray = [String]()
        if popularOn {
            optionArray.append("hot_and_new")
        }
        if dealsOn {
            optionArray.append("deals")
        }
        return optionArray.joined(separator: ",")
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
