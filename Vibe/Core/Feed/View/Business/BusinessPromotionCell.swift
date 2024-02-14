//
//  BusinessPromotionCell.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/15/24.
//

import SwiftUI
import Kingfisher

struct BusinessPromotionCell: View {
    
    let post: BusinessPromotionPost
    
    var body: some View {
        HStack {
            if post.imageUrl != "" {
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100) // TODO Change this size by variable
                    .clipShape(Circle())
                
            } else {
                Image(systemName: "giftcard.fill")
                    .resizable()
                    .frame(width: 100, height: 100) // TODO Change this size by variable
                    .clipShape(Circle())
                    .foregroundColor(Color(.systemGray4))
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Deal: \(post.description)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Text("Price:  ")
                    .font(.subheadline)
                    .fontWeight(.bold) + Text("\(post.price, format: .number)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Valid Till: ")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/) + Text("\(post.endTime.dateValue(), format: .dateTime.month().day().year())")
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
    }
}

#Preview {
    BusinessPromotionCell(post: BusinessPromotionPost.MOCK_POSTS[0])
}
