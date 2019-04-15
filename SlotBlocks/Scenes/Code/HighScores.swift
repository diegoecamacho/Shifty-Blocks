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
      //exitButton?.SetSelectionSprite(fileName: "redMenuButton")
        exitButton?.AddCallback (callback:{
            let menuScene = Level1Scene(fileNamed: "MainMenuScene")
            menuScene?.scaleMode = .aspectFill
            self.view!.presentScene(menuScene)
        })
        
        func SetupHighScores(){
            guard let easyHighScore = childNode(withName: "EasyHighScore") else {return}
           // easyHighScore = GameManager.Instance.EasyHighScore
            
            guard let hardHighScore = childNode(withName: "HardHighScore") else {return}
           // hardHighScore = GameManager.Instance.HardHighScore
            
            guard let extremeHighScore = childNode(withName: "ExtremeHighScore") else {return}
           // ExtremeHighScore = GameManager.Instance.ExtremeHighScore
        }
        
        
        menuController.AddButton(menuButton: exitButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
    
    
    
}
