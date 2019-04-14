//
//  HighScores.swift
//  SlotBlocks
//
//  Created by Colin on 2019-04-13.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import GameplayKit

class HighScores: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var exitButton : MenuButton?
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    
    fileprivate func InitializeButtons(){
        guard let exitMenuButton = childNode(withName: "exitButton") as? MenuButton else { return }
        exitButton = exitMenuButton
      //  exitButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        exitButton?.AddCallback (callback:{
            let menuScene = Level1Scene(fileNamed: "MainMenuScene")
            menuScene?.scaleMode = .aspectFill
            self.view!.presentScene(menuScene)
        })
        
        
        menuController.AddButton(menuButton: exitButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
    
    
    
}
