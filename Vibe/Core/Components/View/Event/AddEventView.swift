//
//  AddEventView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/27/24.
//

import SwiftUI
import MapKit

struct AddEventView: View {

    @Environment(\.dismiss) var dismiss
    @State var locationSearchResult: MKLocalSearchCompletion = MKLocalSearchCompletion()
    @State private var showLocationSearchView = false
    
    @StateObject var viewModel: LocationSearchViewModel = LocationSearchViewModel.shared
    @StateObject var eventViewModel: EventLocationViewModel
    
    init(user: VibeUser) {
        self._eventViewModel = StateObject(wrappedValue: EventLocationViewModel(user: user))
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Spacer()
                
                NavigationLink(destination: LocationSearchView(showLocationSearchView: $showLocationSearchView)) {
                    
                    EventLocationPickerView(showLocationSearchView: $showLocationSearchView)
                    
                }
                .gesture(TapGesture().onEnded({
                    showLocationSearchView.toggle()
                }))
                
                if !showLocationSearchView {
                    EventViewRepresentable()
                        .frame(width: .infinity, height: 300)
                        .ignoresSafeArea()
                }
                
                TextField("Name of the Event", text: $eventViewModel.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(10)
                
                TextField("Enter Description", text: $eventViewModel.description)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(10)
                
                TextField("Event Capacity", value: $eventViewModel.capacity, format: .number)
                    .keyboardType(.numberPad)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(10)
                
                DatePicker("Start Date For Event", selection: $eventViewModel.startTime, displayedComponents: .date)
                    .padding(.horizontal, 10)
                
                DatePicker("End Date For Event", selection: $eventViewModel.endTime, displayedComponents: .date)
                    .padding(.horizontal, 10)
                
                Spacer()
                
                Button {
                    Task {
                        try await eventViewModel.addEvent(location:viewModel.selectedLocationCoordinate!)
                        dismiss()
                    }
                } label: {
                    Text("Add Event")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        
                }
                .frame(width: 200, height: 50)
                .background(Color.themeColor)
                .accentColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    AddEventView(user: VibeUser.MOCK_USERS[0])
}
