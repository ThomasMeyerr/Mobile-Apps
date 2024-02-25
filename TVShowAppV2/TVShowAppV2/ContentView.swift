//
//  ContentView.swift
//  MovieApp
//
//  Created by Thomas Meyer on 03/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                TodayShow()
                    .tabItem {
                            Label("Home", systemImage: "house.fill")
                    }
                
                Search()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                Categories()
                    .tabItem {
                        Label("Categories", systemImage: "line.3.horizontal")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
