//
//  RepresentativeController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/12/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation
import UIKit

class RepresentativeController {
    
    func fetchItems(matching query: [String: String], completion: @escaping ([RepresentativeItem]?) -> Void) {
        let baseURL = URL(string:  "https://whoismyrepresentative.com/getall_mems.php?")!
        
        guard let url = baseURL.withQueries(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data,
                let representativeItems = try? decoder.decode(RepresentativeItems.self, from: data) {
                completion(representativeItems.results)
            } else {
                print("Either no data was returned, or data was not serialized")
                completion(nil)
                return
            }
        }
        
        task.resume()
    }
}





