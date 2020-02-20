//
//  InfoInteractor.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation


class InfoInteractor: InfoInteractorInputProtocol{

    var presenter: InfoPresenter?
    
    func fetchGetApi() {
        ApiServiceManager.sharedService.requestAPI() { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
                return
            }
                do {
                    let stationObject: Stations = try JSONDecoder().decode(Stations.self, from: data)
                    self.presenter?.didFinishFetchingInfoResults(allSearches: stationObject, error: nil)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
          }
        }
    }

    func getRoute() {
        ApiServiceManager.sharedService.requestAPI() { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
                self.presenter?.routeDetailFetched(route: nil, errorMessage: error?.infoAppError)
              return
            }
            
            let routeList = ["clave": "valor"]
            
            if true {
                self.presenter?.routeDetailFetched(route: [routeList["clave"]!], errorMessage: nil)
            } else {
            //  self.presenter?.routeDetailFetched(route: nil, errorMessage: "No route found")
            }
          }
        }
     }

}
