//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Thomas Meyer on 07/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = Int()

    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
    }
}

#Preview {
    ContentView()
}
