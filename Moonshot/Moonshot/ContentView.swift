//
//  ContentView.swift
//  Moonshot
//
//  Created by Thomas Meyer on 25/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                Text("Detail View")
            }
                .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
