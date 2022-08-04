//
//  ContinentsModel.swift
//  Teleportation
//
//  Created by Майя Калицева on 03.08.2022.
//

import Foundation

struct ContinentRoot: Codable {
    let links: ContinentMiddle
    
    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}

struct ContinentMiddle: Codable {
    let continentItems: [ContinentsResponse]
    
    enum CodingKeys: String, CodingKey {
        case continentItems = "continent:items"
    }
}

struct ContinentsResponse: Codable {
    let name: String
    let href: String
}

