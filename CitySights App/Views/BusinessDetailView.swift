//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Rakhyun Kim on 10/3/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @Environment(BusinessModel.self) var model
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        let business = model.selectedBusiness
        
        VStack(spacing: 0) {
            
            ZStack(alignment:.trailing) {
                Image("detail-placeholder-image")
                    .resizable()
                
                VStack {
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.bottom, 120)
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                            .opacity(0.8)
                    })
                }
                VStack {
                    Spacer() // to down to the bottom left
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)

                }
            }
            .frame(height: 164)
            
            if let isClosed = business?.isClosed {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundStyle(isClosed ? .red : .green)
                    Text(isClosed ? "Closed" : "Open")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                .frame(height: 36)
            }
            
            ScrollView {
                VStack (alignment: .leading, spacing: 0){
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                    Text("\(business?.location?.state ?? ""), \(business?.location?.zipCode ?? ""), \(business?.location?.country ?? "")")
                        .padding(.bottom, 10)
                    
                    Image("regular_\(business?.rating ?? 0)")
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        Text(business?.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "globe")
                        Text(business?.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reivews")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BusinessDetailView()
}
