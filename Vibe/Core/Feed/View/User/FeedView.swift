//
//  FeedView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/1/24.
//

import SwiftUI

// TODO - not in use, deprecate.
struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
            }
        }
        .onAppear(perform: {
            Task {
                try await viewModel.fetchPosts()
            }
        })
    }
}

#Preview {
    FeedView()
}
