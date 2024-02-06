//
//  AuthService.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/6/24.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: VibeUser?
    
    static let shared = AuthService()
    
    init() {
        Task {
            try await loadUserData()
        }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, username: String, businessUser: Bool = false) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email, businessUser: businessUser)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
        print("DEBUG: Snapshot data is \(self.currentUser!)")
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    @MainActor
    func uploadBusinessUserData(uid: String, username: String, email: String, displayName: String, bio: String) async {
        let user = BusinessUser(id: uid, userName: username, displayName: displayName, email: email, bio: bio)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("businessusers").document(user.id).setData(encodedUser)
    }
    
    private func uploadUserData(uid: String, username: String, email: String, businessUser: Bool) async {
        print("DEBUG: Uploading user data with business user value as \(businessUser)")
        let user = VibeUser(id: uid, username: username, email: email, businessUser: businessUser)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
}
