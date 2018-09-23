//
//  HeroesVersusMonsters.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/22/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class HeroesVersusMonsters {
    var enemy: Monster
    var user: Hero
    var gameOver: Bool
    
    init() {
        enemy = Monster()
        user = Hero()
        gameOver = false
    }
    
    func gameDriver() {
        introduction()
        while !gameOver {
            playerTurn()
            if !gameOver {
                computerTurn()
            }
        }
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
        let turns = user.turns
        for i in 1...turns {
            if user.hitPoints <= 0 || enemy.hitPoints <= 0 {
                gameOver = true
                endGame()
            }
            displayTurnsAndStats(turnNumber: i, totalTurns: turns, currentPlayer: user, nextPlayer: enemy)
            print("\tPlease choose your attack from the following menu")
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
                doSpecialAttack()
            case "3":
                print("Exiting game...")
                exit(0)
            default:
                doNormalAttack()
            }
            print("\nPress enter to continue")
            _ = readLine()
        }
    }
    
    func displayTurnsAndStats(turnNumber: Int, totalTurns: Int, currentPlayer: DungeonCharacter, nextPlayer: DungeonCharacter) {
        print("~~~~\(currentPlayer.name)'s turn (\(turnNumber) of \(totalTurns))~~~~")
        print("\t\(currentPlayer.name): \(currentPlayer.hitPoints) hit points")
        print("\t\(nextPlayer.name): \(nextPlayer.hitPoints) hit points\n")
    }
    
    func doNormalAttack() {
        user.attack(enemy: &enemy)
        enemy.heal()
    }
    
    func doSpecialAttack() {
        user.specialAttack()
    }
    
    func computerTurn() {
        if user.hitPoints <= 0 || enemy.hitPoints <= 0 {
            gameOver = true
            endGame()
        }
        displayTurnsAndStats(turnNumber: 1, totalTurns: 1, currentPlayer: enemy, nextPlayer: user)
        enemy.attack(enemy: &user)
        print("\nPress enter to continue ")
        _ = readLine()
    }
    
    func endGame() {
        if user.hitPoints <= 0 {
            print("\(user.name) has died")
        } else {
            print("\(enemy.name) has died")
        }
        print("Would you like to play again? (y/n)")
        let playAgainOptional = readLine()
        if let playAgain = playAgainOptional {
            if playAgain[playAgain.startIndex] == "y" || playAgain[playAgain.startIndex] == "Y" {
                gameDriver()
            } else {
                print("Exiting game...Thanks for playing!")
                exit(0)
            }
        }
    }
}
