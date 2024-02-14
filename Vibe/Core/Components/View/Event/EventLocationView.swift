//
//  EventLocationView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/30/24.
//

import SwiftUI
import MapKit

struct EventLocationView: View {
    
    @State var event: Event
    
    var body: some View {
        VStack {
            Text(event.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color.themeColor)
                .padding(.leading, 20)
            
            
            let region: MKCoordinateRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: event.latitude,
                                               longitude: event.longitude),
                span: Constants.SPAN
            )
            
            Map(initialPosition: MapCameraPosition.region(region)) {
                Marker("Event Location", coordinate: region.center)
            }
            .frame(width: .infinity, height: 200)
            
            HStack {
                Text(event.description)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            
            HStack{
                Text("Attendees: \(event.capacity)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                Spacer()
            }
            
            HStack {
                Text("Starts In: \(event.startTime.dateValue(), format: .dateTime.month().day().year())")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.leading, 20)
                    
                
                Spacer()
            }
        }
        
    }
}

struct EventLocationView_Previews: PreviewProvider {
    
    static var previews: some View {
        EventLocationView(event: Event.MOCK_POSTS[0])
    }
}

