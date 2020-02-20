//
//  SearchManager.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 20/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation


class SearchManager: NSObject {
  
  static let shared = SearchManager()
  
    
    func findByCode(content: Stations, valueToFind: String) -> [Station]? {
        
        let arrResult = content.airports.filter {
            $0.code.uppercased().contains(valueToFind.uppercased())
        }
        
        return arrResult
    }
    
    func findByName(content: Stations, valueToFind: String) -> [Station]? {
        
        let arrResult = content.airports.filter {
            $0.name.uppercased().contains(valueToFind.uppercased())
        }
        
        return arrResult
    }
    

}
