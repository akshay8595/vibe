//
//  EventService.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/29/24.
//

import SwiftUI
import Foundation
import Firebase
import CoreLocation

struct EventService {
    
    private static let eventCollection = Firestore.firestore().collection("events")
    private static let latitudeRange: Double = 0.5
    private static let longitudeRange: Double = 0.5
    
    static func fetchEventsByLocation(location: CLLocationCoordinate2D) async throws -> [Event] {
        print("DEBUG: EventService fetchEventsByLocation called for location \(location)")
        
        // you cannot query on both latitude and longitude. You can only query on 1 index.
        // https://stackoverflow.com/questions/56805927/firestore-says-i-have-inequality-filter-on-multiple-properties-when-i-dont
        
        let snapshot = try await eventCollection
            .whereField("latitude", isGreaterThanOrEqualTo: (location.latitude - latitudeRange))
            .whereField("latitude", isLessThanOrEqualTo: (location.latitude + latitudeRange))
            .getDocuments()
        
        // get the events by latitudes and filter by longitudes
        // this is not efficient at all, TODO as a fast follow up with geohash.
        
        var rangeOfEvents: [Event] = try snapshot.documents.compactMap({ try $0.data(as: Event.self) }).filter({ event in
            if ( (event.longitude >= (location.longitude - longitudeRange))
                 && (event.longitude <= (location.longitude + longitudeRange))) {
                return true
            }
            return false
        })
        
        return rangeOfEvents
    }
    
    static func fetchEventsByUser(ownerUid: String) async throws -> [Event] {
        print("DEBUG: EventService fetchEventsByUser called")
        let snapshot = try await eventCollection
            .whereField("ownerUid", isEqualTo: ownerUid)
            .getDocuments()
        
        for doc in snapshot.documents {
            print("DEBUG: Data is \(doc.data())")
            do {
                var newEvent: Event = try doc.data(as: Event.self)
            } catch {
                print("Error is \(error)")
            }
        }
        
        return try snapshot.documents.compactMap({ try $0.data(as: Event.self) })
    }
}
