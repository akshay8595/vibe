//
//  UserHomeView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 2/7/24.
//

import SwiftUI

struct UserHomeView: View {
    
    let user: VibeUser
    let navBarAppearance = UINavigationBarAppearance()
    
    @StateObject var viewModel = FeedViewModel()
    @State private var selectedIndex = 0
    
    init(user: VibeUser) {
        self.user = user
        self.navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.themeColor)]
        UINavigationBar.appearance().standardAppearance = self.navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = self.navBarAppearance
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: UploadPostView(tabIndex: .constant(0))) {
                        
                        Text("Add your Vibe")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 120, height: 35)
                            .background(Color.themeColor)
                            .cornerRadius(8)
                            .padding(.trailing, 10)
                    }
                    
                }
                .padding(.bottom, 8)
                .padding(.top, 10)
               
                Picker("", selection: $selectedIndex) {
                    Text("Vibe")
                        .tag(0)
                    Text("Map")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
              
                switch(selectedIndex) {
                case 0:
                    FeedView()
                case 1:
                    MapFieldView()
                default:
                    Text("Unsupported Operation")
                }
                Spacer()
            }
            .navigationTitle("Your Vibe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("testImage1")
                        .resizable()
                        .frame(width: 32, height: 24)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    UserHomeView(user: VibeUser.MOCK_USERS[0])
}
