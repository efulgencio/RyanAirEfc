//
//  InfoPresenter.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class InfoPresenter: InfoViewProtocol {
    
    var viewRef: InfoController?
    var infoWireframe: InfoWireframe?
    var infoInteractor: InfoInteractor?
    
    func viewDidLoad() {
       InfoWireframe.loadInfoPageComponents(withPresenter: self)
       infoInteractor?.fetchGetApi()
    }

    func getAvailability(params: ParamsAvailibility) {
        infoInteractor?.fetchGetApiAvailability(params: params)
    }

}

extension InfoPresenter: InfoInteractorOutputProtocol {
    func didFinishFetchingStationResults(allSearches: Stations?, error: AppErrors?) {
        viewRef?.updateTheRecentStationList(recentSavedInfo: allSearches!, error: error)
    }
    
    func didFinishFetchingTripResults(allSearches: Trips?, error: AppErrors?) {
        if let content = allSearches {
          viewRef?.updateTheRecentTripList(recentSavedInfo: content, error: error)
        } else {
            viewRef?.showError(error: error!)
        }
    }
}
