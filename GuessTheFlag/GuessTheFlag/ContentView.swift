//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationStack {
            TabView {
                Menu()
                    .tabItem {
                        Label("Training", systemImage:"tray.and.arrow.down.fill")
                    }
                
                Ranked()
                    .tabItem {
                        Label("Ranked", systemImage:"tray.and.arrow.down.fill")
                    }
                    
                Leaderboard()
                    .tabItem {
                        Label("Leaderboard", systemImage:"tray.and.arrow.down.fill")
                    }
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
