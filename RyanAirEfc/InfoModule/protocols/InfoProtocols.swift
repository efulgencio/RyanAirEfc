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
  func getAvailability(params: ParamsAvailibility)
}

protocol InfoPresenterProtocol {
  //Presenter -> View
    func updateTheRecentStationList(recentSavedInfo: Stations, error: AppErrors?)
    func updateTheRecentTripList(recentSavedInfo: Trips, error: AppErrors?)
}

protocol InfoInteractorInputProtocol {
    
  var presenter: InfoPresenter? {get set}
  //Presenter -> Interactor
  func fetchGetApi()
  func fetchGetApiAvailability(params: ParamsAvailibility)
    
}

protocol InfoInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingStationResults(allSearches: Stations?,error: AppErrors?)
  func didFinishFetchingTripResults(allSearches: Trips? ,error: AppErrors?) 
}

protocol InfoWireframeProtocol {
  //Presenter -> Wireframe
  func showDetail(from controller: InfoController, withRoute route: [String])
}
