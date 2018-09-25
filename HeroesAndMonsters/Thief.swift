//
//  Thief.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/22/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
// fix thief special attack

import Foundation

class Thief: Hero {
    init(name: String, enemy: Monster) {
        super.init(name: name, hitPoints: 75, attackSpeed: 6, damageRange: (min: 20, max: 40), opponentHitChance: 0.8, chanceToBlock: 0.4, enemy: enemy)
    }
    
    override func specialAttack() {
        print("\(name) is about to attempt at surprise attack...")
        let attackChance = Double.random(in: 0...1)
        if attackChance <= 0.2 {
            print("\(name)'s surprise attack was caught by \(enemy.name)!")
        } else if attackChance > 0.2 && attackChance <= 0.6 {
            print("\(name)'s surprise attack was never seen! \(name) gets +1 turn")
            turns += 1
            game.doNormalAttack()
        } else {
            print("\(name)'s suprise attack halfway succeeds, plays a normal attack.")
            game.doNormalAttack()
        }
    }
}
