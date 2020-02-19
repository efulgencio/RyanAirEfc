//
//  AddOrSumNumberWithLimit.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 19/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation

class AddorSumNumberWithLimit {
    
    class func addNumber(actual: Int, increment: Int, limitMaxim:Int) -> String {
        if actual + increment > limitMaxim {
            return String(actual)
        }
        return String(actual + increment)
    }
    
    class func minusNumber(actual: Int, decrement: Int, limitMinim: Int) -> String {
        if actual - decrement < limitMinim {
            return String(limitMinim)
        }
        return String(actual - decrement)
    }
    
}
