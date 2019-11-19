//
//  DataUSATableViewController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/14/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import UIKit

class DataUSATableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var items = [DataUSAItem]()
    var dataUSAController = DataUSAController()
    
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
                "drilldowns": "State",
                "measures": "Population",
                "year": searchTerm
            ]
            
            dataUSAController.fetchItems(matching: query) { (fetchItems) in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "USACell", for: indexPath) as! DataUSATableViewCell

        let item = items[indexPath.row]
        
        cell.stateLabel.text = item.state
        cell.stateIDLabel.text = item.idState
        cell.yearLabel.text = item.year
        cell.populationLabel.text = String(item.population)
        cell.showsReorderControl = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        let movedState = items.remove(at: fromIndexPath.row)
//        items.insert(movedState, at: to.row)
//        tableView.reloadData()
//    }
}

extension DataUSATableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
