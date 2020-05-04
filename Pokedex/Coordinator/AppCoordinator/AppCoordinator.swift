//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

/* Per la gestione della navigazione ho fatto uso di un coordinator che ha come compito quello di comunicare con la factory(FeatureSceneFactory) avente a disposizione dei metodi esposti per generare il view controller ed il suo presenter. Ogni presenter, quando riceve un segnale dalla sua view comunica con la factory attraverso un protocollo per mostrate il contenuto di risposta.
*/

struct AppCoordinator: Coordinator {
    // MARK: property 
    var starterCoordinator: Coordinator
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    // MARK: AppCoordinator init
    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.window.overrideUserInterfaceStyle = .light
        self.navigationController = navigationController
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        starterCoordinator = FeatureCoordinator(navigationController: navigationController)
    }
    
    // MARK: Coordinator
    func start() {
        starterCoordinator.start()
    }
}
