//
//  InfoProtocols.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//
import UIKit

protocol InfoViewProtocol {
  
  var viewRef: InfoController? {get set}
  var infoWireframe: InfoWireframe? {get set}
  var infoInteractor: InfoInteractor? {get set}
  //View -> Presenter
  func viewDidLoad()
}

protocol InfoPresenterProtocol {
  //Presenter -> View
    func updateTheRecentInfoList(recentSavedInfo: Stations, error: AppErrors?)
}

protocol InfoInteractorInputProtocol {
    
  var presenter: InfoPresenter? {get set}
  //Presenter -> Interactor
  func fetchGetApi()
  func getRoute()
    
}

protocol InfoInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingInfoResults(allSearches: Stations?,error: AppErrors?)
    func routeDetailFetched(route: [String]?,errorMessage: String?)
}

protocol InfoWireframeProtocol {
  //Presenter -> Wireframe
  func showDetail(from controller: InfoController, withRoute route: [String])
}
