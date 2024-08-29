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
        "Accommodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circlepath",
        "Family": "person.3"
    ]
    
    private let descriptions = [
        "Accommodation": "This resort has popular on-site accommodation.",
        "Beginners": "This resort has lots of ski schools.",
        "Cross-country": "This resort has lots of ski schools.",
        "Eco-friendly": "This resort has won an award for environmental friendliness.",
        "Family": "This resort is popular with families."
    ]
    
    var icon: some View {
        Image(systemName: icons[name] ?? "questionmark.circle")
            .accessibilityLabel(name)
            .foregroundStyle(.secondary)
    }
    
    var description: String {
        if let message = descriptions[name] {
            message
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }
}
