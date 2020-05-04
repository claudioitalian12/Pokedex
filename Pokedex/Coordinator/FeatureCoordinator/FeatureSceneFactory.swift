//
//  FeatureSceneFactory.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

struct FeatureSceneFactory {
    // MARK: make viewController
    static func makeHome(delegate: HomePresenterDelegate) -> HomeVC {
        let vc = HomeVC()
        let presenter = HomePresenter(view: vc.pokedexView, delegate: delegate)
        vc.pokedexView.presenter = presenter
        return vc
    }
    
    static func makeDetail(pokemon: Pokemon, delegate: DetailPresenterDelegate) -> DetailVC {
        let vc = DetailVC(pokemon: pokemon)
        let presenter = DetailPresenter(view: vc.pokemonView, delegate: delegate)
        vc.pokemonView.presenter = presenter
        return vc
    }
    
    static func makeErrorAlert(with message: String) -> UIAlertController {
        let vc = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
            vc.dismiss(animated: true, completion: nil)
        }))
        return vc
    }
}
