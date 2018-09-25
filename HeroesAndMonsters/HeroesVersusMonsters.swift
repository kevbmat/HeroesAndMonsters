// Heroes vs Monsters game
// A game in which the user battles against the
// computer to the death! The user chooses a hero to play
// as and the computer randomly chooses a monster to battle
// the user with. Last character standing wins!
// CPSC 315
// Programming Assignment #3
// Kevin Mattappally
// 09/24/2018
// HeroesVersusMonsters.swift

import Foundation

// the main driver class for the entire game
class HeroesVersusMonsters {
    var enemy: Monster
    var user: Hero
    var gameOver: Bool
    
    // initializes the game state
    init() {
        enemy = Monster()
        user = Hero()
        gameOver = false
    }
    
    // game loop that drives the whole game. Loops through
    // the player and computer turns while it checks
    // each time if the game is over
    func gameDriver() {
        introduction()
        while !gameOver {
            playerTurn()
            if !gameOver {
                computerTurn()
            }
        }
    }
    
    // introduces the game to the user. Gives the user
    // options for what hero they want to be, and the computer
    // randomly chooses a monster
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
    
    // represents the player turn. Gives the user options
    // regarding the type of attack they want to do on the
    // enemy.
    func playerTurn() {
        var currentTurn: Int = 1
        while currentTurn <= user.turns {
            if user.hitPoints <= 0 || enemy.hitPoints <= 0 {
                gameOver = true
                endGame()
            }
            displayTurnsAndStats(turnNumber: currentTurn, totalTurns: user.turns, currentPlayer: user, nextPlayer: enemy)
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
            currentTurn += 1
            print("\nPress enter to continue")
            _ = readLine()
        }
        user.turns = user.attackSpeed / enemy.attackSpeed
    }
    
    // displays the current statistics regarding each player and their hitpoints.
    func displayTurnsAndStats(turnNumber: Int, totalTurns: Int, currentPlayer: DungeonCharacter, nextPlayer: DungeonCharacter) {
        print("~~~~\(currentPlayer.name)'s turn (\(turnNumber) of \(totalTurns))~~~~")
        print("\t\(currentPlayer.name): \(currentPlayer.hitPoints) hit points")
        print("\t\(nextPlayer.name): \(nextPlayer.hitPoints) hit points\n")
    }
    
    // represents the user attacking the enemy
    func doNormalAttack() {
        user.attack(enemy: &enemy)
        enemy.heal()
    }
    
    // represents the user doing a special
    // attack on the enemy
    func doSpecialAttack() {
        user.specialAttack()
    }
    
    // represents the computer turn
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
    
    // end game function that gets called if either the
    // hero or monster has lost all of their hitpoints. Gives
    // the user the option to play again.
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
                gameOver = false
                game = HeroesVersusMonsters()
                game.gameDriver()
            } else {
                print("Exiting game...Thanks for playing!")
                exit(0)
            }
        }
    }
}
