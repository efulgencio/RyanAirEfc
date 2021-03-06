//
//  File.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 20/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation


/// Class for generate URL for Availability flys
class ParamsAvailibility {

    var origin = ""
    var destination = ""
    var dateout = ""
    var flex = "3"
    var adt = ""
    var teen = ""
    var chd = ""
    
    
    /// Return the base URL with  the  parameters
    func generateUrl() -> String {
        return APIClient.shared.urlAvailability + generateParameters()
    }
    
    
    /// Generate string with key / values with parameters properties
    private func generateParameters() -> String {
        // origin destination
        let param1 = "origin=\(origin)&destination=\(destination)&"
        // dateout datein
        let param2 = "dateout=\(dateout)&datein=&"
        // flexdays
        let param3 = "flexdaysbeforeout=\(flex)&flexdaysout=\(flex)&flexdaysbeforein=\(flex)&flexdaysin=\(flex)&"
        // adt, teen, children
        let param4 = "adt=\(adt)&teen=\(teen)&chd=\(chd)&"
        
        return param1 + param2 + param3 + param4 + "roundtrip=false&ToUs=AGREED&Disc=0"
        
    }
    
    
    /// At the document PDF that request this test have this URL I use for test le request / reponse
    func testDocumentPdf() -> String {
        let param100 =
        "origin=DUB&destination=STN&dateout=2020-08-09&datein=&flexdaysbeforeout=3&flexdaysout=3&flexdaysbeforein=3&flexdaysin=3"
        let param200 =
         "&adt=1&teen=0&chd=0&roundtrip=false&ToUs=AGREED&Disc=0"
        
        return "https://sit-nativeapps.ryanair.com/api/v4/Availability?" + param100 + param200
    }
}
