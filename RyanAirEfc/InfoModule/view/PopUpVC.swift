//
//  PopUpVC.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 19/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit


class PopUpVC: UIViewController, RefreshSectionHiddenShow {

    var returnSelected: ((String) -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var byName: UITextField!
    @IBOutlet weak var byCode: UITextField!
    
    
    var returnValueSel: ((String) -> ())?
    var stations: Stations?
    var orignalVersion: Stations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orignalVersion = stations
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
     // MARK: - Buttons Action
    // Find by name
    @IBAction func btnTouchFind(_ sender: Any) {
        
        if byName.text!.isEmpty {
            byCode.text = ""
            stations! = orignalVersion!
            endEditAndReloadTableView()
        } else {
            byCode.text = ""
            if let resultado = SearchManager.shared.findByName(content: orignalVersion!, valueToFind: byName.text!) {
                stations!.airports = resultado
                endEditAndReloadTableView()
            }
        }
    
    }
    
    // Find by Code
    @IBAction func btnTouchFindByCode(_ sender: Any) {
        
        if byCode.text!.isEmpty {
             byName.text = ""
            stations! = orignalVersion!
            endEditAndReloadTableView()
        } else {
            byName.text = ""
            if let resultado = SearchManager.shared.findByCode(content: orignalVersion!, valueToFind: byCode.text!) {
                stations!.airports = resultado
                endEditAndReloadTableView()
            }
        }
        
    }
    
    /// Action user cancel selected airport
    ///  fill the clousure with the constants that indicate CANCEL SELECTION
    /// - Parameter sender: button cancel
    @IBAction func btnTouchClose(_ sender: Any) {
        returnSelected!(CANCEL_SELECTION_AIRPORT)
        self.dismiss(animated: false, completion: nil)
    }
    
    // MARK: - private function
    /// Hidden the keyboard and refresh the tableView
    private func endEditAndReloadTableView() {
        view.endEditing(true)
        tableView.reloadData()
    }


}

// MARK: - Data source table view
extension PopUpVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let countStation = stations?.airports.count else {
            return 0
        }
        
        return countStation
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = stations?.airports[indexPath.row].name
        cell.detailTextLabel!.text = stations?.airports[indexPath.row].code
        
        return cell
    }
    
    /// Soft animation when reload table view
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.backgroundColor = #colorLiteral(red: 0.9595017988, green: 0.9690018166, blue: 0.9690018166, alpha: 1)
        
        UIView.animate(
            withDuration: 1,
            delay: 0.02 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
                cell.backgroundColor = UIColor.white
        })
    }
}

// MARK: - Delegate table view
extension PopUpVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        returnSelected!("\(stations!.airports[indexPath.row].name)/\(stations!.airports[indexPath.row].code)")
        self.dismiss(animated: false, completion: nil)
    }
}
