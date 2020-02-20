//
//  ApiClient.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

class APIClient {
    
    static let shared: APIClient = APIClient()
    
    let urlStations: String = "https://tripstest.ryanair.com/static/stations.json"
    let urlAvailability: String = "https://sit-nativeapps.ryanair.com/api/v4/Availability?"
    
    func getStationsURL(lat: String, lon: String) -> String {
       return "\(urlStations)"
    }
    
    func getAvailability(params: ParamsAvailibility) -> String {
        return params.generateUrl()
    }
}
