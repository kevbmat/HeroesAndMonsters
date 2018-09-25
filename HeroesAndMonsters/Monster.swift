// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// Monster.swift

import Foundation

// represents the monster character
class Monster: DungeonCharacter {
    // represents the chance that a monster has to heal
    let chanceToHeal: Double
    // possible range of values that the monster can heal
    let healRange: (min: Int, max: Int)
    
    // initializes the monster
    init() {
        chanceToHeal = 20
        healRange = (min: 20, max: 40)
        super.init(name: "Monster", hitPoints: 200, attackSpeed: 4, damageRange: (min: 40, max: 80), opponentHitChance: 0.5)
    }
    
    // initializes the monster with custom statistics
    init(name: String, hitPoints: Int, attackSpeed: Int, damageRange: (min: Int, max: Int), chanceToHeal: Double, healRange: (min: Int, max: Int), opponentHitChance: Double) {
        self.chanceToHeal = chanceToHeal
        self.healRange.min = healRange.min
        self.healRange.max = healRange.max
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageRange: (min: damageRange.min, max: damageRange.max), opponentHitChance: opponentHitChance)
    }
    
    // represents the healing of a monster,
    // a random number from the heal range is selected
    // then added to the monster hitpoints
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
    
    // represents the monster's attack. The inout parameter
    // enemy represents the Hero that the monster is attacking
    func attack(enemy: inout Hero) {
        print("\(name) is attempting to attack \(enemy.name)...")
        let hitChance = Double.random(in: 0...1)
        let specialAttackChance = Double.random(in: 0...1)
        if specialAttackChance <= 0.3 {
            print("\(name) has activated a special ability...")
            specialAttack(enemy: &enemy)
        } else if hitChance <= opponentHitChance {
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
    
    // represents the monster's special attack
    // enemy is the Hero being attacked
    func specialAttack(enemy: inout Hero) {
        print("To be implemented by children")
    }
}
