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
    var acceptedShape : Shapes?
    
    init(imageName: String, shapeAccepted : Shapes) {
        super.init(imageName: imageName)
        acceptedShape = shapeAccepted
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
