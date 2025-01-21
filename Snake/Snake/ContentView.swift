//
//  ContentView.swift
//  Snake
//
//  Created by Thomas Meyer on 21/01/2025.
//

import SwiftUI
import SpriteKit


@MainActor class ContentViewModel: ObservableObject {
    enum direction {
        case up, down, left, right
    }
    
    let minX = UIScreen.main.bounds.minX
    let maxX = UIScreen.main.bounds.maxX
    let minY = UIScreen.main.bounds.minY
    let maxY = UIScreen.main.bounds.maxY
}


struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        Text("Snake")
    }
}

#Preview {
    ContentView()
}
