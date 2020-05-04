//
//  HomePresenter+Networking.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

extension HomePresenter: NetworkingDelegate {
    // MARK: Network Delegate
    func onError() {
    }
    func errorDescription(message: String) {
        DispatchQueue.main.async {
            self.delegate.showErrorAlert(message: message)
        }
    }
    func getResultModel(model: Decodable) {
        if let pokedexModel = model as? Pokedex {
            view?.setPokedexData(pokedexData: pokedexModel)
            guard let result = pokedexModel.results.first else { return }
            pokemonFetch(url: result.url)
        }
        if let pokemon = model as? Pokemon {
            view?.setPokemonData(pokemonData: pokemon)
        }
    }
}
