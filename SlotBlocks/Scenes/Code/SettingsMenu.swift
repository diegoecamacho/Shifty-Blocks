//
//  SettingsMenu.swift
//  SlotBlocks
//
//  Created by Colin on 2019-04-13.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class SettingsMenu: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var exitButton : MenuButton?
    var muteButton : MenuButton?
    var lVolumeButton : MenuButton?
    var rVolumeButton : MenuButton?
    var volumeLabel : SKLabelNode?
    var music : SKAudioNode?
    
    override func sceneDidLoad() {
        InitializeButtons()
    }
    
    override func didMove(to view: SKView) {
        let menuMusic = SKAudioNode(fileNamed: "settingMusic.mp3")
        menuMusic.autoplayLooped = true
        menuMusic.run(SKAction.changeVolume(by: GameManager.Instance.Volume, duration: 0))
        addChild(menuMusic)
        music = menuMusic
    }
    
   override func update(_ currentTime: TimeInterval) {
        guard let volumeLabelText = childNode(withName: "volumeLabel") as? SKLabelNode else {return}
        volumeLabel = volumeLabelText
        volumeLabel?.text = String(GameManager.Instance.Volume * 100)
        music?.run(SKAction.changeVolume(by: GameManager.Instance.Volume, duration: 0))

    }
    
    fileprivate func InitializeButtons(){
        guard let exitMenuButton = childNode(withName: "exitButton") as? MenuButton else { return }
        exitButton = exitMenuButton
        //  exitButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        exitButton?.AddCallback (callback:{
            
            let menuScene = Level1Scene(fileNamed: "MainMenuScene")
            menuScene?.scaleMode = .aspectFill
            self.view!.presentScene(menuScene)
        })
        
        guard let lowerVolumeButton = childNode(withName: "volumeDownButton") as? MenuButton else {return}
        lVolumeButton = lowerVolumeButton
        lVolumeButton?.AddCallback {
            self.lVolumeButton?.SetSelectionSprite(fileName: "redButtonMinus")
            let buttonClick = SKAction.playSoundFileNamed("buttonClick_Sound", waitForCompletion: false)
            self.run(buttonClick)
            if(GameManager.Instance.Volume > -1 ){
                GameManager.Instance.Volume -= 0.1
            }
            else{
                GameManager.Instance.Volume = -1
            }
        }
        
        guard let raiseVolumeButton = childNode(withName: "volumeUpButton") as? MenuButton else {return}
        rVolumeButton = raiseVolumeButton
        rVolumeButton?.AddCallback {
            self.rVolumeButton?.SetSelectionSprite(fileName: "greenButtonPlus")
            let buttonClick = SKAction.playSoundFileNamed("buttonClick_Sound", waitForCompletion: false)
            self.run(buttonClick)
            if(GameManager.Instance.Volume < 1 ){
                GameManager.Instance.Volume += 0.1
            }
            else{
                GameManager.Instance.Volume = 1
            }
        }
        
        
        guard let muteToggleButton = childNode(withName: "muteButton") as? MenuButton else{ return }
        muteButton = muteToggleButton
        if(GameManager.Instance.GlobalMute){
            muteToggleButton.SetDefaultSprite(fileName: "redMuteButton")
        }
        else{
            muteToggleButton.SetDefaultSprite(fileName: "greenMuteButton")
        }
        muteButton?.AddCallback (callback:{
            if(!GameManager.Instance.GlobalMute){
                GameManager.Instance.GlobalMute = true
                muteToggleButton.SetSelectionSprite(fileName: "redMuteButton")
                //mute game sounds here
               GameManager.Instance.Volume = -1
                
            }
            else{
                GameManager.Instance.GlobalMute = false
                muteToggleButton.SetSelectionSprite(fileName: "greenMuteButton")
                GameManager.Instance.Volume = 1
            }
        })
        
        
        menuController.AddButton(menuButton: exitButton!)
        menuController.AddButton(menuButton: muteButton!)
        menuController.AddButton(menuButton: lVolumeButton!)
        menuController.AddButton(menuButton: rVolumeButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }

}
