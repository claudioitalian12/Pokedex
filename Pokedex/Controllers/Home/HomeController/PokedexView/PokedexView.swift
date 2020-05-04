//
//  HomeView.swift
//  Pokedex
//
//  Created by claudio cavalli on 02/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

/* La PokedexView ha il compito di mostrare i dati del Pokedex. Per soddisfare tale scopo la pokedexView comunica al presenter una richiesta per il baseURL del pokedex che contiene i primi 20 elementi di esso. Al termine della ricezione dei dati verrà interrotto il caricamento iniziale e aggiornata la table view. Questo procedimento avverrà ogni volta che verrà inviata una richiesta per il pokedex.
*/

class PokedexView: UIView {
    // MARK: property
    var pokedex = Pokedex(results: [])
    var presenter: HomePresenter!
    var pokemonData = [PokemonData]()
    var loadActivityIndicator: UIActivityIndicatorView!
    let tableView = UITableView()
    let loadMoreActivityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: init
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
