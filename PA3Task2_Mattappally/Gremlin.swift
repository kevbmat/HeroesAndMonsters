//
//  Gremlin.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/19/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Gremlin: Monster {
    init(name: String) {
        super.init(name: name, hitPoints: 70, attackSpeed: 5, damageRange: (min: 15, max: 30), chanceToHeal: 0.4, healRange: (min: 20, max: 40), opponentHitChance: 0.8)
    }
}
