//
//  BusinessPromotionGridView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import SwiftUI
import PhotosUI
import UIKit
import Kingfisher

struct BusinessPromotionGridView: View {
    
    let businessPromotionPost: BusinessPromotionPost
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = UIScreen.main.bounds.width - 2
    
    init(businessPromotionPost: BusinessPromotionPost) {
        self.businessPromotionPost = businessPromotionPost
    }
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            LazyVGrid(columns: gridItems, spacing: 1) {
                
                VStack {
                    HStack {
                        KFImage(URL(string: businessPromotionPost.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension, height: imageDimension)
                            .clipped()
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Description: \(businessPromotionPost.description)")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(4)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text("Quantity: \(businessPromotionPost.quantity)")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(4)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text("Price: \(businessPromotionPost.price.formatted())")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(4)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text("Promotion Start Date: \(businessPromotionPost.startTime.dateValue(), format: .dateTime.month().day().year())")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(4)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text("Promotion End Date: \(businessPromotionPost.endTime.dateValue(), format: .dateTime.month().day().year())")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(4)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                    Divider()
                }
            }
        }
    }
}

#Preview {
    BusinessPromotionGridView(businessPromotionPost: BusinessPromotionPost.MOCK_POSTS[0])
}
