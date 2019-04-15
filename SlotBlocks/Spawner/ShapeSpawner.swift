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
    
    public var newShape : Shapes = .Circle
    public var newColor : Colors = .Blue
    
    var SpawnLocation : [SKNode] = []
    
    var spawnerScene : SKScene?
    
    var Difficulty : Int = 1
    
    init(scene :SKScene , difficulty : Int){
        super.init()
        
        self.Difficulty = difficulty
        
        spawnerScene = scene
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    
    public func AddSpawnerLocation(location : SKNode){
        SpawnLocation.append(location)
    }
    
    public func SpawnShape() -> Shape{
        let randomLocation = SpawnLocation.randomElement()
       let shape =  Shape(imageName: "SquareShape")
        newShape = Shapes(rawValue: Int.random(in: 0 ..< 3))!
        newColor = Colors(rawValue: Int.random(in: 0 ..< 3))!
        
        shape.currentShape = newShape
        shape.currentColor = newColor
        
        shape.SetSpeed(shapeDifficulty: CGFloat(Difficulty))
       shape.size = CGSize(width: 200, height: 200)
       shape.position = (randomLocation?.position)!
        shape.PlayAnimation()
       self.spawnerScene?.addChild(shape)
        return shape
    }
   
}
