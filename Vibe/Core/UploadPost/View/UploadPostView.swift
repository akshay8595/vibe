//
//  UploadPostView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/4/24.
//

import SwiftUI
import PhotosUI

// TODO - Not in use, deprecate.
struct UploadPostView: View {
    @State private var caption = ""
    @State private var tag = ""
    @State private var imagePickerPresented = false
    @State private var photoItem: PhotosPickerItem?
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(Color.themeColor)
                }
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.themeColor)
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption, tag: tag)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .foregroundStyle(Color.themeColor)
                        
                }
            }
            .padding(.horizontal)
            
            // post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                VStack {
                    TextField("Tag your #vibe", text: $tag, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Enter your caption", text: $caption, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                }
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        tag = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
