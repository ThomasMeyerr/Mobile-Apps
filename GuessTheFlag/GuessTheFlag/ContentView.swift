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
            ZStack {
                LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        NavigationLink(destination: Game(countries: easy), label: {
                            Image("France")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
