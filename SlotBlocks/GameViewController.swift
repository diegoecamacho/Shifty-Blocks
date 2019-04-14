//
//  GameViewController.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var musicVolume : Float = 1.0

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = Level1Scene(fileNamed: "MainMenuScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsPhysics = true
            view.showsNodeCount = true
            view.ignoresSiblingOrder = true
        }
    }

}
