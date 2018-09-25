// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Skeleton.swift

import Foundation

class Skeleton: Monster {
    // initializes the Skeleton
    init(name: String) {
        super.init(name: name, hitPoints: 100, attackSpeed: 3, damageRange: (min: 30, max: 50), chanceToHeal: 0.3, healRange: (min: 30, max: 50), opponentHitChance: 0.8)
    }
    
    // represents the Skeleton's special attack
    // enemy is the Hero being attacked
    override func specialAttack(enemy: inout Hero) {
        print("\(name) has activated ELUSIVE DODGES...")
        enemy.opponentHitChance -= 0.2
        print("\(name) has decreased \(enemy.name)'s opponent hit chance by 0.2")
    }
}
