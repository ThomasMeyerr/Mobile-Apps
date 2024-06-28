//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Meyer on 28/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = Double()

    var body: some View {
        VStack {
            Text("Hello, Wolrd!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .padding()
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
        }
    }
}

#Preview {
    ContentView()
}
