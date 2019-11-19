//
//  DogItemController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/13/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation
import UIKit

class DogItemController {
    
    func fetchItems(completion: @escaping (DogItem?) -> Void) {
        let baseURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        let query: [String: String] = [
            "api_key": "DEMO_KEY"
        ]
        
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data,
                let dogItems = try? decoder.decode(DogItem.self, from: data) {
                completion(dogItems)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func fetchImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
}
