//
//  Slots.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-12.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit


class Slots: Actor {
    var acceptedShape : Shapes = .Square
    {
        didSet{
            switch acceptedShape {
            case .Square:
                let tempTexture = SKTexture(imageNamed: "SquareSlot")
                texture = tempTexture
                break
            case .Circle:
                let tempTexture = SKTexture(imageNamed: "CircleSlot")
                texture = tempTexture
                break
            case .Triangle:
                let tempTexture = SKTexture(imageNamed: "TriangleSlot")
                texture = tempTexture
                break
            }
            
        }
    }
    
    var acceptedColor : Colors = .None
    {
        didSet{
            switch acceptedColor {
            case .Blue:
                let tempTexture = SKTexture(imageNamed: "\(acceptedShape)" + "_SLOT_BLUE")
                texture = tempTexture
                break
            case .Green:
                let tempTexture = SKTexture(imageNamed: "\(acceptedShape)" + "_SLOT_GREEN")
                texture = tempTexture
                break
            case.Red:
                let tempTexture = SKTexture(imageNamed: "\(acceptedShape)" + "_SLOT_RED")
                texture = tempTexture
                break
            case .None:
                break
            }
        }
    }

    public func Initialize(detectedShape : Shapes, colorDetected : Colors) -> Void {
        
        print("iNIT")
        self.physicsBody = SKPhysicsBody(texture: texture!, size: CGSize(width: texture!.size().width / 6 , height: texture!.size().height / 6))
        self.physicsBody?.affectedByGravity = false;
        self.physicsBody?.allowsRotation = false
        
        self.physicsBody?.categoryBitMask = SlotCategory
        self.physicsBody?.collisionBitMask = DefaultCategory
        self.physicsBody?.contactTestBitMask = ShapeCategory
        
        acceptedShape = detectedShape
        acceptedColor = colorDetected
    }
    
    public func ReceiveShape(shape : Shape) -> Void{
        if shape.IsClicked {
            if acceptedShape == shape.currentShape{
                if acceptedColor == shape.currentColor{
                    GameManager.Instance.IncreaseScore()
                    shape.removeFromParent()
                }
            }
        }
        
    }
    
    
    init(imageName: String, shapeAccepted : Shapes, colorDetected : Colors) {
        
        super.init(imageName: imageName)
        Initialize(detectedShape: shapeAccepted, colorDetected: colorDetected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
