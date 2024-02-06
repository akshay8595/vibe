//
//  AddBusinessPromotionViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/15/24.
//

import Foundation
import PhotosUI
import Firebase
import SwiftUI

@MainActor
class AddBusinessPromotionViewModel: ObservableObject {
    
    @Published var user: VibeUser
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromImage: selectedImage) } }
    }
    
    @Published var promotionImage: Image?
    @Published var description = ""
    @Published var price: Double = 0.0
    @Published var quantity: Int = 0
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    
    
    private var uiImage: UIImage?
    
    init(user: VibeUser) {
        self.user = user
    }
    
    
    func loadImage(fromImage item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.promotionImage = Image(uiImage: uiImage)
        
    }
    
    func uploadPromotionData() async throws {
        
        let documentRef = Firestore.firestore().collection("promotions").document()
        var data = [String: Any]()
    
        if let uiImage = uiImage {
            let  imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["imageUrl"] = imageUrl
        }
        
        data["id"] = NSUUID().uuidString
        data["ownerUid"] = self.user.id
        data["description"] = description
        data["price"] = price
        data["quantity"] = quantity
        data["startTime"] = startTime
        data["endTime"] = endTime
        
        try await documentRef.setData(data)
        
    }
    
}
