//
//  AddBusinessPromotionView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import SwiftUI
import PhotosUI

struct AddBusinessPromotionView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var addPromotionViewModel: AddBusinessPromotionViewModel
    
    init(user: VibeUser) {
        self._addPromotionViewModel = StateObject(wrappedValue: AddBusinessPromotionViewModel(user: user))
    }
    
    var body: some View {
        
        VStack {
            PhotosPicker(selection: $addPromotionViewModel.selectedImage) {
                VStack {
                    if let image = addPromotionViewModel.promotionImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: addPromotionViewModel.user,
                                                 size: .large)
                    }
                    
                    Text("Add Promotion Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            TextField("Enter Description", text: $addPromotionViewModel.description)
                .font(.headline)
                .fontWeight(.heavy)
                .padding(10)
            
            TextField("Enter Price", value: $addPromotionViewModel.price, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
                .font(.headline)
                .fontWeight(.heavy)
                .padding(10)
            
            
            TextField("Quantity", value: $addPromotionViewModel.quantity, format: .number)
                .keyboardType(.numberPad)
                .font(.headline)
                .fontWeight(.heavy)
                .padding(10)
            
            DatePicker("Start Date For Promotion", selection: $addPromotionViewModel.startTime, displayedComponents: .date)
                .padding(.horizontal, 10)
            
            
            DatePicker("End Date For Promotion", selection: $addPromotionViewModel.endTime, displayedComponents: .date)
                .padding(.horizontal, 10)
            
            Spacer()
            
            Button {
                Task {
                    try await addPromotionViewModel.uploadPromotionData()
                    dismiss()
                }
            } label: {
                Text("Upload Promotion")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
            }
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .accentColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    AddBusinessPromotionView(user: VibeUser.MOCK_USERS[0])
}
