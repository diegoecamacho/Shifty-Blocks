//
//  SettingsMenu.swift
//  SlotBlocks
//
//  Created by Colin on 2019-04-13.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import GameplayKit

class SettingsMenu: SKScene {
    
    var menuController : ButtonController  = ButtonController()
    
    var exitButton : MenuButton?
    var muteButton : MenuButton?
    var gv : GameViewController?
    var globalMute = false
    
    override func sceneDidLoad() {
        InitializeButtons()
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
        guard let muteToggleButton = childNode(withName: "muteButton") as? MenuButton else{ return }
        muteButton = muteToggleButton
        var isMuted = false
        globalMute = isMuted
        muteButton?.AddCallback (callback:{
            if(!isMuted){
                muteToggleButton.SetSelectionSprite(fileName: "redMuteButton")
                isMuted = true
                //mute game sounds here
                guard let GVC = self.gv else {return}
                //GVC.setBackgroundMusicVolume(to: 0)
                
            }
            else{
                isMuted = false
                muteToggleButton.SetSelectionSprite(fileName: "greenMuteButton")
                guard let GVC = self.gv else {return}
                //GVC.setBackgroundMusicVolume(to: 1)
            }
        })
        
        
        menuController.AddButton(menuButton: exitButton!)
        menuController.AddButton(menuButton: muteButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }

}
