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
    
    func getRouteButtonPressedFor() {
      infoInteractor?.getRoute()
    }

}

extension InfoPresenter: InfoInteractorOutputProtocol {
    func routeDetailFetched(route: [String]?, errorMessage: String?) {
        guard let sourceController = viewRef else {
          return
        }
        infoWireframe?.showDetail(from: sourceController, withRoute: route!)
    }
    
    func didFinishFetchingInfoResults(allSearches: Stations?, error: Error?) {
        viewRef?.updateTheRecentInfoList(recentSavedInfo: allSearches!, error: nil) 
    }
}
