//
//  ContentView.swift
//  BetterRest
//
//  Created by Thomas Meyer on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    
    var body: some View {
        VStack {
            Stepper("\(self.sleepAmount) hours", value: self.$sleepAmount, in: 4...12)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
