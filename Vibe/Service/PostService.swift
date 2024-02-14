//
//  PostService.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/10/24.
//

import Firebase
import SwiftUI

struct PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    private static let businessPromotionCollection = Firestore.firestore().collection("promotions")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
    
    static func fetchBusinessPromotionPosts(uid: String) async throws -> [BusinessPromotionPost] {
        let snapshot = try await businessPromotionCollection
            .whereField("ownerUid", isEqualTo: uid)
            .whereField("endTime", isGreaterThanOrEqualTo: Timestamp())
            .getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: BusinessPromotionPost.self) })
    }
    
    static func fetchPastBusinessPromotions(uid: String) async throws -> [BusinessPromotionPost] {
        let snapshot = try await businessPromotionCollection
            .whereField("ownerUid", isEqualTo: uid)
            .whereField("endTime", isLessThanOrEqualTo: Timestamp())
            .getDocuments()
        
        return try snapshot.documents.compactMap({ try $0.data(as: BusinessPromotionPost.self) })
    }
    
    static func fetchAllPromotions() async throws -> [BusinessPromotionPost] {
        let snapshot = try await businessPromotionCollection.getDocuments()
        print("DEBUG: Business Promotion Document is \(snapshot.documents)")
        return try snapshot.documents.compactMap({ try $0.data(as: BusinessPromotionPost.self) })
    }
}
