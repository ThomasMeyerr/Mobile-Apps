//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Thomas Meyer on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minHeight = max(0.5, proxy.frame(in: .global).minY / 10)
                        let hue = min(1, proxy.frame(in: .global).minY / fullView.size.height)
                        let opacity = proxy.frame(in: .global).minY / 200.0
                        let degrees = (proxy.frame(in: .global).minY - fullView.size.height / 2) / 5
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity, minHeight: minHeight)
                            .background(Color(hue: hue, saturation: 1.0, brightness: 1.0))
                            .opacity(opacity)
                            .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
