//
//  ContentView.swift
//  BetterRest
//
//  Created by Thomas Meyer on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(self.sleepAmount.formatted()) hours", value: self.$sleepAmount, in: 4...12, step: 0.25)
            
            DatePicker("Please enter a date", selection: self.$wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
                .labelsHidden()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
