//
//  RegistrationViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/6/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var bio = ""
    @Published var displayName = ""
    @Published var businessAccount = false
    
    func createAccount() async throws {
        try? await createUser(businessAccount: businessAccount)
        guard let user = AuthService.shared.currentUser else { return }
        if businessAccount {
            try await createBusinessUser(user: user, bio: bio, displayName: displayName)
        }
        clearProperties()
    }
    
    func createUser(businessAccount: Bool = false) async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, username: username, businessUser: businessAccount)
    }
    
    func createBusinessUser(user: VibeUser, bio: String, displayName: String) async throws {
        await AuthService.shared.uploadBusinessUserData(
            uid: user.id, username: user.username, email: user.email, displayName: displayName, bio: bio)
    }
    
    private func clearProperties() {
        username = ""
        email = ""
        password = ""
        bio = ""
        displayName = ""
        businessAccount = false
    }
    
}
