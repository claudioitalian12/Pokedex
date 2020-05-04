//
//  PokedexCell.swift
//  Pokedex
//
//  Created by claudio cavalli on 02/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

class PokedexCell: UITableViewCell, SetViewDelegate {
    // MARK: SetViewDelegate
    private var pokemonData: PokemonData
    override var isSelected: Bool {
        didSet {
            switch isSelected {
            case true:
                UIView.animate(withDuration: 0.1,
                               animations: {
                                self.alpha = 0.5
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1) {
                        self.alpha = 1 }})
            default:
                return
            }
        }
    }
    
    // MARK: init
    init(pokemon: PokemonData) {
        self.pokemonData = pokemon
        super.init(style: .subtitle, reuseIdentifier: "MyCell")
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: SetViewDelegate
    func setSubView() {
    }
    
    func setStyle() {
        guard let pokemonPrimaryType = pokemonData.pokemon.types.first else { return
        }
        backgroundColor =  pokemonPrimaryType.type.name.typeColor()
        textLabel?.text = "#\(pokemonData.pokemon.id) \(pokemonData.pokemon.name)"
        detailTextLabel?.text = pokemonData.pokemon.types.map { $0.type.name }.joined(separator: ", ")
        imageView?.image = pokemonData.pokeImage
        detailTextLabel?.textColor = .white
        textLabel?.textColor = .white
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 8
        layer.masksToBounds = true
        layer.cornerRadius = 16
        selectedBackgroundView = UIView()
    }
    
    func setLayout() {
    }
}
