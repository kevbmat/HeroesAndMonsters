//
//  Hero.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/18/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Hero: DungeonCharacter {
    var chanceToBlock: Double
    override var hitPoints: Int {
        didSet {
            if hitPoints < oldValue {
                let chance = Double.random(in: 0...1)
                print(chance)
                if chance <= chanceToBlock {
                    print("You blocked the enemy attack!")
                    hitPoints = oldValue
                }
            }
        }
    }
    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageRange: (min: Int, max: Int), opponentHitChance: Double, chanceToBlock: Double) {
        self.chanceToBlock = chanceToBlock
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageRange: (min: damageRange.min, max: damageRange.max), opponentHitChance: opponentHitChance)
    }
    
    func getName() -> String {
        return name
    }
    
    func numberOfTurns(enemy: Monster) -> Int {
        return attackSpeed / enemy.attackSpeed
    }
}
