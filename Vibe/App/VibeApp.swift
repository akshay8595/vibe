//
//  VibeApp.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/26/23.
//

import SwiftUI
import Firebase

@main
struct VibeApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
