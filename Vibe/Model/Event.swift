//
//  Event.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/29/24.
//

import Foundation
import Firebase

struct Event: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let name: String
    let description: String
    let capacity: Int
    let startTime: Timestamp
    let endTime: Timestamp
    let latitude: Double
    let longitude: Double
    var attendees: [String] // urls of attending audience
}

extension Event {
    static var MOCK_POSTS: [Event] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            name: "Saturday Run",
            description: "5K Weekend Kickstart Run",
            capacity: 20,
            startTime: Timestamp(),
            endTime: Timestamp(),
            latitude: 40.7475,
            longitude: -73.957778,
            attendees: [ NSUUID().uuidString, NSUUID().uuidString ]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            name: "Pasta Mania",
            description: "Cook Pasta From Scratch",
            capacity: 20,
            startTime: Timestamp(),
            endTime: Timestamp(),
            latitude: 40.7506,
            longitude: -73.9402,
            attendees: [ NSUUID().uuidString, NSUUID().uuidString ]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            name: "Saturday Run",
            description: "5K Weekend Kickstart Run",
            capacity: 20,
            startTime: Timestamp(),
            endTime: Timestamp(),
            latitude: 40.7785,
            longitude: -73.9228,
            attendees: [ NSUUID().uuidString, NSUUID().uuidString ]
        )
        ]
    }
        
