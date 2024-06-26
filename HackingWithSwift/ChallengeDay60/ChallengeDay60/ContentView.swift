//
//  ContentView.swift
//  ChallengeDay60
//
//  Created by Thomas Meyer on 26/06/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]

    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("List of Users")
            .onAppear {
                fetchData()
            }
        }
    }
    
    func fetchData() {
        guard users.isEmpty else { return }
        
        print("hello")
    }
}

#Preview {
    ContentView()
}
