//
//  Game.swift
//  TrySwiftUiAgain
//
//  Created by Merqueo on 11/05/22.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        100 - abs(target - sliderValue)
    }
}


