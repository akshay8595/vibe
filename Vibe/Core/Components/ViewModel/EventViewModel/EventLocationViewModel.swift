//
//  EventLocationViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/24/24.
//

import Foundation
import CoreLocation
import Combine
import FirebaseFirestore

class EventLocationViewModel: ObservableObject {
    
    @Published var user: VibeUser
    @Published var name: String = ""
    @Published var description = ""
    @Published var capacity: Int = 0
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    
    init(user: VibeUser) {
        self.user = user
    }
    
    func addEvent(location: CLLocationCoordinate2D) async throws {
        let documentRef = Firestore.firestore().collection("events").document()
        var data = [String: Any]()
    
        data["id"] = NSUUID().uuidString
        data["ownerUid"] = self.user.id
        data["description"] = description
        data["name"] = name
        data["capacity"] = capacity
        data["startTime"] = startTime
        data["endTime"] = endTime
        data["latitude"] = location.latitude
        data["longitude"] = location.longitude
        data["attendees"] = [self.user.id]
        try await documentRef.setData(data)
    }
    
}
