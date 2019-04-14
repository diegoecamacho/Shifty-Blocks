//
//  ResultsScreen.swift
//  SlotBlocks
//
//  Created by Colin on 2019-04-13.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

class ResultsScreen: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var playButton : MenuButton?
    var menuButton : MenuButton?
    var roundScore : SKLabelNode?
    
    override func sceneDidLoad() {
        InitializeButtons()
        SetScore()
    }
    
    func SetScore(){
        let score = GameManager.Instance.Score
        let scoreText = childNode(withName: "scoreText")
        roundScore = scoreText as? SKLabelNode
        roundScore?.text = String(score)
    }
    
    fileprivate func InitializeButtons(){
        guard let playMenuButton = childNode(withName: "PlayButton") as? MenuButton else { return }
        playButton = playMenuButton
        playButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        playButton?.AddCallback (callback:{
            let nextScene = Level1Scene(fileNamed: "GameScene")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        })
        
        guard let mainMenuButton = childNode(withName: "MenuButton") as? MenuButton else {return}
        menuButton = mainMenuButton
        menuButton?.AddCallback {
            let nextScene = SettingsMenu(fileNamed: "MainMenuScene")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
        
        menuController.AddButton(menuButton: playButton!)
        menuController.AddButton(menuButton: menuButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
}
