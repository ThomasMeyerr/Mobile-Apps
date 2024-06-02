//
//  ContentView.swift
//  Navigation
//
//  Created by Thomas Meyer on 31/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "Swift UI"
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
