//
//  HomePresenter.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

/* Il presenter conosce la sua view attraverso un protocollo e la view conosce il suo presenter in maniera diretta. Il presenter comunica con il Networking per ottenere i dati necessari per soddisfare le richieste della view e mostrate i dati del Pokedex.
*/

struct HomePresenter {
    // MARK: property 
    weak var view: HomeView?
    var delegate: HomePresenterDelegate
    init(view: HomeView,
         delegate: HomePresenterDelegate) {
        self.view = view
        self.delegate = delegate
    }
    func load() {
        view?.setView()
        Networking<Pokedex>.getPokedex(self, url: Endpoint.basePokedex.url)
    }
    func fetchPokdexList(offset: Int) {
        Networking<Pokedex>.getPokedex(self, url: Endpoint.pokedex(offset: offset).url)
    }
    func pokemonFetch(url: String) {
        Networking<Pokemon>.getPokemon(self, url: url)
    }
    // MARK: Presenter navigation
    func showDetailVC(pokemon: Pokemon) {
        DispatchQueue.main.async {
            self.delegate.showDetailVC(pokemon: pokemon)
        }
    }
}
