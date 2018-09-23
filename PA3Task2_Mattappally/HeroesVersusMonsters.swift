//
//  HeroesVersusMonsters.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/22/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class HeroesVersusMonsters {
    var enemy: Monster = Monster()
    var user: Hero = Hero()
    
    func gameDriver() {
        introduction()
        playerTurn()
    }
    
    func introduction() {
        var name: String = "Johnny"
        let chooseEnemy = Int.random(in: 0...2)
        switch chooseEnemy {
        case 0:
            enemy = Ogre(name: "Ollie the Ogre")
        case 1:
            enemy = Gremlin(name: "Gary the Gremlin")
        default:
            enemy = Skeleton(name: "Shawn the Skeleton")
        }
        print("Welcome to Heroes vs. Monsters!")
        print("Please choose your hero from the following options:")
        print("\t1) Warrior")
        print("\t2) Sorceress")
        print("\t3) Thief")
        let optionalHeroChoice = readLine()
        print("What is the name of your hero?")
        let optionalNameChoice = readLine()
        if let nameChoice = optionalNameChoice {
            name = nameChoice
        }
        if let userChoice = optionalHeroChoice {
            let numberSelection: Character = userChoice[userChoice.startIndex]
            switch numberSelection {
            case "1":
                user = Warrior(name: "Warrior \(name)", enemy: enemy)
            case "2":
                user = Sorceress(name: "Sorceress \(name)", enemy: enemy)
            default:
                user = Thief(name: "Thief \(name)", enemy: enemy)
            }
        }
        print("\(user.name) is battling \(enemy.name)\n")
    }
    
    func playerTurn() {
        var turns = user.turns
        for i in 1...turns {
            print("~~~~\(user.name)'s turn (\(i) of \(turns))~~~~")
            print("\t\(user.name): \(user.hitPoints)")
            print("\t\(enemy.name): \(enemy.hitPoints)\n")
            print("\tPlease choose yoru attack from the following menu")
            print("\t\t1) Normal Attack")
            print("\t\t2) Special Attack")
            print("\t\t3) Quit Game")
            let userOptionalChoice = readLine()
            var numChoice: Character = "1"
            if let userChoice = userOptionalChoice {
                numChoice = userChoice[userChoice.startIndex]
            }
            switch numChoice {
            case "2":
                specialAttack()
            case "3":
                exit(0)
            default:
                normalAttack()
            }
        }
    }
    
    func normalAttack() {
        user.attack(enemy: &enemy)
        print("\t\(user.name): \(user.hitPoints)")
        print("\t\(enemy.name): \(enemy.hitPoints)\n")
    }
    
    func specialAttack() {
        
    }
}
