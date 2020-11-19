//
//  Network.swift
//  BestBreweries
//
//  Created by Александр on 18.11.2020.
//

import Foundation

class Network {
    
    static let shared = Network()

    private init() {}
    
    func fetchData<T: Decodable>( model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        let request = URLRequest(url: URL(string: "https://api.openbrewerydb.org/breweries")!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("\n Error JSON fetching: ", error.localizedDescription)
                completion(.failure(error))
                return
            }

            guard let jsonData = data else { return }

            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(model, from: jsonData)

                DispatchQueue.main.async {
                    completion(.success(data ))
                }
            } catch let error {
                print("\n Error JSON decode: ", error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}
