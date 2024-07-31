//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 30/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Text("1")
                .tabItem {
                    Label("One", systemImage: "star")
                }
            
            Text("2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
