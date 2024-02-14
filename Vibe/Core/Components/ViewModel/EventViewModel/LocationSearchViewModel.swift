//
//  LocationSearchViewModel.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/27/24.
//

import Foundation
import MapKit

// Give user list of addresses near by
// Make this Singleton
class LocationSearchViewModel: NSObject, ObservableObject {
    
    @Published var results = [MKLocalSearchCompletion]() // address with completed results
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D? // location which is selected
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            print("DEBUG: Query fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    // MARK: Lifecycle
    
    private override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    static let shared = LocationSearchViewModel()
    
    // MARK: - Helpers
    
    // Receives the address for a place in String form, and gets coordinates for the same.
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedLocationCoordinate = coordinate
            print("DEBUG: Location coordinates \(coordinate)")
        }
    }
    
    // Receives the completed Address String which was searched for.
    // For Eg - Dunkin Donuts 123 Main Street, New York, New York - 11111
    // Here, "Dunkin Donuts" is title and "123 Main Street, New York, New York - 11101" is subtitle
    // We query using above string to get the coordinates for the location in "MKLocalSearch.CompletionHandler".
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler) {
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
}

// MARK - section for MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
