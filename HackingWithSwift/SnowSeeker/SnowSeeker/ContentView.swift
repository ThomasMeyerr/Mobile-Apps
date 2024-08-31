//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Thomas Meyer on 27/08/2024.
//

import SwiftUI

enum Filter {
    case defaults, alphabetical, country
}


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            if filter == .alphabetical {
                resorts.sorted { $0.name < $1.name }
            } else if filter == .country {
                resorts.sorted { $0.country < $1.country }
            } else {
                resorts
            }
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    @State private var searchText = ""
    @State private var favorites = Favorites()
    @State private var filter: Filter = .defaults
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem {
                    Button("Default") { filter = .defaults }
                }
                
                ToolbarItem {
                    Button("Alphabetical") { filter = .alphabetical }
                }
                
                ToolbarItem {
                    Button("Country") { filter = .country }
                }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}


#Preview {
    ContentView()
}
