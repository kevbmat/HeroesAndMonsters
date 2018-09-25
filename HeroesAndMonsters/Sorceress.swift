// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Sorceress.swift

import Foundation

// represents the specific hero Sorceress
class Sorceress: Hero {
    // initializes the sorceress
    init(name: String, enemy: Monster) {
        super.init(name: name, hitPoints: 75, attackSpeed: 6, damageRange: (min: 20, max: 40), opponentHitChance: 0.8, chanceToBlock: 0.4, enemy: enemy)
    }
    
    // Sorceress special attack, in which the user can heal
    override func specialAttack() {
        let healPoints = Int.random(in: 20...40)
        hitPoints += healPoints
        print("\(name) is about to perform a heal...")
        print("\(name) heals up by \(healPoints) hit points")
    }
}
