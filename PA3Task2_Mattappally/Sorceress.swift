//
//  Sorceress.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/22/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Sorceress: Hero {
    init(name: String, enemy: Monster) {
        super.init(name: name, hitPoints: 75, attackSpeed: 6, damageRange: (min: 20, max: 40), opponentHitChance: 0.8, chanceToBlock: 0.4, enemy: enemy)
    }
    
    func heal() {
        let healPoints = Int.random(in: 20...40)
        hitPoints += healPoints
    }
}
