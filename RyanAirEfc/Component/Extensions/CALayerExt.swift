//
//  File.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 19/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    
    
    /// Show the content layer from top
    /// - Parameter duration: duration of the animation
    func bottomAnimation(duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = duration
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromTop
        self.add(animation, forKey: CATransitionType.push.rawValue)
    }
    
    
    /// Show the content layer from bottom
    /// - Parameter duration: duration of the animation
    func topAnimation(duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = duration
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromBottom
        self.add(animation, forKey: CATransitionType.push.rawValue)
    }
    
    // Shadows for layer
    func applyShadow() {
        self.shadowOpacity = 0.2
        self.shadowRadius = CGFloat(5.0)
        self.shadowOffset = CGSize(width: CGFloat(-10), height: CGFloat(10))
    }
}
