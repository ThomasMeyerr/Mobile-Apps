//
//  ContentView.swift
//  WeSplit
//
//  Created by Thomas Meyer on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WeSplit()
                .tabItem {
                    Label("WeSplit", systemImage: "square.split.2x1.fill")
                }
            BigBoy()
                .tabItem {
                    Label("BigBoy", systemImage: "globe")
                }
            Test()
                .tabItem {
                    Label("Test", systemImage: "person")
                }
            For()
                .tabItem {
                    Label("For3", systemImage: "book")
                }
        }
    }
}

#Preview {
    ContentView()
}
