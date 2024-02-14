//
//  LoginViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/7/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var businessAccount = false
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
