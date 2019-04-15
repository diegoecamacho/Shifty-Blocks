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
        GameManager.Instance.GameOver = false
        GameManager.Instance.CurrentFails = 0
    }
    
    override func didMove(to view: SKView) {
        let menuMusic = SKAudioNode(fileNamed: "settingMusic.mp3")
        menuMusic.autoplayLooped = true
        menuMusic.run(SKAction.changeVolume(by: GameManager.Instance.Volume, duration: 0))
        addChild(menuMusic)
    }
    
    func SetScore(){
        let score = GameManager.Instance.Score
        let scoreText = childNode(withName: "scoreText")
        roundScore = scoreText as? SKLabelNode
        roundScore?.text = String(score)
        if(GameManager.Instance.GameSpeedMultiplier == 0.5){
            //set easy high score
            if(GameManager.Instance.Score >= GameManager.Instance.EasyHighScore){
                GameManager.Instance.EasyHighScore = GameManager.Instance.Score
            }
        }
        if(GameManager.Instance.GameSpeedMultiplier == 0.75){
            //set hard high score
            if(GameManager.Instance.Score >= GameManager.Instance.HardHighScore){
                GameManager.Instance.HardHighScore = GameManager.Instance.Score
            }
        }
        if(GameManager.Instance.GameSpeedMultiplier == 1){
            //set extreme high score
            if(GameManager.Instance.Score >= GameManager.Instance.ExtremeHighScore){
                GameManager.Instance.ExtremeHighScore = GameManager.Instance.Score
            }
        }
    }
    
    fileprivate func InitializeButtons(){
        guard let playMenuButton = childNode(withName: "PlayButton") as? MenuButton else { return }
        playButton = playMenuButton
        playButton?.AddCallback (callback:{
            GameManager.Instance.Score = 0
            self.playButton?.SetSelectionSprite(fileName: "redButton")
            let nextScene = Level1Scene(fileNamed: "GameScene")
            let sceneTransition = SKTransition.crossFade(withDuration: 1.0)
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene!, transition: sceneTransition)
        })
        
        guard let mainMenuButton = childNode(withName: "MenuButton") as? MenuButton else {return}
        menuButton = mainMenuButton
        menuButton?.AddCallback {
            self.menuButton?.SetSelectionSprite(fileName: "redButton")
            let sceneTransition = SKTransition.crossFade(withDuration: 1.0)
            let nextScene = SettingsMenu(fileNamed: "MainMenuScene")
            nextScene?.scaleMode = .aspectFill
            self.view!.presentScene(nextScene!, transition: sceneTransition)
        }
        
        menuController.AddButton(menuButton: playButton!)
        menuController.AddButton(menuButton: menuButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
}
