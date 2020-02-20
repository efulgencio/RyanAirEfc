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

     func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.airports, forKey: .stations)
     }
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
    
  func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//    try container.encode(self.code, forKey: .code)
//    try container.encode(self.name, forKey: .name)
  }
    
}


//"trips" : [
//{
//"origin" : "DUB", "destination" : "STN", "dates" : [
//{
//"dateOut" : "2016-04-11T00:00:00.000", "flights" : [
//] },
//{
//"dateOut" : "2016-04-12T00:00:00.000", "flights" : [
//{
//"time" : [
//"2016-04-12T10:00:00.000",
//"2016-04-12T12:50:00.000" ],
