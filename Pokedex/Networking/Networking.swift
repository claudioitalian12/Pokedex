//
//  Networking.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import Foundation

/* Il Networking consente di ottenere uno degli elementi del model(pokedex,pokemon) partendo da un generico decodable. Il Networking comunica attraverso un protocol il risultato delle chiamate get al presenter.
*/

struct Networking<Model: Decodable> {
    static func getPokedex(_ delegate: NetworkingDelegate, url: String) {
        guard let url = url.stringToURL() else {
            delegate.onError()
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        self.dataTaskRequest(request: request, delegate: delegate)
    }
    
    static func getPokemon(_ delegate: NetworkingDelegate, url: String) {
        guard let url = url.stringToURL() else {
            delegate.onError()
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        self.dataTaskRequest(request: request, delegate: delegate)
    }
}
