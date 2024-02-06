//
//  EventsNearMeView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/29/24.
//

import SwiftUI

struct EventsNearMeView: View {
    
    let user: VibeUser
    @StateObject var viewModel: EventViewModel
    
    init(user: VibeUser) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: EventViewModel(user: user))
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.eventsNearMe) { post in
                EventLocationView(event: post)
            }
        }
        .onAppear(perform: {
            Task {
                try await viewModel.fetchEventsNearMe()
            }
        })
    }
}

struct EventsNearMeView_Previews: PreviewProvider {
    
    static var previews: some View {
        EventLocationView(event: Event.MOCK_POSTS[0])
    }
}
