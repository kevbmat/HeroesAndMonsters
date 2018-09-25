// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Warrior.swift

import Foundation

// represents the specific hero Warrior
class Warrior: Hero {
    // initializes the warrior
    init(name: String, enemy: Monster) {
        super.init(name: name, hitPoints: 25, attackSpeed: 4, damageRange: (min: 35, max: 60), opponentHitChance: 0.8, chanceToBlock: 0.2, enemy: enemy)
    }
    
    // warrior special attack, in which the warrior
    // delivers a powerful crushing blow to the enemy
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
