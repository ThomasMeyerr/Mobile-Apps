//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Meyer on 30/07/2024.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    var body: some View {
        List(users, id: \.self) { user in
            Text(user)
        }
    }
}

#Preview {
    ContentView()
}
