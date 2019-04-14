//
//  HelpMenu.swift
//  SlotBlocks
//
//  Created by Colin on 2019-04-14.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

class HelpMenu: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var menuButton : MenuButton?
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    
    fileprivate func InitializeButtons(){
        guard let mainMenuButton = childNode(withName: "exitButton") as? MenuButton else {return}
        menuButton = mainMenuButton
        menuButton?.AddCallback {
            let nextScene = SettingsMenu(fileNamed: "MainMenuScene")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
        menuController.AddButton(menuButton: menuButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
