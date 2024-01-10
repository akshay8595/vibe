//
//  VibeUser.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/2/24.
//

import Foundation
import Firebase

struct VibeUser: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension VibeUser {
    static var MOCK_USERS: [VibeUser] = [
        .init(id: NSUUID().uuidString, username: "akshay", profileImageUrl: nil, fullname: "Akshay Bhasin", bio: "Vibes Test User 1", email: "akshay@gmail.com"),
        .init(id: NSUUID().uuidString, username: "bhasin", profileImageUrl: nil, fullname: "Akshay Bhasin", bio: "Vibes Test User 2", email: "bhasin@gmail.com"),
        .init(id: NSUUID().uuidString, username: "daniella", profileImageUrl: nil, fullname: "Daniella Rodriguez", bio: "Vibes Test User 3", email: "daniella@gmail.com"),
        .init(id: NSUUID().uuidString, username: "isabel", profileImageUrl: nil, fullname: "Daniella Rodriguez", bio: "Vibes Test User 4", email: "isabel@gmail.com"),
        .init(id: NSUUID().uuidString, username: "rodriguez", profileImageUrl: nil, fullname: "Daniella Rodriguez", bio: "Vibes Test User 5", email: "rodriguez@gmail.com")
    ]
}
