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
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
        
    }
}
