//
//  TextFieldModifier.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/2/24.
//

import SwiftUI

// TODO - Not in use, deprecate.
struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
            .padding(.top)
    }
}
