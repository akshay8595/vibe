//
//  BusinessProfileTabBarButton.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import SwiftUI

struct BusinessProfileTabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.regular)
            .padding(5)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .cornerRadius(2)
            .background(isSelected ? Color.blue : Color.white)
            .foregroundColor(isSelected ? .white : .black)
    }
}

struct BusinessProfileTabBarButton_Preview : PreviewProvider {
    static var previews: some View {
        BusinessProfileTabBarButton(text: "Promotions", isSelected: .constant(true))
    }
}
