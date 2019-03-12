//
//  Shape.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-12.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

enum Shapes: Int {
    case Square = 0,
     Circle = 1,
     Triangle = 2
}
class Shape: Actor {
    
    var currentShape : Shapes = .Square {
        didSet{
            switch currentShape {
            case .Square:
                let tempTexture = SKTexture(imageNamed: "SquareShape")
                texture = tempTexture
                break
            case .Circle:
                let tempTexture = SKTexture(imageNamed: "CircleShape")
                texture = tempTexture
                break
            case .Triangle:
                let tempTexture = SKTexture(imageNamed: "TriangleShape")
                texture = tempTexture
                break
            }
            
        }
    }
    
    override init(imageName: String) {
        super.init(imageName: imageName)
        
        self.physicsBody = SKPhysicsBody(texture: texture!, size: texture!.size())
        self.physicsBody?.affectedByGravity = true;

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
