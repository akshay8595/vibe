//
//  EditProfileView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/7/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var editProfileViewModel: EditProfileViewModel
    
    init(user: VibeUser) {
        self._editProfileViewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
                                                 
    var body: some View {

        VStack {
            // toolbar
            
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await editProfileViewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    
                }
                .padding(.horizontal)
                Divider()
                
            }
            
            // edit profile pic
            PhotosPicker(selection: $editProfileViewModel.selectedImage) {
                VStack {
                    if let image = editProfileViewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: editProfileViewModel.user,
                                                 size: .large)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            // edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $editProfileViewModel.fullname)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $editProfileViewModel.bio)
            }
            
            Spacer()
        }
        
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView(user: VibeUser.MOCK_USERS[0])
}
