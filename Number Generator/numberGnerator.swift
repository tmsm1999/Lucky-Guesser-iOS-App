//
//  numberGnerator.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 06/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import Foundation

struct numberGenerator {
    
    var newNumber: Int
    
    mutating func generateNumber() -> Int {
        let firstDigit: String = String(Int.random(in: 1 ... 9))
        let secondDigit: String = String(Int.random(in: 1...9))
        let thirdDigit: String = String(Int.random(in: 1...9))
        let fourthDigit: String = String(Int.random(in: 1...9))
        
        let number: String = firstDigit + secondDigit + thirdDigit + fourthDigit
        
        let finalNumber: Int = Int(number)!
        newNumber = finalNumber
        
        return finalNumber
    }
}
