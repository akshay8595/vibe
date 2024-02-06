//
//  BusinessAccountSignUpView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/12/24.
//

import SwiftUI

struct BusinessAccountSignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack( spacing: 12) {
            
            Text("Business Account Information")
                .font(.title2)
                .foregroundColor(.black)
                .padding(25)
            
            TextField("Display Name", text: $viewModel.displayName)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(TextFieldModifier())
            
            TextField("Business bio", text: $viewModel.bio)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(TextFieldModifier())
            
            Spacer()
            
            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
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
    }
}

struct BusinessAccountSignUpView_Previews: PreviewProvider {
    static let viewModel = RegistrationViewModel()
    static var previews: some View {
        BusinessAccountSignUpView()
            .environmentObject(viewModel)
    }
}
