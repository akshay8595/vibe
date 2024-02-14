//
//  BusinessPromotion.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import Foundation
import Firebase

struct BusinessPromotionPost: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let description: String
    let price: Decimal
    let quantity: Int
    let imageUrl: String
    let startTime: Timestamp
    let endTime: Timestamp
    var user: VibeUser?
}

extension BusinessPromotionPost {
    static var MOCK_POSTS: [BusinessPromotionPost] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            description: "Buy 2 Cortado, Get 1 50% off",
            price: 8.99,
            quantity: 5,
            imageUrl: "testImage1",
            startTime: Timestamp(),
            endTime: Timestamp(),
            user: VibeUser.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            description: "Buy 2 Tacos, Get 1 free",
            price: 7.99,
            quantity: 5,
            imageUrl: "testImage1",
            startTime: Timestamp(),
            endTime: Timestamp(),
            user: VibeUser.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            description: "Buy 1 Pizza, Get 1 Free",
            price: 19.99,
            quantity: 5,
            imageUrl: "testImage1",
            startTime: Timestamp(),
            endTime: Timestamp(),
            user: VibeUser.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            description: "Get 20% off on haircut",
            price: 24.99,
            quantity: 5,
            imageUrl: "testImage1",
            startTime: Timestamp(),
            endTime: Timestamp(),
            user: VibeUser.MOCK_USERS[0]
        )
    ]
}
