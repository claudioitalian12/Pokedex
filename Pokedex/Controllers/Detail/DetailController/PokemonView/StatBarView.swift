//
//  StatBar.swift
//  Pokedex
//
//  Created by claudio cavalli on 03/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

class StatBarView: UIView, SetViewDelegate {
    // MARK: property 
    private var pokeValue = UIView()
    private var base_stat: CGFloat
    private var typeName: String
    
    // MARK: StatBarView init
    init(base_stat: CGFloat, typeName: String) {
        self.base_stat = base_stat
        self.typeName = typeName
        super.init(frame: .zero)
        setSubView()
        setStyle()
        setLayout()
    }
    
    // MARK: layout
    override func layoutSubviews() {
        super.layoutSubviews()
        pokeValue.stretch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: SetViewDelegate
    func setSubView() {
        addSubview(pokeValue)
    }
    
    func setStyle() {
        layer.cornerRadius = 6.0
        alpha = 1.0
        clipsToBounds = true
        backgroundColor = typeName.typeColor().withAlphaComponent(0.5)
        pokeValue.layer.cornerRadius = 6.0
        pokeValue.alpha = 0
        pokeValue.backgroundColor = typeName.typeColor()
    }
    
    func setLayout() {
        pokeValue.translatesAutoresizingMaskIntoConstraints = false
        pokeValue.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pokeValue.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pokeValue.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pokeValue.widthAnchor.constraint(equalTo: widthAnchor, multiplier: base_stat/252).isActive = true
    }
}
