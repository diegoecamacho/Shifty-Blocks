//
//  Shape.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-12.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

public enum Shapes: Int {
    case Square = 0,
    Circle = 1,
    Triangle = 2
}

public enum Colors: Int {
    case None = 0,
    Blue = 1,
    Red = 2,
    Green = 3
}


class Shape: Actor {
    
    private var baseMovement : CGFloat = -100
    
    public var movementSpeed : CGFloat = -100
    
    public var IsClicked : Bool = false
    
    private var windowSize : CGRect
    
    var currentColor : Colors = .None
    {
        didSet{
            switch currentColor {
            case .Blue:
                let tempTexture = SKTexture(imageNamed: "\(currentShape)" + "BLUE")
                texture = tempTexture
                break
            case .Green:
                let tempTexture = SKTexture(imageNamed: "\(currentShape)" + "GREEN")
                texture = tempTexture
                break
            case.Red:
                let tempTexture = SKTexture(imageNamed: "\(currentShape)" + "RED")
                texture = tempTexture
                break
            case .None:
                break
            }
        }
    }
    
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
        
        self.physicsBody?.categoryBitMask = ShapeCategory
        self.physicsBody?.collisionBitMask = DefaultCategory
       
        
        let moveAction = SKAction.moveBy(x: 0, y: movementSpeed, duration: 0.1)
        let sequence = SKAction.repeatForever(moveAction)
        
        run(sequence)

    }
    
    public func SetSpeed(shapeDifficulty: CGFloat) ->Void
    {
        movementSpeed = baseMovement * shapeDifficulty
    }
    
    required init?(coder aDecoder: NSCoder) {
        windowSize = UIScreen.main.bounds
        super.init(coder: aDecoder)
    }
    
    override func update(currentTime: TimeInterval) {
        super.update(currentTime: currentTime)
       if self.position.y < 0 - (windowSize.height + texture!.size().height / 6)
       {
            GameManager.Instance.DecreaseScore()
           self.removeFromParent()
       }
    }
    
}
