//
//  PassengerView.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

enum TypePassenger {
    case adult
    case teen
    case child
    
    var descTypePassenger: String {
        switch self {
            case .adult: return "Adult"
            case .teen: return "Teen"
            case .child: return "Child"
        }
    }
}

class PassengerView: UIView {
    
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var btnLess: UIButton!
    @IBOutlet var view: UIView!
    
    let BTN_ADD = 1000
    let BTN_MINUS = 2000
    
    var limitQuantity: Int = 0
    var minimQuantity: Int = 0
    
    var typePassenger: TypePassenger = .adult {
        didSet {
            switch typePassenger {
                case .adult:
                    limitQuantity = LIMIT_PASSENGER_ADULT
                    minimQuantity = 1
                case .teen:
                    limitQuantity = LIMIT_PASSENGER_TEEN
                    minimQuantity = 0
                case .child:
                    limitQuantity = LIMIT_PASSENGER_CHILD
                    minimQuantity = 0
            }
            lblQuantity.text = String(minimQuantity)
        }
    }
    
    private var valueInt: Int {
        if let intText = Int(lblQuantity.text!) {
            return intText
        }
        return minimQuantity
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

      
      private func nibSetup() {

          view = loadViewFromNib()
          view.frame = bounds
          view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
          view.translatesAutoresizingMaskIntoConstraints = true
          lblDescription.text = typePassenger.descTypePassenger
         
          addSubview(view)
  
      }
      
      class func instanceFromNib() -> UIView {
          return UINib(nibName: "PassengerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
      }
      
      func loadViewFromNib() -> UIView {
          let bundle = Bundle(for: type(of: self))
          let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
          let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
          
          return nibView
      }
    
    @IBAction func btnTouch(_ sender: UIButton) {
        if sender.tag == BTN_ADD && permissionForAdd() {
            lblQuantity.text =  AddorSumNumberWithLimit.addNumber(actual: valueInt, increment: 1, limitMaxim: limitQuantity)
            lblQuantity.layer.bottomAnimation(duration: 0.5)
        } else if sender.tag == BTN_MINUS && permissionForMinus() {
            lblQuantity.text = AddorSumNumberWithLimit.minusNumber(actual: valueInt, decrement: 1, limitMinim: minimQuantity)
            lblQuantity.layer.topAnimation(duration: 0.5)
        }
    }
    
    // MARK: - private function
    private func permissionForAdd() -> Bool {
        return !((valueInt + 1) > limitQuantity)
    }
    
    private func permissionForMinus() -> Bool {
        return !((valueInt - 1) < minimQuantity)
    }
    
}
