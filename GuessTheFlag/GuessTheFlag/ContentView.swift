//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Choose a continent :")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    Menu()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
