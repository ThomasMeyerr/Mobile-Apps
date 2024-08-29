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
        Image(systemName: icons[name] ?? "questionmark.circle")
            .accessibilityLabel(name)
            .foregroundStyle(.secondary)
    }
}
