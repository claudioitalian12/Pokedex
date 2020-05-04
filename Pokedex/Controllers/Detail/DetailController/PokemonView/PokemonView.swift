//
//  PokemonView.swift
//  Pokedex
//
//  Created by claudio cavalli on 02/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

/* La PokemonView mostra l'interfaccia di dettaglio del Pokemon. In questa view è presente l'immagine di dettaglio in alta qualità, i tipi del pokemon e le sue stats. La view sfrutta principalmente delle stack sia per visualizzare i tipi che le statistiche. Questa scelta è dovuta al fatto che tutti gli elementi presenti nella view sono statici e non ritenevo necessario l'utilizzo di collection o table view per mostrate i dati. Infine la stack view per le stats è stata inserita in una scroll per mostrare i dati anche su i device con dimensioni di schermo inferiori.
*/

class PokemonView: UIView, DetailView, SetViewDelegate {
    // MARK: property
    var presenter: DetailPresenter!
    var pokemonData: PokemonData!
    private var pokeImage = UIImageView()
    private let typeStack = UIStackView()
    private let scrollView = UIScrollView()
    private  let statStackView = UIStackView()
    
    // MARK: PokemonView init
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: DetailView
    func setView() {
        setSubView()
        setStyle()
        setLayout()
        setPokeImage()
        setTypeStackView()
        setStatStackView()
    }
    
    // MARK: PokemonView set
    private func setPokeImage() {
        DispatchQueue.main.async { [unowned self] in
            guard let url = URL(string: Endpoint.imageHQ(image: self.pokemonData.pokemon.id).url) else { return }
            self.pokemonData.getPokeImage(url) { (error) in
                self.presenter.delegate.showErrorAlert(message: error)
            }
            self.pokeImage.image = self.pokemonData.pokeImage
            self.pokeImage.layoutIfNeeded()
            self.pokeImage.contentMode = .scaleAspectFill
            self.pokeImage.vibrate()
        }
    }
    
    private func setTypeStackView() {
        for types in pokemonData.pokemon.types {
            let typeView = TypeView(type: types.type.name)
            typeView.translatesAutoresizingMaskIntoConstraints = false
            typeStack.addArrangedSubview(typeView)
            typeView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        }
    }
    
    private func setStatStackView() {
        for stats in pokemonData.pokemon.stats {
            guard let type = pokemonData.pokemon.types.first else { return}
            let statView = StatView(type: type.type.name, stat: stats)
            statStackView.addArrangedSubview(statView)
            statView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            statView.layoutIfNeeded()
        }
    }
    
    // MARK: SetViewDelegate
    func setSubView() {
        addSubview(pokeImage)
        addSubview(typeStack)
        addSubview(scrollView)
        scrollView.addSubview(statStackView)
    }
    
    func setStyle() {
        backgroundColor = .white
        typeStack.axis = .horizontal
        typeStack.spacing = 10
        typeStack.distribution = .fillEqually
        statStackView.distribution = .fillEqually
        statStackView.axis = .vertical
        statStackView.spacing = 25
    }
    
    func setLayout() {
        pokeImage.translatesAutoresizingMaskIntoConstraints = false
        pokeImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        pokeImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        pokeImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        pokeImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        typeStack.translatesAutoresizingMaskIntoConstraints = false
        typeStack.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 25).isActive = true
        typeStack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        typeStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: typeStack.bottomAnchor, constant: 50).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        statStackView.translatesAutoresizingMaskIntoConstraints = false
        statStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        statStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        statStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        statStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        statStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}
