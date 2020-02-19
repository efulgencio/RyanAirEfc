//
//  InfoController.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

protocol RefreshSectionHiddenShow {
    var returnValueBool: ((Bool) -> ())?  { get set }
}

class InfoController: UIViewController {

    @IBOutlet weak var passengerAdult: PassengerView!
    @IBOutlet weak var passengerTeen: PassengerView!
    @IBOutlet weak var passengerChild: PassengerView!
    @IBOutlet weak var origin: UITextField!
    @IBOutlet weak var destination: UITextField!
    
    
    var stations: Stations?
    var presenter: InfoPresenter = InfoPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        prepareGesture()
        presenter.viewRef = self
        presenter.viewDidLoad()
        
    }
    
    func prepareView() {
        passengerAdult.typePassenger = .adult
        passengerTeen.typePassenger = .teen
        passengerChild.typePassenger = .child
    }
    
    func prepareGesture() {
         let tapGestureRecognizerView = UITapGestureRecognizer(target: self, action: #selector(originTapped(tapGestureRecognizer:)))
         origin.isUserInteractionEnabled = true
         origin.addGestureRecognizer(tapGestureRecognizerView)
     }
    
    @objc func originTapped(tapGestureRecognizer: UITapGestureRecognizer){
         let storyBoard: UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
         let popupVC = storyBoard.instantiateViewController(withIdentifier: "popUpVCid") as! PopUpVC
         popupVC.stations = stations
         self.present(popupVC, animated: true, completion: nil)
    }
    
    
}

//MARK: InfoPresenterProtocol
extension InfoController: InfoPresenterProtocol {
    func updateTheRecentInfoList(recentSavedInfo: Stations, error: Error?) {
        stations = recentSavedInfo
    }
}




//extension ClinicaController {
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       if segue.identifier == "seguePopUp"  {
//        numeroSeccionesOcultas = HiddenShowManager.shared.getNumberHidden()
//        if var secondViewController = segue.destination as? RefreshSectionHiddenShow {
//                secondViewController.returnValueBool = someFunctionThatWillHandleYourReturnValue
//        }
//       }
//    }
//
//    func someFunctionThatWillHandleYourReturnValue(returnedValue: Bool) {
//         viewWillAppear(false)
//    }
//
//}
