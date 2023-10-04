//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/3/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "")
    }
}

#Preview {
    BusinessDetailView()
}
