//
//  ContentView.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 08/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onTapGesture(count: 2) {
                print("Double tapped !")
            }
    }
}

#Preview {
    ContentView()
}
