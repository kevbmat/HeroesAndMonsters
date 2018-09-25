// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Hero.swift

import Foundation

// represents the hero character in the game
class Hero: DungeonCharacter {
    // chance to block the enemy attack
    var chanceToBlock: Double
    // reference to the enemy character
    var enemy: Monster
    // number of turns the hero is allotted per round
    var turns: Int
    
    // initializes the hero to a default state
    init() {
        chanceToBlock = 0.4
        enemy = Monster()
        turns = 4
        super.init(name: "Hero", hitPoints: 40, attackSpeed: 3, damageRange: (min: 40, max: 80), opponentHitChance: 0.2)
    }
    
    // initializes the hero with custom statistics
    init(name: String, hitPoints: Int, attackSpeed: Int, damageRange: (min: Int, max: Int), opponentHitChance: Double, chanceToBlock: Double, enemy: Monster) {
        self.chanceToBlock = chanceToBlock
        self.enemy = enemy
        turns = attackSpeed / enemy.attackSpeed
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageRange: (min: damageRange.min, max: damageRange.max), opponentHitChance: opponentHitChance)
    }
    
    // returns the name of the hero
    func getName() -> String {
        return name
    }
    
    // represents the hero special attack
    func specialAttack() {
        print("To be implemented by children")
    }
    
    // represents the hero attack
    // onto the enemy
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
