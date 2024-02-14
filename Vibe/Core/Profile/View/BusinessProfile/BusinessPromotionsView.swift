//
//  BusinessPromotionsView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import SwiftUI

struct BusinessPromotionsView: View {
    
    @StateObject var viewModel: BusinessPromotionViewModel
    
    init(user: VibeUser) {
        self._viewModel = StateObject(wrappedValue: BusinessPromotionViewModel(user: user))
    }
    
    var body: some View {
        
        ScrollView {
            ForEach(viewModel.posts) { businessPromotion in
                BusinessPromotionGridView(businessPromotionPost: businessPromotion)
            }
        }
        .refreshable {
            Task {
                do {
                    try await viewModel.fetchPromotionPosts()
                } catch {
                    print("Error Received is \(error)")
                }
            }
        }
        
    }
}

#Preview {
    BusinessPromotionsView(user: VibeUser.MOCK_USERS[0])
}
