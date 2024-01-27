//
//  Ranked.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 23/01/2024.
//

import SwiftUI

struct Ranked: View {
    
    @State private var showingGame = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(red: 52/255, green: 103/255, blue: 51/255), .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                NavigationLink(destination: Game(countries: world), isActive: self.$showingGame) {
                    EmptyView()
                }
                
                Button(action: {
                    self.showingGame = true
                }) {
                    Label("START", systemImage: "globe")
                }
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    Ranked()
}
