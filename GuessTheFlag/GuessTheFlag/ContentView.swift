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
                        Label("Training", systemImage:"globe.europe.africa")
                    }
                
                Ranked()
                    .tabItem {
                        Label("Ranked", systemImage:"globe")
                    }
                    
                Leaderboard()
                    .tabItem {
                        Label("Leaderboard", systemImage:"person.fill")
                    }
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
