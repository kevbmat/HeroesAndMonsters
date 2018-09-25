// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Thief.swift

import Foundation

// represents the thief hero
class Thief: Hero {
    // initializes the thief
    init(name: String, enemy: Monster) {
        super.init(name: name, hitPoints: 75, attackSpeed: 6, damageRange: (min: 20, max: 40), opponentHitChance: 0.8, chanceToBlock: 0.4, enemy: enemy)
    }
    
    // rerpesents the thief special attack, in which
    // if it succeeds, the user gets a second turn
    override func specialAttack() {
        print("\(name) is about to attempt at surprise attack...")
        let attackChance = Double.random(in: 0...1)
        if attackChance <= 0.2 {
            print("\(name)'s surprise attack was caught by \(enemy.name)!")
        } else if attackChance > 0.2 && attackChance <= 0.6 {
            print("\(name)'s surprise attack was never seen! \(name) gets +1 turn")
            turns += 1
            game.doNormalAttack()
        } else {
            print("\(name)'s suprise attack halfway succeeds, plays a normal attack.")
            game.doNormalAttack()
        }
    }
}
