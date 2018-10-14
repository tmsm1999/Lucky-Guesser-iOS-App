//
//  NumberGenerator.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 06/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import Foundation

class NumberGenerator {
    var number: Int = 0
    
    init() {
        self.number = generateNumber()
    }
    
    func generateNumber() -> Int {
        let firstDigit: String = String(Int.random(in: 0 ... 9))
        let secondDigit: String = String(Int.random(in: 0...9))
        let thirdDigit: String = String(Int.random(in: 0...9))
        let fourthDigit: String = String(Int.random(in: 0...9))
        
        let number: String = firstDigit + secondDigit + thirdDigit + fourthDigit
        
        let finalNumber: Int = Int(number)!
        return finalNumber
    }
}
