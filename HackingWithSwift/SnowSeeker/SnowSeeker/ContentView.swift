//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 27/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Text("Primary")
        } detail: {
            Text("Content")
        }
    }
}

#Preview {
    ContentView()
}
