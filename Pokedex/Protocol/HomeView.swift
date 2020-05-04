//
//  HomeView.swift
//  Pokedex
//
//  Created by claudio cavalli on 04/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import Foundation

protocol HomeView: class {
    func setView()
    func setPokedexData(pokedexData: Pokedex)
    func setPokemonData(pokemonData: Pokemon)
}
