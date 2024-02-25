//
//  ContentView.swift
//  MovieApp
//
//  Created by Thomas Meyer on 03/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true
    
    var body: some View {
        if self.isLoading {
            LoadingScreen()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.isLoading = false
                        }
                    }
                }
        } else {
            NavigationView {
                TabView {
                    Home()
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
}

#Preview {
    ContentView()
}
