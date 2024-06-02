//
//  ContentView.swift
//  Navigation
//
//  Created by Thomas Meyer on 31/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {}
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
