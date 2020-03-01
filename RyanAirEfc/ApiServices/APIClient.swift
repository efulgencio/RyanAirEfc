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
    
    
    /// Method for get the base url availibility and parameters values
    /// - Parameter params: entity with params values for generate url avilibility
    func getAvailability(params: ParamsAvailibility) -> String {
       // return params.generateUrl()
        return params.testDocumentPdf()
    }
}
