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
    var enemy: Monster
    var turns: Int
    
    init() {
        chanceToBlock = 0.4
        enemy = Monster()
        turns = 4
        super.init(name: "Hero", hitPoints: 40, attackSpeed: 3, damageRange: (min: 40, max: 80), opponentHitChance: 0.2)
    }
    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageRange: (min: Int, max: Int), opponentHitChance: Double, chanceToBlock: Double, enemy: Monster) {
        self.chanceToBlock = chanceToBlock
        self.enemy = enemy
        turns = attackSpeed / enemy.attackSpeed
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageRange: (min: damageRange.min, max: damageRange.max), opponentHitChance: opponentHitChance)
    }
    
    func getName() -> String {
        return name
    }
    
    func specialAttack() {
        print("To be implemented by children")
    }
    
    func attack(enemy: inout Monster) {
        let chance = Double.random(in: 0...1)
        if chance <= opponentHitChance {
            let damage = Int.random(in: damageRange.min...damageRange.max)
            enemy.hitPoints -= damage
            print("\(name) successfully attacks \(enemy.name)")
            print("\(enemy.name) got attacked for \(damage) points")
        } else {
            print("\(name) failed to attack \(enemy.name)")
        }
    }
}
