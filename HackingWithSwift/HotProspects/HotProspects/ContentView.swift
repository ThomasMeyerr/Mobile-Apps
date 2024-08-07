//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 30/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sortOrder = SortDescriptor(\Prospect.name)

    var body: some View {
        TabView {
            ProspectsView(filter: .none, sort: sortOrder)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted, sort: sortOrder)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted, sort: sortOrder)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        .toolbar {
            ToolbarItem {
                Menu("Switch order", systemImage: "arrow.up.and.down.text.horizontal") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\Prospect.name))
                        Text("Most recent")
                            .tag(SortDescriptor(\Prospect.emailAddress))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
