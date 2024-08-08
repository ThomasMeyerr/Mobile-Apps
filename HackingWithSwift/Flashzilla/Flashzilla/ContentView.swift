//
//  ContentView.swift
//  Flashzilla
//
//  Created by Thomas Meyer on 08/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .onTapGesture {
            print("Vstack tapped")
        }
    }
}

#Preview {
    ContentView()
}
