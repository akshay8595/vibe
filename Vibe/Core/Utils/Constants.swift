//
//  Constants.swift
//  Vibe
//
//  Created by Akshay Bhasin on 2/3/24.
//

import Foundation
import SwiftUI
import MapKit

extension Color {
    static let themeColor = Color(red: 248/255, green: 95/255, blue: 106/255) // naming it to THEME_COLOR causing issues
    static let selectedTabColor = Color(red: 230/255, green: 230/255, blue: 230/255) // naming it to SELECTED_TAB_COLOR causing issues
}

class Constants {
    static let SPAN = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
}
