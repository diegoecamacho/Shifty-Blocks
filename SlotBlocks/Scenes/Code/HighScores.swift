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
        SetupHighScores()
    }
    
    override func didMove(to view: SKView) {
        let menuMusic = SKAudioNode(fileNamed: "settingMusic.mp3")
        menuMusic.autoplayLooped = true
        menuMusic.run(SKAction.changeVolume(by: GameManager.Instance.Volume, duration: 0))
        addChild(menuMusic)
    }
    
    fileprivate func InitializeButtons(){
        guard let exitMenuButton = childNode(withName: "exitButton") as? MenuButton else { return }
        exitButton = exitMenuButton
      //exitButton?.SetSelectionSprite(fileName: "redMenuButton")
        exitButton?.AddCallback (callback:{
            let menuScene = Level1Scene(fileNamed: "MainMenuScene")
            menuScene?.scaleMode = .aspectFill
            self.view!.presentScene(menuScene)
        })
        
    
        
        menuController.AddButton(menuButton: exitButton!)
    }
    func SetupHighScores(){
        guard let easyHighScore = childNode(withName: "EasyHighScore") as? SKLabelNode else {return}
        easyHighScore.text = "Easy: " + String(GameManager.Instance.EasyHighScore)
        
        guard let hardHighScore = childNode(withName: "HardHighScore") as? SKLabelNode else {return}
        hardHighScore.text = "Hard: " + String(GameManager.Instance.HardHighScore)
        
        guard let extremeHighScore = childNode(withName: "ExtremeHighScore") as? SKLabelNode else {return}
        extremeHighScore.text = "Extreme: " + String(GameManager.Instance.ExtremeHighScore)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
    
    
    
}
