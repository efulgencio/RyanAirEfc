//
//  InfoWireframe.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class InfoWireframe{
    
    func navigateToDetailPage(showRoute route: [String], from classRef: UIViewController) {
      
      let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
      let detailController = mainStoryBoard.instantiateViewController(withIdentifier: "SearchController") as! SearchController

      guard let sourceNavigationController = classRef.navigationController else {
        classRef.present(detailController, animated: true, completion: nil)
        return
      }
      sourceNavigationController.pushViewController(detailController, animated: true)
      
    }
    
    class func loadInfoPageComponents(withPresenter presenter: InfoPresenter) {
      presenter.infoWireframe = InfoWireframe()
      presenter.infoInteractor = InfoInteractor()
      presenter.infoInteractor?.presenter = presenter
    }
    
}

extension InfoWireframe: InfoWireframeProtocol {
  func showDetail(from controller: InfoController, withRoute route: [String]) {
    navigateToDetailPage(showRoute: route, from: controller)
  }
}
