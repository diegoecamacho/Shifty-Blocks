//
//  DifficucltyMenu.swift
//  SlotBlocks
//
//  Created by Colin on 2019-04-13.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

class DifficultyMenu: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var easyButton : MenuButton?
    var hardButton : MenuButton?
    var extremeButton : MenuButton?
    let difficultyOptions = [1,2,3]
    var difficulty : Int?
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    
    fileprivate func InitializeButtons(){
        guard let easyplayMenuButton = childNode(withName: "easyButton") as? MenuButton else { return }
        easyButton = easyplayMenuButton
        easyButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        easyButton?.AddCallback (callback:{
            //self.difficulty! = self.difficultyOptions[0]
            let gameScene = Level1Scene(fileNamed: "GameScene")
            gameScene?.scaleMode = .aspectFill
            self.view!.presentScene(gameScene)
        })
        
        guard let hardplayMenuButton = childNode(withName: "hardButton") as? MenuButton else { return }
        hardButton = hardplayMenuButton
        hardButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        hardButton?.AddCallback (callback:{
            //self.difficulty! = self.difficultyOptions[1]
            let nextScene = Level1Scene(fileNamed: "GameScene")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        })
        
        guard let extremePlayMenuButton = childNode(withName: "extremeButton") as? MenuButton else {return}
        extremeButton = extremePlayMenuButton
        extremeButton?.AddCallback {
            //self.difficulty! = self.difficultyOptions[2]
            let nextScene = Level1Scene(fileNamed: "GameScene")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
        
        menuController.AddButton(menuButton: easyButton!)
        menuController.AddButton(menuButton: hardButton!)
        menuController.AddButton(menuButton: extremeButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
