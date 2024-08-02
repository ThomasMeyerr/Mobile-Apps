//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 30/07/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Deleting")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    ContentView()
}
