//
//  SearchViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/7/24.
//

import Foundation

// TODO - Not in use, deprecate.
class SearchViewModel: ObservableObject {
    @Published var users = [VibeUser]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
}
