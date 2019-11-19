//
//  dataUSA.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/14/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation

struct DataUSAItem: Codable {
    var idState: String
    var state: String
    var year: String
    var population: Int
    
    enum CodingKeys: String, CodingKey {
        case idState = "ID State"
        case state = "State"
        case year = "Year"
        case population = "Population"

    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.idState = try values.decode(String.self, forKey: CodingKeys.idState)
        self.state = try values.decode(String.self, forKey: CodingKeys.state)
        self.year = try values.decode(String.self, forKey: CodingKeys.year)
        self.population = try values.decode(Int.self, forKey: CodingKeys.population)
    }
}

struct DataUSAItems: Codable {
       let data: [DataUSAItem]
   }
