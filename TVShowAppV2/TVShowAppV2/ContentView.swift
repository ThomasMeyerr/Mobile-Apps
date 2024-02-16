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
            }
        }
    }
}

#Preview {
    ContentView()
}
