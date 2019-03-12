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
    
    
}
