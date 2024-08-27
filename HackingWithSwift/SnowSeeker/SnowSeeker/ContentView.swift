//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 27/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            NavigationLink("Primary") {
                Text("New View")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
