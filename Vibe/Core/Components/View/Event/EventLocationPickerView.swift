//
//  EventLocationPickerView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/25/24.
//

import SwiftUI
import MapKit

struct EventLocationPickerView: View {
    
    @Binding var showLocationSearchView: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "mappin")
                .font(.title2)
                .foregroundColor(Color(.darkGray))
                .background(.white)
                .padding(.leading, 20)
                .shadow(color: .black, radius: 6)
            
            Text("Event Location")
                .font(.title2)
                .foregroundColor(Color(.darkGray))
                .padding(.leading, 10)
            
            Spacer()
        }
        .frame(height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black, radius: 6)
        )
    }
}

#Preview {
    EventLocationPickerView(showLocationSearchView: .constant(true))
}
