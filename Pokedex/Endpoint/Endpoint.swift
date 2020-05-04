//
//  Constants.swift
//  Pokedex
//
//  Created by claudio cavalli on 02/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

/* Per ridurre il massiccio utilizzo degli url sparsi nel codice ho organizzato una semplice enum che da la possibilità di accedere agli url di riferimento con gli eventuali attribbuti.
*/

enum Endpoint {
    case basePokedex
    case pokedex(offset: Int)
    case image(image: String)
    case imageHQ(image: String)
}

extension Endpoint {
    // MARK: property
    var url: String {
        switch self {
        case .basePokedex:
            return "https://pokeapi.co/api/v2/pokemon/"
        case .pokedex(let offset):
            return "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=10"
        case .image(let image):
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(image).png"
        case .imageHQ(let image):
            return "https://pokeres.bastionbot.org/images/pokemon/\(image).png"
        }
    }
}

