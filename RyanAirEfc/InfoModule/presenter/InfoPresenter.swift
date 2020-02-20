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
    func routeDetailFetched(route: [String]?, errorMessage: String?) {
        guard let sourceController = viewRef else {
          return
        }
        infoWireframe?.showDetail(from: sourceController, withRoute: route!)
    }
    
    func didFinishFetchingInfoResults(allSearches: Stations?, error: AppErrors?) {
        viewRef?.updateTheRecentInfoList(recentSavedInfo: allSearches!, error: error)
    }
}
