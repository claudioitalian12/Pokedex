//
//  FeatureCoordinator+OnboardPresenterDelegate.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

extension FeatureCoordinator: HomePresenterDelegate, DetailPresenterDelegate {
    // MARK: Presenter Delegate
    func showDetailVC(pokemon: Pokemon) {
        let vc = FeatureSceneFactory.makeDetail(pokemon: pokemon, delegate: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showErrorAlert(message: String) {
          let vc = FeatureSceneFactory.makeErrorAlert(with: message)
          navigationController.present(vc, animated: true, completion: nil)
      }
}
