//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Thomas Meyer on 15/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }
    }
}

#Preview {
    ContentView()
}
