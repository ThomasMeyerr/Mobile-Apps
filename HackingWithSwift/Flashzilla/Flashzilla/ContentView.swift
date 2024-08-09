//
//  ContentView.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 08/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 1.0
    
    var body: some View {
        Button("Hello, world!") {
            withOptionalAnimation {
                scale *= 1.5
            }
        }
        .scaleEffect(scale)
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

#Preview {
    ContentView()
}
