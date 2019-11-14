//
//  dog.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/12/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation

struct DogItem: Codable {
    var message: URL

    enum CodingKeys: String, CodingKey {
        case message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.message = try values.decode(URL.self, forKey: CodingKeys.message)
    }


}


