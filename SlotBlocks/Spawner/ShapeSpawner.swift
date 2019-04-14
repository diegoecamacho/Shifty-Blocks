//
//  ShapeSpawner.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-12.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

class ShapeSpawner : SKNode {
    var timeElapsed : Double = 0.0
    public var nextSpawnIn = 100.0
    
    var SpawnLocation : [SKNode] = []
    
    var spawnerScene : SKScene?
    
    var Difficulty : Int = 1
    
    init(scene :SKScene , difficulty : Int){
        super.init()
        
        self.Difficulty = difficulty
        
        spawnerScene = scene
        
        
        let waitfor = SKAction.wait(forDuration: 3)
        let runblock = SKAction.run(self.SpawnShape)
    
        
        let repearForever = SKAction.repeatForever(SKAction.sequence([waitfor,runblock]))
        
        run(repearForever)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    
    public func AddSpawnerLocation(location : SKNode){
        SpawnLocation.append(location)
    }
    
    func SpawnShape(){
        let randomLocation = SpawnLocation.randomElement()
       let shape =  Shape(imageName: "SquareShape")
        shape.currentShape = Shapes(rawValue: Int.random(in: 0 ..< 3))!
        shape.SetSpeed(shapeDifficulty: CGFloat(Difficulty))
       shape.size = CGSize(width: 200, height: 200)
       shape.position = (randomLocation?.position)!
       self.spawnerScene?.addChild(shape)
    }
   
}
