//
//  BusinessProfileView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import SwiftUI

struct BusinessProfileView: View {
    
    let user: VibeUser
    @State private var selectedTab: Int = 0
    
    let tabs: [Tab] = [
            .init(title: "Promotions"),
            .init(title: "Past Promotions"),
            .init(title: "New Promotion")
        ]
    
    init(user: VibeUser) {
        self.user = user
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.themeColor)]
    }
    
    var body: some View {
       
        NavigationStack {
            GeometryReader { geo in
                    VStack(spacing: 0) {
                        
                        Spacer()
                        // Tabs
                        BusinessProfileHeaderView(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
                        
                        // Views
                        TabView(selection: $selectedTab,
                                content: {
                            BusinessPromotionsView(user: user)
                                .tag(0)
                            
                            PastBusinessPromotionsView(user: user)
                                .tag(1)
                            
                            AddBusinessPromotionView(user: user)
                                .tag(2)
                        })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                    }
                    .navigationTitle("Business Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                AuthService.shared.signout()
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(Color.themeColor)
                            }
                        }
                    }
                
            }
        }
        .accentColor(Color.themeColor)
    }
}

#Preview {
    BusinessProfileView(user: VibeUser.MOCK_USERS[0])
}
