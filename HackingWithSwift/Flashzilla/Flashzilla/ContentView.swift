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
            .onLongPressGesture(minimumDuration: 2) {
                print("Long pressed !")
            }
    }
}

#Preview {
    ContentView()
}
