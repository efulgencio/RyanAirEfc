//
//  File.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 23/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//


import UIKit

// Extension for instantiate ViewController contain at StoryBoard
// You can have more Storyboards
// at Storyboards.swift fill view controller that the storyboard containt
extension UIStoryboard {
    static var main: MainStoryboard {
        return MainStoryboard()
    }
    
// If we have more storyboard then fill this information
//    static var <NewVar>: <NameStoryboard> {
//        return <NameStoryboard>()
//    }

    convenience init(name: String) {
         self.init(name: name, bundle: nil)
     }
    
    func instantiate<T: UIViewController>(withIdentifier identifier: String) -> T {
        return self.instantiateViewController(withIdentifier: identifier) as! T
    }
}

// If we have more storyboard then fill this information

//extension UIStoryboard {
//    static var main: <NewStotry { return MainStoryboard() }
//
//    convenience init(name: String) {
//         self.init(name: name, bundle: nil)
//     }
//
//    func instantiate<T: UIViewController>(withIdentifier identifier: String) -> T {
//        return self.instantiateViewController(withIdentifier: identifier) as! T
//    }
//}
