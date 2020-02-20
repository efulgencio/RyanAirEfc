//
//  AddOrSumNumberWithLimit.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 19/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation

class AddorSumNumberWithLimit {
    
    
    /// Method for increment a Int value with control no exceded limit maxim
    /// - Parameters:
    ///   - actual: the value to increment
    ///   - increment: the quantity to increment
    ///   - limitMaxim: the max value int to check that not exceded
    class func addNumber(actual: Int, increment: Int, limitMaxim:Int) -> String {
        if actual + increment > limitMaxim {
            return String(actual)
        }
        return String(actual + increment)
    }
    
    
    /// Method for decrement a Int value with control no exceded limit minimus
    /// - Parameters:
    ///   - actual: the value to decrement
    ///   - decrement: quantity to decrement
    ///   - limitMinim: the minimun value to decrement
    class func minusNumber(actual: Int, decrement: Int, limitMinim: Int) -> String {
        if actual - decrement < limitMinim {
            return String(limitMinim)
        }
        return String(actual - decrement)
    }
    
}

