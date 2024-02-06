//
//  LocationSearchView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/25/24.
//

import SwiftUI

struct LocationSearchView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var startLocationText = ""
    @Binding var showLocationSearchView: Bool
    @StateObject var viewModel: LocationSearchViewModel = LocationSearchViewModel.shared
    
    var body: some View {
        
        VStack {
            // header view
            
            HStack {
                VStack {
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                    
                }
                VStack {
                    TextField("Event Location", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // list view
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title,
                                                 subtitle: result.subtitle)
                        .onTapGesture {
                            viewModel.selectLocation(result)
                            dismiss()
                        }
                        
                    }
                }
            }
        }
        .background(.white)
        .navigationTitle("Enter Location For your Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LocationSearchView(showLocationSearchView: .constant(false))
}
