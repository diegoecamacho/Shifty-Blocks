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
    var acceptedShape : Shapes? = .Square
    var acceptedColor : Colors? = .None
    
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
    
    var currentColor : Colors = .Green //{
        //didSet{
        //    switch currentShape {
        //    case .Square:
        //        let tempTexture = SKTexture(imageNamed: "SquareShape")
        //        texture = tempTexture
        //        break
        //    case .Circle:
        //        let tempTexture = SKTexture(imageNamed: "CircleShape")
        //        texture = tempTexture
        //        break
        //    case .Triangle:
        //        let tempTexture = SKTexture(imageNamed: "TriangleShape")
        //        texture = tempTexture
        //        break
        //    }
        //
        //}
    //}
    
    
    
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
        if acceptedShape == shape.currentShape{
            if acceptedColor == shape.currentColor{
                shape.removeFromParent()
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
