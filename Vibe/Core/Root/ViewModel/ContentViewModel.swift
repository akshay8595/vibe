//
//  ContentViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/6/24.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: VibeUser?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession
            .sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser
            .sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
        
    }
}
