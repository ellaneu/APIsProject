//
//  DataUSAController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/14/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import Foundation

class DataUSAController {
    
    func fetchItems(matching query: [String: String], completion: @escaping ([DataUSAItem]?) -> Void) {
        let baseURL = URL(string: "https://datausa.io/api/data?")
        
        guard let url = baseURL?.withQueries3(query) else {
            completion(nil)
            print("Unable to build URL with supplied queries")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data,
                let dataUSAItems = try? decoder.decode(DataUSAItems.self, from: data) {
                completion(dataUSAItems.data)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
                return
            }
        }
        
        task.resume()
    }
}
