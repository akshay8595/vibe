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
    let tag: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let latitude: Double
    let longitude: Double
    var user: VibeUser?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 1",
            tag: "#food",
            likes: 100,
            imageUrl: "testImage1",
            timestamp: Timestamp(),
            latitude: 40.7475,
            longitude: -73.957778,
            user: VibeUser.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 2",
            tag: "#coffee",
            likes: 100,
            imageUrl: "testImage2",
            timestamp: Timestamp(),
            latitude: 40.7475,
            longitude: -73.957778,
            user: VibeUser.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 3",
            tag: "#tennis",
            likes: 100,
            imageUrl: "testImage3",
            timestamp: Timestamp(),
            latitude: 40.7775,
            longitude: -72.957778,
            user: VibeUser.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 3",
            tag: "#bowling",
            likes: 170,
            imageUrl: "testImage2",
            timestamp: Timestamp(),
            latitude: 40.7775,
            longitude: -73.997778,
            user: VibeUser.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 4",
            tag: "#gym",
            likes: 150,
            imageUrl: "testImage1",
            timestamp: Timestamp(),
            latitude: 42.7475,
            longitude: -73.957778,
            user: VibeUser.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Test Caption 5",
            tag: "#exercise",
            likes: 200,
            imageUrl: "testImage2",
            timestamp: Timestamp(),
            latitude: 41.7475,
            longitude: -73.957778,
            user: VibeUser.MOCK_USERS[2]
        )
    ]
}
