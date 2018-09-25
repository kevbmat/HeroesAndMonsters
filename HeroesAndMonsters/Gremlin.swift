// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Gremlin.swift

import Foundation

// represents the monster Gremlin
class Gremlin: Monster {
    // initializes the Gremlin
    init(name: String) {
        super.init(name: name, hitPoints: 70, attackSpeed: 5, damageRange: (min: 15, max: 30), chanceToHeal: 0.4, healRange: (min: 20, max: 40), opponentHitChance: 0.8)
    }
    
    // represents the Gremlin's special attack
    // enemy is the Hero being attacked
    override func specialAttack(enemy: inout Hero) {
        print("\(name) has activated INSTA HEAL...")
        hitPoints += healRange.max
        print("\(name) has instantly healed up \(healRange.max) hitpoints")
    }
}
