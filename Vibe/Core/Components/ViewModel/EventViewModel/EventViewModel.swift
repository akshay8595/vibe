//
//  EventViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/29/24.
//

import Foundation
import CoreLocation

/**
 Gets the users location and events. Performs business logic and filtering criteria once retrieved.
 */
class EventViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private let user: VibeUser
    
    @Published var eventsNearMe = [Event]()
    @Published var eventsByUser = [Event]()
    private var userLocation: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    init(user: VibeUser) {
        self.user = user
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
        
    @MainActor
    func fetchEventsNearMe() async throws {
        print("DEBUG: Entered func fetchEventsNearMe")
        locationManager.startUpdatingLocation()
        print("DEBUG: User Location Received is is \(self.userLocation)")
        print("DEBUG: User Location through location manager is \(self.locationManager.requestLocation())")
        self.eventsNearMe = try await EventService.fetchEventsByLocation(location: self.userLocation)
    }
    
    @MainActor
    func fetchEventsByUser(ownerUid: String) async throws {
        print("DEBUG: Entered func Requesting fetchEventsByUser")
        self.eventsByUser = try await EventService.fetchEventsByUser(ownerUid: ownerUid)
        for event in self.eventsByUser {
            print("DEBUG: Event Data of User is \(event)")
        }
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
        print("DEBUG: Error during location callback is \(error)")
    }
    
}
