//
//  GameScene.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var Spawner : ShapeSpawner?
    
    var SpawnLocationA : SKNode?
    var SpawnLocationB : SKNode?
    var SpawnLocationC : SKNode?
    
    var shape: Shape?
    
    
    override func sceneDidLoad() {
        //Modify Gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: -4)
        
        SpawnLocationA = childNode(withName: "SpawnPointA")
        SpawnLocationB = childNode(withName: "SpawnPointB")
        SpawnLocationC = childNode(withName: "SpawnPointC")
        
        Spawner = ShapeSpawner(scene: self)
        Spawner?.AddSpawnerLocation(location: SpawnLocationA!)
        Spawner?.AddSpawnerLocation(location: SpawnLocationB!)
        Spawner?.AddSpawnerLocation(location: SpawnLocationC!)
        
        addChild(Spawner!)

    }
    override func update(_ currentTime: TimeInterval) {
        <#code#>
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let node = self.nodes(at: touch.location(in: self)).first //Get first node in array.
        if node is Shape {
            shape = node as? Shape
            shape?.removeAllActions()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if shape != nil {
            let touch: UITouch = touches.first!
            shape?.position = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        shape?.removeFromParent()
        shape = nil
    }
    
    
    
    
    
}
