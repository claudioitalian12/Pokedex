//
//  PokedexModel.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

/* I modelli sono utilizzati dal networking per decodificare i dati ricevuti dalle varie chiamate. Per comodità ho manipolato con l'init il tipo o la struttura dei dati decodificati. Nel Pokemon model ho fatto un reversed dei tipi perchè le api impostano come tipo primario l'ultimo nell'array e reso il nome uppercased, mentre per le stats la base_stats viene decodificata come CGFloat perchè dopo sarà usata al fine di ottenere una percentuale nella StatBarView.
    Infine il PokemonData è una struttura usata al fine di unire le informazioni del pokemon con la sua image.
*/

struct Pokedex: Decodable {
    // MARK: property
    var results: [Result]
}

struct Pokemon: Decodable {
    // MARK: property
    let id: String
    let name: String
    var types: [PokemonType]
    let stats: [PokemonStat]
    private enum CodingKeys: String, CodingKey {
        case id, name, types, stats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Pokemon.CodingKeys.self)
        name = try container.decode(String.self, forKey: .name).uppercased()
        types = try container.decode([PokemonType].self, forKey: .types).reversed()
        stats = try container.decode([PokemonStat].self, forKey: .stats)
        let number = try container.decode(Int.self, forKey: .id)
        let id = String(number)
        self.id = id
    }
}

struct PokemonType: Decodable {
    // MARK: property
    let type: Result
}

struct PokemonStat: Decodable {
    // MARK: property
    let stat: Result
    let base_stat: CGFloat
    private enum CodingKeys: String, CodingKey {
        case stat, base_stat
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokemonStat.CodingKeys.self)
        stat = try container.decode(Result.self, forKey: .stat)
        let base_stat = try container.decode(Int.self, forKey: .base_stat)
        let base = CGFloat(base_stat)
        self.base_stat = base
    }
}

struct Result: Decodable {
    // MARK: property
    let name: String
    let url: String
}

struct PokemonData {
    // MARK: property
    var pokemon: Pokemon
    var pokeImage: UIImage?
    init(pokemon: Pokemon, imageURL: URL) {
        self.pokemon = pokemon
        getPokeImage(imageURL)
    }
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    mutating func getPokeImage(_ imageURL: URL, completion: ((String) -> ())? = nil) {
        do {
            let urlImage = try Data(contentsOf: imageURL)
            pokeImage = UIImage(data: urlImage)
        } catch {
            completion?(error.localizedDescription)
        }
    }
}
