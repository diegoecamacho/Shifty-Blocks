//
//  MenuButton.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

enum buttonState {
    case ButtonActive, ButtonSelected, ButtonHidden
}

class MenuButton: SKSpriteNode {
    public var SelectionSprite:SKTexture?
    
    public var buttonCallback: (() -> Void)?
    
    var buttonState: buttonState = .ButtonActive{
        didSet{
            switch buttonState {
            case .ButtonActive:
                OnActive()
                break
            case .ButtonHidden:
                OnHide()
                break
            case .ButtonSelected:
                OnSelected()
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(fileNamed: String, hoverSpriteFileName: String){
        let tempTexture = SKTexture(imageNamed: fileNamed)
        super.init(texture: tempTexture, color: UIColor.clear, size: tempTexture.size())
        
        SetSelectionSprite(fileName: hoverSpriteFileName)
    }
    
    public func SetDefaultSprite(fileName:String) -> Void{
       let tempTexture = SKTexture(imageNamed: fileName)
        texture = tempTexture
    }
    
    public func SetSelectionSprite(fileName:String) -> Void{
        let tempTexture = SKTexture(imageNamed: fileName)
        SelectionSprite = tempTexture
        //play sound
        SKAction.playSoundFileNamed("buttonClick_Sound", waitForCompletion: true)
      
    }
    
    public func AddCallback(callback: @escaping () -> Void){
        buttonCallback = callback
    }
    
    public func Run(){
        buttonCallback?()
        buttonState = .ButtonSelected
    }
    
    public func OnSelected(){
        texture = SelectionSprite
    }
    
    public func OnHide(){
        fatalError("Not Implemented")
    }
    
    public func OnActive(){
        fatalError("Not Implemented")
    }
    
    public func IsClicked(position :CGPoint) -> Bool {
        let result = contains(position)
        return result
    }
}
