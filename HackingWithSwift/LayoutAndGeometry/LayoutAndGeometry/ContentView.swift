//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Meyer on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            Text("Hello, world!")
                .frame(width: proxy.size.width * 0.9)
                .background(.red)
        }
    }
}

#Preview {
    ContentView()
}
