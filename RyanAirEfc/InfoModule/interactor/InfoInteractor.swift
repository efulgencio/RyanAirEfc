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
                    self.presenter?.didFinishFetchingStationResults(allSearches: stationObject, error: nil)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
          }
        }
    }
        
    func fetchGetApiAvailability(params: ParamsAvailibility) {
        // feed params
        ApiServiceManager.sharedService.params = params
        // call api availability
        ApiServiceManager.sharedService.requestAPIAvailability() { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
              return
            }
                do {
                    let tripObject: Trips = try JSONDecoder().decode(Trips.self, from: data)
                    self.presenter?.didFinishFetchingTripResults(allSearches: tripObject, error: nil)
                } catch  _ as NSError {
                    self.presenter?.didFinishFetchingTripResults(allSearches: nil, error: AppErrors.error_parsingJSONDecoded)
                }
          }
        }
     }

}

extension InfoInteractor {
    
    func fetchGetApiAlamofire() {
        ApiServiceManager.sharedService.getStationsAlamofire() { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
                return
            }
                do {
                  //  let stationObject: Stations = try JSONDecoder().decode(Stations.self, from: data)
                  //  self.presenter?.didFinishFetchingStationResults(allSearches: stationObject, error: nil)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
          }
        }
    }
    
    func fetchWithParamsAlamofire() {
        ApiServiceManager.sharedService.requestAPIAvailabilityAlamofire() { (response, error) in
          DispatchQueue.main.async {
            guard let data = response else {
              return
            }
                do {
               //     let tripObject: Trips = try JSONDecoder().decode(Trips.self, from: data)
                //    self.presenter?.didFinishFetchingTripResults(allSearches: tripObject, error: nil)
                } catch  _ as NSError {
                  //  self.presenter?.didFinishFetchingTripResults(allSearches: nil, error: AppErrors.error_parsingJSONDecoded)
                }
          }
        }
    }
}
