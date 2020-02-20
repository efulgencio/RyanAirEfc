//
//  ErrorEnum.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 19/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation

enum AppErrors {
    case error_code1
    case error_code2
    case error_code3
    case error_code4
    
    var infoAppError: String {
        switch self {
            case .error_code1: return "error code 1"
            case .error_code2: return "error code 2"
            case .error_code3: return "error code 3"
            case .error_code4: return "error code 4"
        }
    }
}
