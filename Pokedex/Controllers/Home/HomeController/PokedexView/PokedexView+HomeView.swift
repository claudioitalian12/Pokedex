//
//  PokedexView+HomeView.swift
//  Pokedex
//
//  Created by claudio cavalli on 02/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

extension PokedexView: HomeView, SetViewDelegate {
    // MARK: HomeView
    func setView() {
        setSubView()
        setStyle()
        setLayout()
    }
    
    func setPokedexData(pokedexData: Pokedex) {
        pokedex.results.append(contentsOf: pokedexData.results)
    }
    
    func setPokemonData(pokemonData: Pokemon) {
        if let url = URL(string: Endpoint.image(image: pokemonData.id).url) {
            let pokemon = PokemonData(pokemon: pokemonData, imageURL: url)
            self.pokemonData.append(pokemon)
            setPokemonSpriteData()
        }
    }
    
    // MARK: PokedexView set
    private func setPokemonSpriteData() {
        DispatchQueue.main.async { [unowned self] in
            if self.pokedex.results.count > self.pokemonData.count {
                self.presenter.pokemonFetch(url: self.pokedex.results[self.pokemonData.count].url)
            } else {
                self.tableView.reloadData()
                self.loadActivityIndicator.stopAnimating()
                self.loadMoreActivityIndicator.stopAnimating()
            }
        }
    }
    
    // MARK: SetViewDelegate
    func setSubView() {
        addSubview(tableView)
    }
    
    func setStyle() {
        backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        loadActivityIndicator = UIActivityIndicatorView(color: .black, placeInTheCenterOf: self)
        loadActivityIndicator.startAnimating()
    }
    
    func setLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}



