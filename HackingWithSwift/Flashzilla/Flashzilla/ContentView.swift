//
//  ContentView.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 08/08/2024.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("Hello, world!")
            .onReceive(timer) { time in
                print("The time is now \(time)")
            }
    }
}

#Preview {
    ContentView()
}
