//
//  MainTabView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/31/23.
//

import SwiftUI

struct MainTabView: View {
    let user: VibeUser
    @State private var selectedIndex = 0
    
    var body: some View {
        
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear() {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            SearchView()
                .onAppear() {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            JoinView(user: user)
                .onAppear() {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            
            PromotionsNearUserView(user: user)
                .onAppear() {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "giftcard.fill")
                }
                .tag(3)
            
            CurrentUserProfileView(user: user)
                .onAppear() {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
            
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews : PreviewProvider {
    static var previews: some View {
        MainTabView(user: VibeUser.MOCK_USERS[0])
    }
}
