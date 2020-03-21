//
//  GameScene.swift
//  pong
//
//  Created by Owner on 3/21/20.
//  Copyright © 2020 dokota goad. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKShapeNode()
    var enemy = SKSpriteNode()
    var main = SKShapeNode()
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKShapeNode
        ball = self.childNode(withName: "enemy") as! SKShapeNode
        ball = self.childNode(withName: "main") as! SKShapeNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20 , dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        for touch in touches {
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
        
        
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
    }
}
