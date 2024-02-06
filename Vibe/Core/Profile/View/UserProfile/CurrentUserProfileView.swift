//
//  CurrentUserProfileView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/3/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: VibeUser
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: VibeUser.MOCK_USERS[2])
}
