//
//  Warrior.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/22/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Warrior: Hero {
    init(name: String, enemy: Monster) {
        super.init(name: name, hitPoints: 25, attackSpeed: 4, damageRange: (min: 35, max: 60), opponentHitChance: 0.8, chanceToBlock: 0.2, enemy: enemy)
    }
    
    override func specialAttack() {
        print("\(name) is about to attempt a crushing blow...")
        let hitChance = Double.random(in: 0...1)
        if hitChance <= 0.4 {
            let damage = Int.random(in: 75...175)
            enemy.hitPoints -= damage
            print("\(name) lands the crushing blow on \(enemy.name)! \(enemy.name) loses \(damage) hit points")
        } else {
            print("\(name) fails to land the crushing blow on \(enemy.name)")
        }
    }
}
