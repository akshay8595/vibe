//
//  PostsOnMap.swift
//  Vibe
//
//  Created by Akshay Bhasin on 2/10/24.
//

import SwiftUI
import MapKit

struct PostsOnMap {

    
    let mapView = MKMapView()
    
    @StateObject var viewModel: LocationSearchViewModel = LocationSearchViewModel.shared
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView;
    }
    
    func updateUIViewWithCoordinates(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension PostsOnMap {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // MARK: - Properties
        let parent: PostsOnMap
        
        // MARK: - Lifecycle
        
        init(parent: PostsOnMap) {
            self.parent = parent
            super.init()
        }
        
        // MARK: - MKMapViewDelegate
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: userLocation.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            parent.mapView.setRegion(region, animated: true)
        }
        
    }
}

#Preview {
    PostsOnMap()
}
