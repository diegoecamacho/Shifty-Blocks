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
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    
    fileprivate func InitializeButtons(){
        guard let playMenuButton = childNode(withName: "PlayButton") as? MenuButton else { return }
        playButton = playMenuButton
        playButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        playButton?.AddCallback (callback:{
            let gameScene = Level1Scene(fileNamed: "GameScene")
            gameScene?.scaleMode = .aspectFill
            self.view!.presentScene(gameScene)
        })
        
        guard let scoreMenuButton = childNode(withName: "HighScoreButton") as? MenuButton else { return }
        highScoreButton = scoreMenuButton
        highScoreButton?.SetSelectionSprite(fileName: "HighButtonActive")
        highScoreButton?.AddCallback (callback:{
            print("Hello Menu")
        })
        
        menuController.AddButton(menuButton: playButton!)
        menuController.AddButton(menuButton: highScoreButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    
}




