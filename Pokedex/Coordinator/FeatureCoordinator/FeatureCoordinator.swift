//
//  FeatureCoordinator.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

struct FeatureCoordinator: Coordinator {
    // MARK: property
    let navigationController: UINavigationController
    
    // MARK: FeatureCoordinator init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Coordinator
    func start() {
        let vc = FeatureSceneFactory.makeHome(delegate: self)
        navigationController.viewControllers = [vc]
    }
}
