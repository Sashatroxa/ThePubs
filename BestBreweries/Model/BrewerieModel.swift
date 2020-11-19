//
//  BrewerieModel.swift
//  BestBreweries
//
//  Created by Александр on 18.11.2020.
//

import Foundation

struct BrewerieModel: Decodable {
    let name, street: String?
    let city, state: String?
    let country: String?
    let website_url: String?
}

