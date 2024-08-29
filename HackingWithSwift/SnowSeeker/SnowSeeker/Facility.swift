//
//  Facility.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 29/08/2024.
//

import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String
    
    private let icons = [
        "Accomodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circlepath",
        "Family": "person.3"
    ]
    
    var icon: some View {
        if let iconName = icons[name] {
            Image(systemName: iconName)
                .accessibilityLabel(name)
                .foregroundStyle(.secondary)
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }
}
