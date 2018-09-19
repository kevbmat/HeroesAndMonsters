//
//  Ogre.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/18/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Ogre: Monster {
    init(name: String) {
        super.init(name: name, hitPoints: 200, attackSpeed: 2, damageRange: (min: 30, max: 60), chanceToHeal: 0.1, healRange: (min: 30, max: 60), opponentHitChance: 0.6)
    }
}
