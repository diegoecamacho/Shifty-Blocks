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
    
    public var movementSpeed : CGFloat = -50
    
    private var windowSize : CGRect
    
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
        windowSize = UIScreen.main.bounds
        super.init(imageName: imageName)
        
        print(windowSize.height)
        
        
        
        self.physicsBody = SKPhysicsBody(texture: texture!, size: CGSize(width: texture!.size().width / 6, height: texture!.size().height / 6))
        self.physicsBody?.affectedByGravity = false;
        self.physicsBody?.allowsRotation = false
        
        let moveAction = SKAction.moveBy(x: 0, y: movementSpeed, duration: 0.1)
        let sequence = SKAction.repeatForever(moveAction)
        
        run(sequence)

    }
    
    required init?(coder aDecoder: NSCoder) {
        windowSize = UIScreen.main.bounds
        super.init(coder: aDecoder)
    }
    
    override func update() {
        super.update()
        print("Hello")
        if self.position.y > windowSize.height
        {
            self.removeFromParent()
        }
    }
    
}
