//
//  ButtonController.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit

class ButtonController {
    
    var sceneButtons = [MenuButton]()
    
    init() {
    }
    
    public func AddButton(menuButton : MenuButton){
        sceneButtons.append(menuButton)
    }
    
    public func handle(point : CGPoint){
        for button in sceneButtons {
            if button.IsClicked(position: point){
                button.Run()
            }
        }
    }
    
    
}
