//
//  MyEventsView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/30/24.
//

import SwiftUI

struct MyEventsView: View {
    let user: VibeUser
    @StateObject var viewModel: EventViewModel
    
    init(user: VibeUser) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: EventViewModel(user: user))
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.eventsByUser) { post in
                EventLocationView(event: post)
            }
        }
        .onAppear(perform: {
            Task {
                try await viewModel.fetchEventsByUser(ownerUid:user.id)
            }
        })
    }
}

#Preview {
    MyEventsView(user: VibeUser.MOCK_USERS[2])
}
