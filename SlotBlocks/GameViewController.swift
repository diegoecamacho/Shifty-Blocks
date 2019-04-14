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
import AVFoundation

let stopBackGroundMusicNotify = Notification.Name("stopBackGroundMusicNotify")
let startBackGroundMusicNotify = Notification.Name("startBackGroundMusicNotify")
let setMusicVolumeNotify = Notification.Name("SetMusicVolume")

var musicVolume : Float = 1.0

class GameViewController: UIViewController {
    
    lazy var backgroundMusic: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "battleSong", withExtension:"mp3")
            else {
                return nil
        }
        do{
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            return player
        } catch {
            return nil
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotificationObserver()
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = Level1Scene(fileNamed: "MainMenuScene") {
                playMusic()
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
    //can remove all this shit if audio is done easier
    func addNotificationObserver(){
        NotificationCenter.default.addObserver(self,selector:#selector(self.stopBackGroundMusic(_:)),
                                               name: stopBackGroundMusicNotify, object: nil)
        NotificationCenter.default.addObserver(self,selector:#selector(self.startBackGroundMusic(_:)),
                                               name: startBackGroundMusicNotify, object: nil)
        NotificationCenter.default.addObserver(self,selector:#selector(self.setMusicVolume(_:)),
                                               name: setMusicVolumeNotify, object: nil)
    }
    
    @objc func stopBackGroundMusic(_ info: Notification){
        backgroundMusic?.stop()
    }
    @objc func startBackGroundMusic(_ info: Notification){
        backgroundMusic?.play()
    }
    
    func playMusic(){
        backgroundMusic?.play()
    }
    
    @objc func setMusicVolume(_ info: Notification){
        guard let userInfo = info.userInfo else {return}
        let volume = userInfo["volume"] as! Float
            //setBackgroundMusicVolume(to: volume)
    }
}
