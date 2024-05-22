//
//  ContentView.swift
//  iExpense
//
//  Created by Thomas Meyer on 22/05/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count : \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
