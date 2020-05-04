//
//  Networking+DataTaskRequest.swift
//  Pokedex
//
//  Created by claudio cavalli on 01/05/2020.
//  Copyright © 2020 claudio cavalli. All rights reserved.
//

import UIKit

extension Networking {
    static func dataTaskRequest(request: URLRequest,
                                delegate: NetworkingDelegate) {
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        
        session.dataTask(with: request) { data, _, error in
            if let error = error as? URLError {
                delegate.errorDescription(message: error.localizedDescription)
            } else if let data = data {
                guard let model = parsedModel(with: data) else {
                    delegate.onError()
                    return
                }
                delegate.getResultModel(model: model)
            } else {
                delegate.onError()
            }
        }.resume()
    }
    
    static func parsedModel(with data: Data) -> Model? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            let model =  try decoder.decode(Model.self, from: data)
            return model
        } catch {
            return nil
        }
    }
}
