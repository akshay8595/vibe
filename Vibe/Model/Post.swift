//
//  Post.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/3/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: VibeUser?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 1",
            likes: 100,
            imageUrl: "testImage1",
            timestamp: Timestamp(),
            user: VibeUser.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 2",
            likes: 100,
            imageUrl: "testImage2",
            timestamp: Timestamp(),
            user: VibeUser.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 3",
            likes: 100,
            imageUrl: "testImage3",
            timestamp: Timestamp(),
            user: VibeUser.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 3",
            likes: 170,
            imageUrl: "testImage2",
            timestamp: Timestamp(),
            user: VibeUser.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 4",
            likes: 150,
            imageUrl: "testImage1",
            timestamp: Timestamp(),
            user: VibeUser.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 5",
            likes: 200,
            imageUrl: "testImage2",
            timestamp: Timestamp(),
            user: VibeUser.MOCK_USERS[2]
        )
    ]
}
