//
//  ContentView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                UserProfileView()
            } else {
                LoginView()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
