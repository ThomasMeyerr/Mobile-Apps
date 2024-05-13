//
//  ContentView.swift
//  Animations
//
//  Created by Thomas Meyer on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero

    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 100, height: 150)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded{ _ in dragAmount = .zero }
            )
    }
}

#Preview {
    ContentView()
}
