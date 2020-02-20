//
//  DateUtil.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 20/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation


/// Convert Data to String with format yyyy-MM-dd
/// - Parameter date: Date to convert to String
func stringFromDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}
