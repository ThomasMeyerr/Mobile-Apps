//
//  ContentView.swift
//  WhoStart
//
//  Created by Thomas Meyer on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RockPaperScissors()
                .tabItem {
                    Label("✊✋✌", systemImage: "hand.raised.fill")
                }
            CircleChoice()
                .tabItem {
                    Label("Circle", systemImage: "circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
