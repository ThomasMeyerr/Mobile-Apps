//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Thomas Meyer on 15/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped.")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    ContentView()
}
