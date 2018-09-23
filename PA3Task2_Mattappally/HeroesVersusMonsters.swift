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
        print("Welcome to heroes vs. Monsters!")
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
        print("\(user.name) is battling \(enemy.name)")
    }
}
