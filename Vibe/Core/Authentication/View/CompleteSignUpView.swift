//
//  CompleteSignUpView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/2/24.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        
        // text fields
        VStack(spacing: 12) {
            
            Spacer()
            
            Text("Welcome to Vibe, \(viewModel.username) !")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Text("Click below to complete registration and start using Vibe")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Button {
                Task { try await viewModel.createAccount() }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        Spacer()
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static let viewModel = RegistrationViewModel()    
    static var previews: some View {
        CompleteSignUpView()
            .environmentObject(viewModel)
    }
}
