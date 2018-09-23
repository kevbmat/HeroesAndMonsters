//
//  Thief.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/22/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Thief: Hero {
    init(name: String, enemy: Monster) {
        super.init(name: name, hitPoints: 75, attackSpeed: 6, damageRange: (min: 20, max: 40), opponentHitChance: 0.8, chanceToBlock: 0.4, enemy: enemy)
    }
    
    func surpriseAttack() {
        let attackChance = Double.random(in: 0...1)
        if attackChance <= 0.4 {
            print("The surprise attack got caught! Attack failed :(")
        } else if attackChance > 0.4 && attackChance <= 0.8 {
            print("The surprise attack was never seen! You get 1 more turn.")
        } else {
            print("Suprise attack somewhat succesful. You play a normal attack.")
        }
    }
}
