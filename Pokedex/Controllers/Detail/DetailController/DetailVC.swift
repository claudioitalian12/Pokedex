//
//  DetailVC.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit
import AVFoundation

class DetailVC: UIViewController, SetViewDelegate {
    // MARK: property
    var pokemonView = PokemonView()
    
    // MARK: DetailVC init
    init(pokemon: Pokemon) {
        self.pokemonView.pokemonData = PokemonData(pokemon: pokemon)
        super.init(nibName: nil, bundle: nil)
        title = pokemon.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: DetailVC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubView()
        setStyle()
        setLayout()
        pokemonView.presenter.load()
    }
    
    // MARK: SetViewDelegate
    func setSubView() {
        view.addSubview(pokemonView)
    }
    
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        pokemonView.translatesAutoresizingMaskIntoConstraints = false
        pokemonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pokemonView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pokemonView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokemonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
