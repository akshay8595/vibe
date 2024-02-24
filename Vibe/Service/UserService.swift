//
//  UserService.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/7/24.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchUser(withUid uid: String) async throws -> VibeUser {
        print("DEBUG: Fecthing User with UUID \(uid)")
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        print("DEBUG: Got User with UUID \(uid)")
        
        print("DEBUG: Data received is \(String(describing: snapshot.data()))")
        return try snapshot.data(as: VibeUser.self)

    }
    
    static func fetchAllUsers() async throws -> [VibeUser] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: VibeUser.self) })
    }
    
}
