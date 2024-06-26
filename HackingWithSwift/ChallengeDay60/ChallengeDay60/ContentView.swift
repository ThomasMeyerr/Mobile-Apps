//
//  ContentView.swift
//  ChallengeDay60
//
//  Created by Thomas Meyer on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User]

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
        
        let config =
        let url = URLSession(configuration: <#T##URLSessionConfiguration#>)
    }
}

#Preview {
    ContentView(users: [User]())
}
