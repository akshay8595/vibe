//
//  RegistrationView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/26/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            // image
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.vertical, 10.0)
            
            // form fields
            VStack(spacing: 20) {
                
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "Enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          secureField: true)
                
                InputView(text: $confirmPassword,
                          title: "Confirm Passwork",
                          placeholder: "Confirm your password",
                          secureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
        
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullname: fullName)
                }
            } label: {
                HStack {
                    Text("REGISTER")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 18))
            }
        }
    }
}

#Preview {
    RegistrationView()
}
