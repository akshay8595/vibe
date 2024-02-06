//
//  JoinView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/29/24.
//

import SwiftUI

struct JoinView: View {
    
    let user: VibeUser
    @State private var selectedIndex = 0
    
    init(user: VibeUser) {
        self.user = user
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.themeColor)]
    }
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: AddEventView(user: user)) {
                        Text("Add Event")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 35)
                            .background(Color.themeColor)
                            .cornerRadius(8)
                            .padding(.trailing, 10)
                    }
                    
                }
                
                Divider()
                
                Picker("", selection: $selectedIndex) {
                    Text("Events Near Me")
                        .tag(0)
                    Text("My Events")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                switch(selectedIndex) {
                case 0:
                    EventsNearMeView(user: user)
                case 1:
                    MyEventsView(user: user)
                default:
                    Text("Unsupported Operation")
                }
                Spacer()
            }
            .navigationTitle("Join?")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    JoinView(user: VibeUser.MOCK_USERS[2])
}
