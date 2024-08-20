//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Meyer on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            Image(.example)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
        }
    }
}

#Preview {
    ContentView()
}
