//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Meyer on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
