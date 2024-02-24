//
//  FeedViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/9/24.
//

import Foundation
import Firebase
import CoreLocation
import MapKit

class FeedViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var posts = [Post]()
    @Published var userLocation: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        print("DEBUG: Entered into fetchPosts func")
        locationManager.requestLocation()
        print("DEBUG: User Location is latitude: \(userLocation.latitude) and longitude: \(userLocation.longitude)")
        let feedPosts = try await PostService.fetchFeedPosts()
        var postNearUser = [Post]()
        for post in feedPosts {
            if (post.latitude >= (userLocation.latitude - 0.5)
                && post.latitude <= (userLocation.latitude + 0.5)
                && post.longitude >= (userLocation.longitude - 0.5)
                && post.longitude <= (userLocation.longitude + 0.5)) {
                postNearUser.append(post)
            }
        }
        self.posts = postNearUser
    }
    
    @MainActor
    func updateUserLocation() async throws {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("DEBUG: Location callback received")
        if let userLocation = locations.last?.coordinate {
            print("DEBUG: User Location Received is \(userLocation)")
            self.userLocation = userLocation
        } else {
            print("DEBUG: User Location Not Received")
        }
        locationManager.stopUpdatingLocation() // swiftui repeatedly updates. We only need to get users location once.
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("DEBUG: Error during retrieving location is \(error)")
    }
}
