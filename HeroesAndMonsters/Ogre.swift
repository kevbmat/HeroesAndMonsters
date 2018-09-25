// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Ogre.swift

import Foundation

// represents the monster Ogre
class Ogre: Monster {
    // initalizes the Ogre
    init(name: String) {
        super.init(name: name, hitPoints: 200, attackSpeed: 2, damageRange: (min: 30, max: 60), chanceToHeal: 0.1, healRange: (min: 30, max: 60), opponentHitChance: 0.6)
    }
    
    // represents the Ogre's special attack
    // enemy is the Hero being attacked
    override func specialAttack(enemy: inout Hero) {
        print("\(name) has activated MAX SLAM...")
        enemy.hitPoints -= damageRange.max
        print("\(name) has slammed \(damageRange.max) hitpoints out of \(enemy.name)")
    }
}
