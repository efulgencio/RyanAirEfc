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
    var trips: Trips?
    var presenter: InfoPresenter = InfoPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        prepareGesture()
        presenter.viewRef = self
        presenter.viewDidLoad()

    }
    
    // MARK: - prepare view
    
    /// Establish the type of content for PassengerView (adult, teen, child)
    func prepareView() {
        passengerAdult.typePassenger = .adult
        passengerTeen.typePassenger = .teen
        passengerChild.typePassenger = .child
        // Date Picker no days before today
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.minimumDate = Date()
        // Apply shadow textField
        origin.layer.applyShadow()
        destination.layer.applyShadow()

    }
    
    /// When tap a TextField origin or destination we need  show the list of airports
    /// this method establish the gesture for origin and destination
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

         let popupVC = UIStoryboard.main.listAeroports
         popupVC.stations = stations
         popupVC.returnSelected = someFunctionThatWillHandleYourReturnValue
        
         self.present(popupVC, animated: true, completion: nil)
    }
    
    // MARK: - call back function from popupVC
    
    /// Call back method from popupVC with the content of airport selected
    /// - Parameter value: string with the name/code of airport selected
    func someFunctionThatWillHandleYourReturnValue(value: String) {
        if value != CANCEL_SELECTION_AIRPORT {
            (destinationSelecction as UITextField).text = value
        }
    }
    
    // MARK: - find method with values
    
    /// When the user fill the necesary information this method
    ///  generate the  entity ParamsAvailibility to use at the URL availibility
    /// - Parameter sender: button find
    @IBAction func btnTouchFind(_ sender: Any) {
        
        if origin.text!.isEmpty && destination.text!.isEmpty {
            presentHelp()
        } else {
            let params = ParamsAvailibility.init()
            // fill params
            guard let codeOrigin = getCode(value: origin.text!) else {
                return
            }
            guard let codeDestination = getCode(value: destination.text!) else {
                return
            }
            params.origin = codeOrigin
            params.destination = codeDestination
            params.dateout = stringFromDate(datePicker.date)
            params.adt = passengerAdult.lblQuantity.text!
            params.teen = passengerTeen.lblQuantity.text!
            params.chd = passengerChild.lblQuantity.text!
            
            presenter.getAvailability(params: params)
        }
    }
    
    
    
    
    // MARK: - alert error
    func showError(error: AppErrors) {
        let ac = UIAlertController(title: "App Error", message: error.infoAppError, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Close", style: .destructive, handler: nil))
        self.present(ac, animated: true)
    }
    
    // MARK: - private func
    
    /// Auxiliar method for extract the code value from the string "aeroport/code"
    /// - Parameter value: content "airport/code" selected at the controller popupVC
    private func getCode(value: String) -> String? {
        if let arrayContent = value.split(separator: "/") as Array?, arrayContent.count == 2 {
            return String(arrayContent[1])
        }
        return nil
    }
    
    private func presentHelp() {
         let helpVC = UIStoryboard.main.help
         self.present(helpVC, animated: true, completion: nil)
    }
    
    @IBAction func tapBtnHelp(_ sender: Any) {
        presentHelp()
    }
    
}

//MARK: InfoPresenterProtocol
extension InfoController: InfoPresenterProtocol {
    
    /// Receive the result
    /// - Parameters:
    ///   - recentSavedInfo: Stations that cotaint airport to list at poupVC
    ///   - error: Enum type error of App
    func updateTheRecentStationList(recentSavedInfo: Stations, error: AppErrors?) {
        stations = recentSavedInfo
    }
    
    /// Receive the result  from URL availibility
    /// - Parameters:
    ///   - recentSavedInfo: list of destination and times to departures
    ///   - error: App error code if was generate at request  the avaibility url
    func updateTheRecentTripList(recentSavedInfo: Trips, error: AppErrors?) {
        trips = recentSavedInfo
    }
}
