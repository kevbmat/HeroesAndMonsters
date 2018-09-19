//
//  DungeonCharacter.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/18/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class DungeonCharacter {
    let name: String
    var hitPoints: Int
    let attackSpeed: Int
    let damageRange: (min: Int, max: Int)
    let opponentHitChance: Double
    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageRange: (min: Int, max: Int), opponentHitChance: Double) {
        self.name = name
        self.hitPoints = hitPoints
        self.attackSpeed = attackSpeed
        self.damageRange.min = damageRange.min
        self.damageRange.max = damageRange.max
        self.opponentHitChance = opponentHitChance
    }
    
    func attack(enemy: DungeonCharacter) {
        let chance = Double.random(in: 0...1)
        if chance <= opponentHitChance {
            let damage = Int.random(in: damageRange.min...damageRange.max)
            enemy.hitPoints -= damage
            print("You have dealt \(damage) damage!")
        } else {
            print("Attack failed :(")
        }
    }
}
