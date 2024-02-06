//
//  UserStatsView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/1/24.
//

import SwiftUI

// TODO - Not in use, deprecate.
struct UserStatsView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatsView(value: 100, title: "Posts")
}
