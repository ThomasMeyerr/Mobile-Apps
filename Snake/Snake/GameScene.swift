//
//  GameScene.swift
//  Snake
//
//  Created by Thomas Meyer on 21/01/2025.
//

import SpriteKit


class GameScene: SKScene {
    var snake: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        backgroundColor = .lightGray
        
        // Create a basic snake
        snake = SKSpriteNode(color: .green, size: CGSize(width: 20, height: 20))
        snake.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(snake)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Logicial to move the snake (with touch?)
        snake.position.x += 1
    }
}
