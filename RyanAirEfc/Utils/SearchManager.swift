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
  
  var originalContent: Stations?
    
    func findByCode(valueToFind: String) -> [Station]? {
        
        let arrResult = originalContent?.airports.filter {
            $0.name.contains(valueToFind)
        }
        
        return arrResult
    }
    
    func findByName(valueToFind: String) -> [Station]? {
        
        let arrResult = originalContent?.airports.filter {
            $0.code.contains(valueToFind)
        }
        
        return arrResult
    }

}
