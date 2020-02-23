//
//  SearchManagerTest.swift
//  RyanAirEfcTests
//
//  Created by eduardo fulgencio on 23/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import XCTest
@testable import RyanAirEfc

class SearchManagerTest: XCTestCase {

    var sut: SearchManager!
    var stations: Stations!
    
    override func setUp() {
        sut = SearchManager.shared
        let airport = Station.init(code: "BCN", name: "Barcelona")
        stations = Stations.init(elements: [airport])
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_findByCode() {
        let find = sut.findByCode(content: stations, valueToFind: "B")
        XCTAssertEqual(find!.count, 1)
    }
    
    func test_findByName() {
        let find = sut.findByName(content: stations, valueToFind: "lon")
        XCTAssertEqual(find!.count, 1)
    }

}
