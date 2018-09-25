// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// DungeonCharacter.swift

import Foundation

// represents any character in the game
class DungeonCharacter {
    let name: String
    var hitPoints: Int
    let attackSpeed: Int
    let damageRange: (min: Int, max: Int)
    var opponentHitChance: Double
    
    // initializes tbe cbaracter
    init(name: String, hitPoints: Int, attackSpeed: Int, damageRange: (min: Int, max: Int), opponentHitChance: Double) {
        self.name = name
        self.hitPoints = hitPoints
        self.attackSpeed = attackSpeed
        self.damageRange.min = damageRange.min
        self.damageRange.max = damageRange.max
        self.opponentHitChance = opponentHitChance
    }
}
