//
//  Skeleton.swift
//  PA3Task2_Mattappally
//
//  Created by Kevin Mattappally on 9/19/18.
//  Copyright © 2018 Kevin Mattappally. All rights reserved.
//

import Foundation

class Skeleton: Monster {
    init(name: String) {
        super.init(name: name, hitPoints: 100, attackSpeed: 3, damageRange: (min: 30, max: 50), chanceToHeal: 0.3, healRange: (min: 30, max: 50), opponentHitChance: 0.8)
    }
}
