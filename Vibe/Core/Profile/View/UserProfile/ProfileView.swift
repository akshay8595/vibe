//
//  ProfileView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/31/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: VibeUser
    
    var body: some View {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: VibeUser.MOCK_USERS[1])
    }
}
