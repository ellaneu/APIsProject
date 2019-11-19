//
//  NobelPrizeController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/19/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation

class NobelPrizeController {
    
    func fetchItems(matching query: [String: String], completion: @escaping ([NobelPrizeItem]?) -> Void) {
        let baseURL = URL(string: "http://api.nobelprize.org/v1/prize.json?")!
        
        guard let url = baseURL.withQueries(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            guard let data = data else { fatalError() }
            do {
                let nobelPrizeItems = try decoder.decode(NobelPrizeItems.self, from: data)
                completion(nobelPrizeItems.prizes)
            } catch {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
                return
            }
        }
        
        task.resume()
    }
}
