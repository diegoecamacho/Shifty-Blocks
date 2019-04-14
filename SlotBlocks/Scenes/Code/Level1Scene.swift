//
//  GameScene.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit
import GameplayKit

class Level1Scene: SKScene, SKPhysicsContactDelegate {
    
    var Spawner : ShapeSpawner?
    
    var SpawnLocationA : SKNode?
    var SpawnLocationB : SKNode?
    var SpawnLocationC : SKNode?
    
     var timer : Int?
    
    var Slot1 : Slots?
    var Slot2 : Slots?
    var Slot3 : Slots?
    
    var shape: Shape?
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
    }
    
    override func sceneDidLoad() {
        //Modify Gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: -4)
        
        SpawnLocationA = childNode(withName: "SpawnPointA")
        SpawnLocationB = childNode(withName: "SpawnPointB")
        SpawnLocationC = childNode(withName: "SpawnPointC")
        
        Slot1 = childNode(withName: "SquareSlot") as? Slots
        Slot2 = childNode(withName: "TriangleSlot") as? Slots
        Slot3 = childNode(withName: "CircleSlot") as? Slots
        
        Slot1?.Initialize(detectedShape: .Square, colorDetected: .None)
        Slot2?.Initialize(detectedShape: .Triangle, colorDetected: .None)
        Slot3?.Initialize(detectedShape: .Circle, colorDetected: .None)
        
         timer = 300
        
        Spawner = ShapeSpawner(scene: self)
        Spawner?.AddSpawnerLocation(location: SpawnLocationA!)
        Spawner?.AddSpawnerLocation(location: SpawnLocationB!)
        Spawner?.AddSpawnerLocation(location: SpawnLocationC!)
        
        addChild(Spawner!)

    }
    override func update(_ currentTime: TimeInterval) {
        for node in self.children {
            if node is Actor{
                let actor = node as! Actor
                actor.update(currentTime: currentTime)
            }
        }
        timer! -= 1
        if(timer == 0){
            let nextScene = SettingsMenu(fileNamed: "ResultsScreen")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision : UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == ShapeCategory | SlotCategory {
            let slot: Slots = contact.bodyA.node! as! Slots
            let shape: Shape = contact.bodyB.node! as! Shape
            slot.ReceiveShape(shape: shape)
        }
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
