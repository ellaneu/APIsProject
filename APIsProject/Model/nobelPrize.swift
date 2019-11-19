//
//  nobelPrize.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/18/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation

struct NobelPrizeItem: Codable {
    var year: String
    var category: String
    var laureates: [Laureates]?
    
    
//    enum CodingKeys: String, CodingKey {
//        case year
//        case category
//        case laureates
//    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.year = try values.decode(String.self, forKey: CodingKeys.year)
//        self.category = try values.decode(String.self, forKey: CodingKeys.category)
//        self.laureates = try values.decode([Laureates].self, forKey: CodingKeys.laureates)
//    }
}

struct NobelPrizeItems: Codable {
    let prizes: [NobelPrizeItem]
}

