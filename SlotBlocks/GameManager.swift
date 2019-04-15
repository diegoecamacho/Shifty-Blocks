//
//  GameManager.swift
//  SlotBlocks
//
//  Created by Diego Camacho on 2019-04-14.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation

class GameManager {
    public static var Instance = GameManager()
    
    public var Score: Int = 0
    
    public var GameOver : Bool = false
    
    public var GameSpeedMultiplier : Int = 3
    
    public var CurrentFails: Int = 0
    
    private var MaxConsecutiveFails : Int = 3
    
    private var ScorePerFail = 20
    
    private var MultiplerHits = 0
    
    private var ScorePerHit : Int = 10
    
    public var MultiplierRatio :Int = 1
    
    private var RatioIncreaseEvery: Int = 5
    
    private var ConsecutiveHits : Int = 0
    
    public func IncreaseScore(){
        ConsecutiveHits += 1
        MultiplerHits += 1
        CurrentFails = 0
        
        if MultiplerHits >= RatioIncreaseEvery {
            MultiplierRatio += 1
            MultiplerHits = 0
        }
        
        Score += ScorePerHit * MultiplierRatio
    }
    
    public func DecreaseScore(){
        ConsecutiveHits = 0
        CurrentFails += 1
        Score -= ScorePerFail
        
        MultiplerHits = 0
        MultiplierRatio = 1
        
        
        if CurrentFails >= MaxConsecutiveFails {
            GameOver = true
        }
    }
    
    public func ResetInstance() -> Void {
        Score = 0
        CurrentFails = 0
        MultiplierRatio = 1
    }
}

