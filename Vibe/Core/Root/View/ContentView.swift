//
//  ContentView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel2 = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        
        Group {
            
            if viewModel2.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = viewModel2.currentUser {
                if let businessUser = currentUser.businessUser {
                    if businessUser == true {
                        BusinessProfileView(user: currentUser)
                    } else {
                        MainTabView(user: currentUser)
                    }
                } else {
                    MainTabView(user: currentUser)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewModel())
}
