//
//  nobelPrize.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/18/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation

struct nobelPrizeItem: Codable {
    var year: String
    var category: String
    var laureates: [Laureates]
}

struct Laureates: Codable {
    var id: String
    var firstname: String
    var surname: String
}
