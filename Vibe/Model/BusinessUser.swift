//
//  BusinessUser.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/11/24.
//

import Foundation
import Firebase


//
// Business User data model. This will be used to register the business user.
//
struct BusinessUser: Identifiable, Hashable, Codable {
    let id: String
    var userName: String
    var displayName: String
    let email: String
    var profileImageUrl: String?
    var bio: String?
    
    var isBusinessUserAccount: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return id == currentUid
    }
}

// TODO: Remove this and fetch the business user during fetch of business promotions.
extension BusinessUser {
    static var DEFAULT_USER: BusinessUser = .init(id: NSUUID().uuidString,
                                                  userName: "vibeAdmin",
                                                  displayName: "Special Promotions",
                                                  email: "vibeadmin@gmail.com",
                                                  profileImageUrl: nil,
                                                  bio: "Vibe Administrator")
}

extension BusinessUser {
    static var MOCK_USER: [BusinessUser] = [
        .init(id: NSUUID().uuidString, userName: "grilledCheese", displayName: "Texas Grilled Cheese", email: "grilledCheese@gmail.com", profileImageUrl: nil, bio: "Worlds best grilled cheese"),
        .init(id: NSUUID().uuidString, userName: "bagelCafe", displayName: "Bagel Cafe", email: "bagelCafe@gmail.com", profileImageUrl: nil, bio: "NYs best bagels"),
        .init(id: NSUUID().uuidString, userName: "pizzaCorner", displayName: "Pizza Corner", email: "pizzaCorner@gmail.com", profileImageUrl: nil, bio: "Thinnest Pizza ever"),
        .init(id: NSUUID().uuidString, userName: "learnMath", displayName: "Math for middle school", email: "learnMath@gmail.com", profileImageUrl: nil, bio: "Teaching Math to Middle school"),
        .init(id: NSUUID().uuidString, userName: "nyCarWash", displayName: "Car Wash", email: "nyCarWash@gmail.com", profileImageUrl: nil, bio: "Best Car Wash in Queens")
    ]
}
