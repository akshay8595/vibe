//
//  BusinessPromotionViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/15/24.
//

import Foundation
import Firebase
import SwiftUI


class BusinessPromotionViewModel: ObservableObject {
    
    private let user: VibeUser
    @Published var posts = [BusinessPromotionPost]()
    @Published var pastPosts = [BusinessPromotionPost]()
    @Published var allPosts = [BusinessPromotionPost]()
    
    init(user: VibeUser) {
        self.user = user
    }
    
    @MainActor
    func fetchPromotionPosts() async throws {
        self.posts = try await PostService.fetchBusinessPromotionPosts(uid: self.user.id)
    }
    
    @MainActor
    func fetchPastPromotions() async throws {
        self.pastPosts = try await PostService.fetchPastBusinessPromotions(uid: self.user.id)
    }
    
    @MainActor
    func fetchPromotionsNearMe() async throws {
        self.allPosts = try await PostService.fetchAllPromotions()
    }
}
