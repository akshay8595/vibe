//
//  UploadPostViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/4/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

/**
 Uploads the user's post. This will be valid for 26 hours.
 */
class UploadPostViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var postImage: Image?
        
    private var uiImage: UIImage?
    private let locationManager = CLLocationManager()
    private var userLocation: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String, tag: String) async throws {
        await updateUserLocation()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, tag: tag, likes: 0, imageUrl: imageUrl, timestamp: Timestamp(), latitude: userLocation.latitude, longitude: userLocation.longitude)
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {
            print("DEBUG: Failed to encode user post")
            return
        }
        try await postRef.setData(encodedPost)
    }
    
    // function to do a most recent update on user's location.
    private func updateUserLocation() async {
        locationManager.startUpdatingLocation()
    }
    
    // MARK: User Location Update Callback.
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        if let userLocation = locations.last?.coordinate {
            print("DEBUG: User Location Received during uploading post is \(userLocation)")
            self.userLocation = userLocation
        } else {
            print("DEBUG: User Location could not be received during upload post")
        }
        locationManager.stopUpdatingLocation() // swiftui repeatedly updates. We only need to get users location once.
    }
    
}

