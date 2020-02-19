//
//  InfoModel.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation

struct Stations: Codable {
    
    let airports: [Station]
    
    enum CodingKeys: String, CodingKey {
      case stations
    }
    
     init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       self.airports = try container.decode([Station].self, forKey: .stations)
     }

     func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.airports, forKey: .stations)
     }
}

struct Station: Codable {
    
  let code: String
  let name: String
    
  enum CodingKeys: String, CodingKey {
    case code
    case name
  }
    
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.code = try container.decode(String.self, forKey: .code)
    self.name = try container.decode(String.self, forKey: .name)
  }
    
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.code, forKey: .code)
    try container.encode(self.name, forKey: .name)
  }
    
}


