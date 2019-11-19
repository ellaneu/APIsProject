//
//  NobelPrizeTableViewController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/19/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import UIKit

class NobelPrizeTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var items = [NobelPrizeItem]()
    var items2 = [Laureates]()
    var nobelPrizeController = NobelPrizeController()
    
    let queryOptions = ["prize", "laureate"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        
        if !searchTerm.isEmpty {
            
            let query: [String: String] = [
                "year": searchTerm
            ]
            
            nobelPrizeController.fetchItems(matching: query) { (fetchItems) in
                if let fetchItems = fetchItems {
                    DispatchQueue.main.async {
                        self.items = fetchItems
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrizeCell", for: indexPath) as! NobelPrizeTableViewCell

        let item = items[indexPath.row]
        
        cell.yearLabel.text = item.year
        cell.categoryLabel.text = item.category
        cell.firstNameLabel.text = item.laureates?.first?.firstname
        cell.surnameLabel.text = item.laureates?.first?.surname

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NobelPrizeTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
