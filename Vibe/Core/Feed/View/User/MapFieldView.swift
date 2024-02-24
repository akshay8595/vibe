//
//  MapFieldView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 2/10/24.
//

import SwiftUI
import MapKit
import Kingfisher

struct PostLocation: Identifiable, Hashable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.coordinate.latitude == rhs.coordinate.latitude && lhs.coordinate.longitude == rhs.coordinate.longitude
    }
        
    public func hash(into hasher: inout Hasher) {
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }
    
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

struct MapFieldView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var position: MapCameraPosition = .automatic
    @State var annotation: [PostLocation] = [PostLocation]()
    
    var body: some View {
        
        VStack {
            Map(position: $position) {
                ForEach(annotation, id: \.self) { anno in
                    Marker("Post", systemImage: "figure.wave", coordinate: anno.coordinate)
                }
                
                Marker("My Location", coordinate: viewModel.userLocation)
                    .tint(Color.blue)
            }
        }
        .onAppear(perform: {
            Task {
                try await setPostAnnotations()
            }
        })
    }
    
    private func setPostAnnotations() async throws {
        try await viewModel.fetchPosts()
        self.position = .region(MKCoordinateRegion(center: viewModel.userLocation,
                                                   span: Constants.SPAN))
        self.annotation = viewModel.posts.compactMap({ 
            return PostLocation(coordinate: CLLocationCoordinate2D(latitude: $0.latitude,
                                                                   longitude: $0.longitude))
        })
    }
}

#Preview {
    MapFieldView()
}
