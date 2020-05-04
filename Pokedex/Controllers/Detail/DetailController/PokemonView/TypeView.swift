//
//  TypeView.swift
//  Pokedex
//
//  Created by claudio cavalli on 03/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

class TypeView: UIView, SetViewDelegate  {
    // MARK: property let
    private let type: String
    private let label = UILabel()
    
    // MARK: TypeView init
    init(type: String) {
        self.type = type
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
        addSubview(label)
    }
    
    func setStyle() {
        backgroundColor = type.typeColor()
        layer.cornerRadius = 6.0
        label.textColor = .white
        label.textAlignment = .center
        label.text = type.uppercased()
    }
    
    func setLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
