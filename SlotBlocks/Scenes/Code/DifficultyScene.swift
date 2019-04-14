//
//  MainMenuScene.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit
import GameplayKit

class DifficultyScene: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var playButton : MenuButton?
    var highScoreButton : MenuButton?
    var settingsButton : MenuButton?
    
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    
    fileprivate func InitializeButtons(){
        guard let playMenuButton = childNode(withName: "PlayButton") as? MenuButton else { return }
        playButton = playMenuButton
        playButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        playButton?.AddCallback (callback:{
            let nextScene = Level1Scene(fileNamed: "DifficultyMenu")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        })
        
        guard let scoreMenuButton = childNode(withName: "HighScoreButton") as? MenuButton else { return }
        highScoreButton = scoreMenuButton
        highScoreButton?.SetSelectionSprite(fileName: "HighButtonActive")
        highScoreButton?.AddCallback (callback:{
            let nextScene = HighScores(fileNamed: "HighScores")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        })
        
        guard let settingsMenuButton = childNode(withName: "SettingsButton") as? MenuButton else {return}
        settingsButton = settingsMenuButton
        settingsButton?.AddCallback {
            let nextScene = SettingsMenu(fileNamed: "SettingsMenu")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
        
        menuController.AddButton(menuButton: playButton!)
        menuController.AddButton(menuButton: highScoreButton!)
        menuController.AddButton(menuButton: settingsButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
    
}
