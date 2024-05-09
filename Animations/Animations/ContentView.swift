//
//  ContentView.swift
//  Animations
//
//  Created by Thomas Meyer on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Tap Me") {
            
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
    }
}

#Preview {
    ContentView()
}
