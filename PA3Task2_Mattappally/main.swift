//
//  main.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/18/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

var end = 5
for i in 1...end {
    print(i)
    if i % 2 == 0 {
        end += 1
    }
}

var game: HeroesVersusMonsters = HeroesVersusMonsters()
game.gameDriver()

