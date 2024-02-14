//
//  LoginView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/26/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                // image
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 10.0)
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $viewModel.email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    
                    InputView(text: $viewModel.password,
                              title: "Password",
                              placeholder: "Enter your password",
                              secureField: true)
                    .disableAutocorrection(true)
                    
                    Divider()
                    
                    Toggle(isOn: $viewModel.businessAccount) {
                        Text("Business Account")
                            .fontWeight(.semibold)
                            .font(.footnote)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // forgot password
                Button {
                    print("Forgot Password?")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                
                
                // sign in button
                
                Button {
                        Task {
                            try await viewModel.signIn()
                        }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 40)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // sign up button
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 18))
                }.padding(10)
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
