//
//  StatView.swift
//  Pokedex
//
//  Created by claudio cavalli on 03/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

class StatView: UIView, SetViewDelegate {
    // MARK: property 
    private let statName: PokemonStat
    private let statBar: StatBarView
    private let type: String
    private let label = UILabel()
    private let stack = UIStackView()
    
    // MARK: StatView init
    init(type: String, stat: PokemonStat) {
        self.statName = stat
        self.type = type
        self.statBar = StatBarView(base_stat: stat.base_stat, typeName: type)
        label.text = stat.stat.name.uppercased()
        super.init(frame: .zero)
        setSubView()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: SetViewDelegate
    func setSubView() {
        addSubview(stack)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(statBar)
    }
    
    func setStyle() {
        backgroundColor = .white
        layer.cornerRadius = 6.0
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fillEqually
        label.textColor = .black
    }
    
    func setLayout() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        statBar.translatesAutoresizingMaskIntoConstraints = false
    }
}
