//
//  DifficucltyMenu.swift
//  SlotBlocks
//
//  Created by Colin on 2019-04-13.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class DifficultyMenu: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var easyButton : MenuButton?
    var hardButton : MenuButton?
    var extremeButton : MenuButton?
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    
    override func didMove(to view: SKView) {
        let menuMusic = SKAudioNode(fileNamed: "settingMusic.mp3")
        menuMusic.autoplayLooped = true
        menuMusic.run(SKAction.changeVolume(by: GameManager.Instance.Volume, duration: 0))
        addChild(menuMusic)
    }
    
    fileprivate func InitializeButtons(){
        guard let easyplayMenuButton = childNode(withName: "easyButton") as? MenuButton else { return }
        easyButton = easyplayMenuButton
        easyButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        easyButton?.AddCallback (callback:{
            GameManager.Instance.GameSpeedMultiplier = 0.5
            let gameScene = Level1Scene(fileNamed: "GameScene")
            gameScene?.scaleMode = .aspectFill
            self.view!.presentScene(gameScene)
        })
        
        guard let hardplayMenuButton = childNode(withName: "hardButton") as? MenuButton else { return }
        hardButton = hardplayMenuButton
        hardButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        hardButton?.AddCallback (callback:{
            GameManager.Instance.GameSpeedMultiplier = 0.75
            let nextScene = Level1Scene(fileNamed: "GameScene")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        })
        
        guard let extremePlayMenuButton = childNode(withName: "extremeButton") as? MenuButton else {return}
        extremeButton = extremePlayMenuButton
        extremeButton?.AddCallback {
            GameManager.Instance.GameSpeedMultiplier = 1
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
    
}
