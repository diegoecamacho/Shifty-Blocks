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
    var music : SKAudioNode!
    
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    override func didMove(to view: SKView) {
        let menuMusic = SKAudioNode(fileNamed: "menuMusic.mp3")
        menuMusic.autoplayLooped = true
        menuMusic.run(SKAction.changeVolume(by: GameManager.Instance.Volume, duration: 0))
        addChild(menuMusic)
      //  let volume = SKAction.changeVolume(to: 0, duration: 1)
        
      //  let sound = SKAction.playSoundFileNamed("menuMusic", waitForCompletion: false)
        
      //  let sequence = SKAction.group([volume,sound])
        
      //  run(sequence)
      //  music = menuMusic
        
    }

    
    fileprivate func InitializeButtons(){
        guard let playMenuButton = childNode(withName: "PlayButton") as? MenuButton else { return }
        playButton = playMenuButton
        playButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        playButton?.AddCallback (callback:{
            self.music?.run(SKAction.stop())
            GameManager.Instance.Score = 0
            let nextScene = DifficultyMenu(fileNamed: "DifficultyMenu")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        })
        
        guard let scoreMenuButton = childNode(withName: "HighScoreButton") as? MenuButton else { return }
        highScoreButton = scoreMenuButton
        highScoreButton?.SetSelectionSprite(fileName: "HighButtonActive")
        highScoreButton?.AddCallback (callback:{
            self.music?.run(SKAction.stop())
            let nextScene = HighScores(fileNamed: "HighScores")
            self.removeAllActions()
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        })
        
        guard let settingsMenuButton = childNode(withName: "SettingsButton") as? MenuButton else {return}
        settingsButton = settingsMenuButton
        settingsButton?.AddCallback {
            self.music?.run(SKAction.stop())
            let nextScene = SettingsMenu(fileNamed: "SettingsMenu")
            self.removeAllActions()
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
        guard let helpMenuButton = childNode(withName: "HelpButton") as? MenuButton else {return}
        helpButton = helpMenuButton
        helpButton?.AddCallback {
            self.music?.run(SKAction.stop())
            let nextScene = SettingsMenu(fileNamed: "HelpMenu")
            self.removeAllActions()
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene)
        }
        
        
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




