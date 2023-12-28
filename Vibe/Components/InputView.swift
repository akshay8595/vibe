//
//  InputView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 12/26/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var secureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.footnote)
            
            if secureField {
                SecureField(placeholder, text: $text).font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text).font(.system(size: 14))
            }
        
        }
        
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(
            text: .constant(""),
            title: "Preview Example",
            placeholder: "This is a preview example.")
    }
}
