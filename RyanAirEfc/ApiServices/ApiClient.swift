//
//  ApiClient.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

class APIClient {
    static let shared: APIClient = APIClient()
    
    let baseURL: String = "https://tripstest.ryanair.com/static/stations.json"
    
    func getStationsURL(lat: String, lon: String) -> String {
       return "\(baseURL)"
    }
}
