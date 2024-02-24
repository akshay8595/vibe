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
            VStack(alignment: .leading, spacing: 8) {
                ScrollView {
                    ForEach(businessPromotionViewModel.allPosts) { post in
                        VStack(alignment: .leading, spacing: -5) {
                            
                            BusinessPromotionCell(post: post)
                            
                            Button() {
                                print("Purchase")
                            } label: {
                                Text("BUY")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 70, height: 25)
                                    .background(Color.themeColor)
                                    .cornerRadius(8)
                                    .padding(.leading, 30)
                            }
                        }
                    }
                }
                .onAppear(perform: {
                    Task {
                        try await businessPromotionViewModel.fetchPromotionsNearMe()
                    }
                })
                .navigationTitle("Deals Near You")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    PromotionsNearUserView(user: VibeUser.MOCK_USERS[0])
}
