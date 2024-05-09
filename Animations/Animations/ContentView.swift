//
//  ContentView.swift
//  Animations
//
//  Created by Thomas Meyer on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.linear, value: animationAmount)
    }
}

#Preview {
    ContentView()
}
