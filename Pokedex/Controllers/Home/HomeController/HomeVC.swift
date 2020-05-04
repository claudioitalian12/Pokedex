//
//  HomeVC.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, SetViewDelegate {
    // MARK: property 
    var pokedexView = PokedexView()
    
    // MARK: HomeVC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubView()
        setStyle()
        setLayout()
        setPokedexView()
    }
    
    // MARK: HomeVC set
    func setPokedexView() {
        pokedexView.presenter.load()
    }
    
    // MARK: SetViewDelegate
    func setSubView() {
        view.addSubview(pokedexView)
    }
    
    func setStyle() {
        title = "Pokedex"
    }
    
    func setLayout() {
        pokedexView.translatesAutoresizingMaskIntoConstraints = false
        pokedexView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pokedexView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pokedexView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pokedexView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
