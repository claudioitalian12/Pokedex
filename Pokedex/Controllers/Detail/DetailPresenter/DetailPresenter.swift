//
//  DetailPresenter.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

struct DetailPresenter {
    // MARK: property
    weak var view: DetailView?
    var delegate: DetailPresenterDelegate
    
    // MARK: init
    init(view: DetailView,
         delegate: DetailPresenterDelegate) {
        self.view = view
        self.delegate = delegate
    }
    
    func load() {
        view?.setView()
    }
}
