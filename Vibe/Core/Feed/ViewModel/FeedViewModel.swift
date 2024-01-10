//
//  FeedViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/9/24.
//

import Foundation
import Firebase


class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
