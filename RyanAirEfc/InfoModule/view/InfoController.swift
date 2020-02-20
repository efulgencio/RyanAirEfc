//
//  InfoController.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

protocol RefreshSectionHiddenShow {
    var returnSelected: ((String) -> ())?  { get set }
}

class InfoController: UIViewController {

    @IBOutlet weak var passengerAdult: PassengerView!
    @IBOutlet weak var passengerTeen: PassengerView!
    @IBOutlet weak var passengerChild: PassengerView!
    @IBOutlet weak var origin: UITextField!
    @IBOutlet weak var destination: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var destinationSelecction: UITextField!
    var stations: Stations?
    var presenter: InfoPresenter = InfoPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        prepareGesture()
        presenter.viewRef = self
        presenter.viewDidLoad()
        
    }
    
    // MARK: - prepare view
    func prepareView() {
        passengerAdult.typePassenger = .adult
        passengerTeen.typePassenger = .teen
        passengerChild.typePassenger = .child
    }
    
    func prepareGesture() {
         let tapGestureRecognizerViewOrigin = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer:)))
         let tapGestureRecognizerViewDestination = UITapGestureRecognizer(target: self, action: #selector(tapped(tapGestureRecognizer:)))
         origin.isUserInteractionEnabled = true
         origin.addGestureRecognizer(tapGestureRecognizerViewOrigin)
         destination.isUserInteractionEnabled = true
         destination.addGestureRecognizer(tapGestureRecognizerViewDestination)
     }
    
    // MARK: - tap gesture method
    @objc func tapped(tapGestureRecognizer: UITapGestureRecognizer){
        
         destinationSelecction = tapGestureRecognizer.view as? UITextField
        
         let storyBoard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
         let popupVC = storyBoard.instantiateViewController(withIdentifier: "popUpVCid") as! PopUpVC
         popupVC.stations = stations
         popupVC.returnSelected = someFunctionThatWillHandleYourReturnValue
        
         self.present(popupVC, animated: true, completion: nil)
    }
    
    // MARK: - call back function from popupVC
    func someFunctionThatWillHandleYourReturnValue(value: String) {
        if value != CANCEL_SELECTION_AIRPORT {
            (destinationSelecction as UITextField).text = value
        }
    }
    
    // MARK: - find method with values
    @IBAction func btnTouchFind(_ sender: Any) {
        let params = ParamsAvailibility.init()
        // fill params
        params.origin = String((origin.text?.split(separator: "/")[1])!)
        params.destination = String((origin.text?.split(separator: "/")[1])!)
        params.dateout = "2020-08-14"
        params.adt = passengerAdult.lblQuantity.text!
        params.teen = passengerTeen.lblQuantity.text!
        params.chd = passengerChild.lblQuantity.text!
        
        presenter.getAvailability(params: params)
    }
    
    
}

//MARK: InfoPresenterProtocol
extension InfoController: InfoPresenterProtocol {
    func updateTheRecentInfoList(recentSavedInfo: Stations, error: AppErrors?) {
        stations = recentSavedInfo
    }
}
