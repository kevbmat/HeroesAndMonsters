//
//  Hero.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/18/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Hero: DungeonCharacter {
    var chanceToBlock: Double = 0.4
    override var hitPoints: Int {
        didSet {
            let chance = Double.random(in: 0...1)
            if chance <= chanceToBlock {
                print("The Hero has blocked the attack!")
                hitPoints = oldValue
            }
        }
    }
    
    func getName() -> String {
        return name
    }
}
