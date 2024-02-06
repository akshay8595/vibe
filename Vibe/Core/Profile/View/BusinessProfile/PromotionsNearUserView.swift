//
//  PromotionsNearUserView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/17/24.
//

import SwiftUI

struct PromotionsNearUserView: View {
    
    @StateObject var businessPromotionViewModel: BusinessPromotionViewModel
    
    init(user: VibeUser) {
        self._businessPromotionViewModel = StateObject(wrappedValue: BusinessPromotionViewModel(user: user))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.themeColor)]
    }
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                ScrollView {
                    ForEach(businessPromotionViewModel.allPosts) { post in
                        BusinessPromotionCell(post: post)
                    }
                }
                .navigationTitle("Deals Near You")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    PromotionsNearUserView(user: VibeUser.MOCK_USERS[0])
}
