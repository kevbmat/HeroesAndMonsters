//
//  Monster.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/18/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Monster: DungeonCharacter {
    let chanceToHeal: Double
    let healRange: (min: Int, max: Int)
    
    init() {
        chanceToHeal = 20
        healRange = (min: 20, max: 40)
        super.init(name: "Monster", hitPoints: 200, attackSpeed: 4, damageRange: (min: 40, max: 80), opponentHitChance: 0.5)
    }
    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageRange: (min: Int, max: Int), chanceToHeal: Double, healRange: (min: Int, max: Int), opponentHitChance: Double) {
        self.chanceToHeal = chanceToHeal
        self.healRange.min = healRange.min
        self.healRange.max = healRange.max
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageRange: (min: damageRange.min, max: damageRange.max), opponentHitChance: opponentHitChance)
    }
    
    func heal() {
        let chance = Double.random(in: 0...1)
        if chance <= chanceToHeal {
            let heal = Int.random(in: healRange.min...healRange.max)
            hitPoints += heal
            print("\(name) has healed up \(heal) hit points")
        } else {
            print("\(name) has failed to heal at this time")
        }
    }
    
    func attack(enemy: inout Hero) {
        print("\(name) is attempting to attack \(enemy.name)...")
        let chance = Double.random(in: 0...1)
        if chance <= opponentHitChance {
            let blockChance = Double.random(in: 0...1)
            if blockChance <= enemy.chanceToBlock {
                print("\(enemy.name) has succesfully blocked \(name)'s attack!")
            } else {
                let damage = Int.random(in: damageRange.min...damageRange.max)
                enemy.hitPoints -= damage
                print("\(name) successfully attacks \(enemy.name) for \(damage) points")
            }
        } else {
            print("\(name) failed to attack \(enemy.name)")
        }
    }
}
