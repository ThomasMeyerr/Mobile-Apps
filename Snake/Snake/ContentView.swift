//
//  ContentView.swift
//  Snake
//
//  Created by Thomas Meyer on 21/01/2025.
//

import SwiftUI
import SpriteKit


struct ContentView: View {
    @State private var direction: CGVector = .zero
    
    var scene: SKScene {
        let scene = GameScene(size: CGSize(width: 300, height: 600))
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 600)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let dragDirection = value.translation
                        self.direction = CGVector(dx: dragDirection.width, dy: dragDirection.height)
                    }
            )
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
