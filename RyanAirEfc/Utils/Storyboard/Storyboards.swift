//
//  File2.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 23/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit


class MainStoryboard: UIStoryboard {
    convenience override init() { self.init(name: "Main") }
    
    var listAeroports: PopUpVC {
        return self.instantiate(withIdentifier: "popUpVCid")
    }
    
    var help: HelpVC {
        return self.instantiate(withIdentifier: "helpVCid")
    }
}

// If we have more storyboard then fill this information
//class <NameStoryboard>: UIStoryboard {
//    convenience override init() { self.init(name: "<NameStoryboard") }
//
//    var <nameVarForViewController>: <NameViewController> {
//        return self.instantiate(withIdentifier: <Identificer view controller>)
//    }
//}
