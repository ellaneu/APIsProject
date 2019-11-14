//
//  representative.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/12/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation

struct RepresentativeItem: Codable {
    var name: String
    var party: String
    var state: String
    var district: String
    var phone: String
    var office: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case party
        case state
        case district
        case phone
        case office
        case link
    }
    
    init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: CodingKeys.name)
        self.party = try values.decode(String.self, forKey: CodingKeys.party)
        self.state = try values.decode(String.self, forKey: CodingKeys.state)
        self.district = try values.decode(String.self, forKey: CodingKeys.district)
        self.phone = try values.decode(String.self, forKey: CodingKeys.phone)
        self.office = try values.decode(String.self, forKey: CodingKeys.office)
        self.link = try values.decode(String.self, forKey: CodingKeys.link)
    }
}

struct RepresentativeItems: Codable {
    let results: [RepresentativeItem]
}
