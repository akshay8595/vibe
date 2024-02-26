//
//  PastBusinessPromotionsView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import SwiftUI

struct PastBusinessPromotionsView: View {
    
    @StateObject var viewModel: BusinessPromotionViewModel

    init(user: VibeUser) {
        self._viewModel = StateObject(wrappedValue: BusinessPromotionViewModel(user: user))
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.pastPosts) { businessPromotion in
                BusinessPromotionGridView(businessPromotionPost: businessPromotion)
            }
        }
        .onAppear(perform: {
            Task {
                do {
                    try await viewModel.fetchPastPromotions()
                } catch {
                    print("Error Received is \(error)")
                }
            }
        })
        .refreshable {
            Task {
                do {
                    try await viewModel.fetchPastPromotions()
                } catch {
                    print("Error Received is \(error)")
                }
            }
        }
    }
}

#Preview {
    PastBusinessPromotionsView(user: VibeUser.MOCK_USERS[0])
}
