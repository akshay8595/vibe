//
//  ProfileHeaderView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/4/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: VibeUser
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10) {
            // picture and status
            HStack {
                CircularProfileImageView(user: user, size: .large)
                    
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatsView(value: 3, title: "Posts")
                    UserStatsView(value: 3, title: "Followers")
                    UserStatsView(value: 3, title: "Following")
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 4)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow user..")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            }
            
            Divider()
            
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: VibeUser.MOCK_USERS[4])
}
