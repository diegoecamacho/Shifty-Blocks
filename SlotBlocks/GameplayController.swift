//
//  GameplayController.swift
//  SlotBlocks
//
//  Created by Diego Camacho on 2019-04-14.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

class GameplayController : SKNode{
    var SlotsDictionary:[Shapes : Slots] = [:]
    var shapeSpawner : ShapeSpawner?
    
    init(scene: SKScene) {
        super.init()
        
        shapeSpawner = ShapeSpawner(scene: scene, difficulty: GameManager.Instance.GameSpeedMultiplier)
        
        let waitfor = SKAction.wait(forDuration: 2)
        let runblock = SKAction.run(self.SpawnShape)
        
        let repearForever = SKAction.repeatForever(SKAction.sequence([waitfor,runblock]))
        
        run(repearForever)
        
        scene.addChild(shapeSpawner!)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    public func AddSlot(slot : Slots){
        let shape = slot.acceptedShape
        SlotsDictionary[shape] = slot
    }
    
    private func SpawnShape() -> Void{
        let shape = shapeSpawner!.SpawnShape()
        let slot = SlotsDictionary[shape.currentShape]
        
        slot?.acceptedColor = shape.currentColor
    }
    
    public func AddSpawnerLocation(location : SKNode){
        shapeSpawner?.AddSpawnerLocation(location: location)
    }
    
    
}
