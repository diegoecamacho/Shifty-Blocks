//
//  MainMenuScene.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuScene: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var playButton : MenuButton?
    var highScoreButton : MenuButton?
    var settingsButton : MenuButton?
    var helpButton : MenuButton?
    var music : SKAudioNode?
    
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    override func didMove(to view: SKView) {
        let menuMusic = SKAudioNode(fileNamed: "/Sounds/menuMusic.mp3")
        //  menuMusic.run(SKAction.changeVolume(to: 1, duration: 0))
        menuMusic.autoplayLooped = true
        addChild(menuMusic)
        music = menuMusic
        
    }

    
    fileprivate func InitializeButtons(){
        guard let playMenuButton = childNode(withName: "PlayButton") as? MenuButton else { return }
        playButton = playMenuButton
        playButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        playButton?.AddCallback (callback:{
            let nextScene = DifficultyMenu(fileNamed: "DifficultyMenu")
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
        guard let helpMenuButton = childNode(withName: "HelpButton") as? MenuButton else {return}
        helpButton = helpMenuButton
        helpButton?.AddCallback {
            let nextScene = SettingsMenu(fileNamed: "HelpMenu")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
        
        let sound = SKAction.playSoundFileNamed("menuMusic", waitForCompletion: true)
        run(sound)
        
        menuController.AddButton(menuButton: playButton!)
        menuController.AddButton(menuButton: highScoreButton!)
        menuController.AddButton(menuButton: settingsButton!)
        menuController.AddButton(menuButton: helpButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
}




