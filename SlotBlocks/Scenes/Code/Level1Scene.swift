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
    
    var gameplayController : GameplayController?
    
    var shape: Shape?
    
    var scoreText : SKLabelNode?
    var multiplerText : SKLabelNode?
    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
    }
    
    override func sceneDidLoad() {
        
        gameplayController = GameplayController(scene: self)
        
        gameplayController?.AddSpawnerLocation(location: childNode(withName: "SpawnPointA")!)
        gameplayController?.AddSpawnerLocation(location: childNode(withName: "SpawnPointB")!)
        gameplayController?.AddSpawnerLocation(location: childNode(withName: "SpawnPointC")!)
        
        scoreText = childNode(withName: "Score") as? SKLabelNode
        multiplerText = childNode(withName: "Multiplier") as? SKLabelNode
        
        let Slot1 = childNode(withName: "SquareSlot") as? Slots
        let Slot2 = childNode(withName: "TriangleSlot") as? Slots
        let Slot3 = childNode(withName: "CircleSlot") as? Slots
        
        Slot1?.Initialize(detectedShape: .Square, colorDetected: .Red)
        Slot2?.Initialize(detectedShape: .Triangle, colorDetected: .Red)
        Slot3?.Initialize(detectedShape: .Circle, colorDetected: .Red)
        
        gameplayController?.AddSlot(slot: Slot1!)
        gameplayController?.AddSlot(slot: Slot2!)
        gameplayController?.AddSlot(slot: Slot3!)
        
        addChild(gameplayController!)
        
    }
    override func update(_ currentTime: TimeInterval) {
        for node in self.children {
            if node is Actor{
                let actor = node as! Actor
                actor.update(currentTime: currentTime)
            }
        }
        
        scoreText?.text = String(GameManager.Instance.Score)
    
        multiplerText?.text = String(GameManager.Instance.MultiplierRatio)
        
        if(GameManager.Instance.GameOver){
            if(GameManager.Instance.GameSpeedMultiplier == 1){
                //set easy high score
            }
            if(GameManager.Instance.GameSpeedMultiplier == 2){
                //set hard high score
            }
            if(GameManager.Instance.GameSpeedMultiplier == 3){
                //set extreme high score
            }
            let nextScene = ResultsScreen(fileNamed: "ResultsScreen")
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
            shape?.IsClicked = true
            shape?.removeAllActions()
        }
        else {
            if node is Slots{
                var slot = node as? Slots
                slot?.ChangeColor()
            }
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
