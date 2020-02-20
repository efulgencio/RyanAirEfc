//
//  Trips.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 20/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation


struct Trips: Codable {
    
    var foundsTrip: [Trip]
    
    enum CodingKeys: String, CodingKey {
      case trips
    }
    
     init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       self.foundsTrip = try container.decode([Trip].self, forKey: .trips)
     }

     func encode(to encoder: Encoder) throws {}
}

struct Trip: Codable {
    
  let origin: String
  let destination: String
    
  enum CodingKeys: String, CodingKey {
    case origin
    case destination
  }
    
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.origin = try container.decode(String.self, forKey: .origin)
    self.destination = try container.decode(String.self, forKey: .destination)
  }
    
  func encode(to encoder: Encoder) throws {}
    
}
