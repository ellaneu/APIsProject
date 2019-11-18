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
    var idYear: String
    var year: String
    var population: String
    var slugNation: String
    
    enum CodingKeys: String, CodingKey {
        case idState = "ID State"
        case state = "State"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.idState = try values.decode(String.self, forKey: CodingKeys.idState)
        self.state = try values.decode(String.self, forKey: CodingKeys.state)
        self.idYear = try values.decode(String.self, forKey: CodingKeys.idYear)
        self.year = try values.decode(String.self, forKey: CodingKeys.year)
        self.population = try values.decode(String.self, forKey: CodingKeys.population)
        self.slugNation = try values.decode(String.self, forKey: CodingKeys.slugNation)
    }
}

struct DataUSAItems: Codable {
       let data: [DataUSAItem]
   }
