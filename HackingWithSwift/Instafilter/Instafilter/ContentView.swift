//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Meyer on 28/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = Double() {
        didSet {
            print("New value is \(blurAmount)")
        }
    }

    var body: some View {
        VStack {
            Text("Hello, Wolrd!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .padding()
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    ContentView()
}
