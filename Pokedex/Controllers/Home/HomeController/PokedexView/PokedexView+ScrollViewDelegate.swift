//
//  PokedexView+ScrollViewDelegate.swift
//  Pokedex
//
//  Created by claudio cavalli on 02/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

extension PokedexView: UIScrollViewDelegate {
    func refresh() {
        DispatchQueue.main.async { [unowned self] in
            self.loadMoreActivityIndicator.startAnimating()
            self.presenter.fetchPokdexList(offset: self.pokedex.results.count)
        }
    }
    
    // MARK: scrollViewDelegate
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !loadActivityIndicator.isAnimating {
            let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
            if bottomEdge >= scrollView.contentSize.height {
                if !loadMoreActivityIndicator.isAnimating {
                    tableView.tableFooterView = loadMoreActivityIndicator
                    tableView.tableFooterView?.isHidden = false
                    refresh()
                }
            }
        }
    }
}
