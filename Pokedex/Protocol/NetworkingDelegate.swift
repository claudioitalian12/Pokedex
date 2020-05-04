//
//  NetworkingDelegat.swift
//  Pokedex
//
//  Created by claudio cavalli on 04/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import Foundation

protocol NetworkingDelegate {
    func onError()
    func errorDescription(message: String)
    func getResultModel(model: Decodable)
}
