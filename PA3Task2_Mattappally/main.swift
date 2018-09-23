//
//  main.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/18/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

print("Hello, World!")

var hero = Hero(name: "Sam", hitPoints: 50, attackSpeed: 4, damageRange: (min: 3, max: 8), opponentHitChance: 0.6, chanceToBlock: 0.4)
hero.hitPoints -= 10
print(hero.hitPoints)
