//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Thomas Meyer on 07/06/2024.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var counter = Int()
    @State private var engine: CHHapticEngine?

    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
