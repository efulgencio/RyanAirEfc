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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
     // MARK: - Buttons Action
    // Find by name
    @IBAction func btnTouchFind(_ sender: Any) {
        
        if byName.text!.isEmpty { return }
        
        byCode.text = ""
        if let resultado = SearchManager.shared.findByName(content: stations!, valueToFind: byName.text!) {
            stations!.airports = resultado
            endEditAndReloadTableView()
        }
    }
    // Find by Code
    @IBAction func btnTouchFindByCode(_ sender: Any) {
        
        if byCode.text!.isEmpty { return }
        
        byName.text = ""
        if let resultado = SearchManager.shared.findByCode(content: stations!, valueToFind: byCode.text!) {
            stations!.airports = resultado
            endEditAndReloadTableView()
        }
    }
    
    @IBAction func btnTouchClose(_ sender: Any) {
        returnSelected!(CANCEL_SELECTION_AIRPORT)
        self.dismiss(animated: false, completion: nil)
    }
    
    // MARK: - private function
    private func endEditAndReloadTableView() {
        view.endEditing(true)
        tableView.reloadData()
    }


}

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
    
}

extension PopUpVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        returnSelected!("\(stations!.airports[indexPath.row].name)/\(stations!.airports[indexPath.row].code)")
        self.dismiss(animated: false, completion: nil)
    }
}
