//
//  AddMinusTest.swift
//  RyanAirEfcTests
//
//  Created by eduardo fulgencio on 23/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import XCTest
@testable import RyanAirEfc

class AddMinusTest: XCTestCase {
    
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func test_AddNumber() {
        let resultNumber: String = AddorSumNumberWithLimit.addNumber(actual: 5, increment: 1, limitMaxim:5)
        XCTAssertEqual(resultNumber, "5")
        XCTAssertNotEqual(resultNumber, "6")
    }

    func test_MinusNumber() {
        let result1: String = AddorSumNumberWithLimit.minusNumber(actual: 2, decrement: 1, limitMinim:3)
        let result2: String = AddorSumNumberWithLimit.minusNumber(actual: 7, decrement: 1, limitMinim:0)
        XCTAssertEqual(result1, "3")
        XCTAssertEqual(result2, "6")
    }

}
