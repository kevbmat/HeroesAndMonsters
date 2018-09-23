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
    
    func crushingBlow() {
        let hitChance = Double.random(in: 0...1)
        if hitChance <= 0.4 {
            print("The enemy was hit by a Crushing Blow!")
            let damage = Int.random(in: 75...175)
            enemy.hitPoints -= damage
        } else {
            print("Crushing Blow attack Failed :(")
        }
    }
}
