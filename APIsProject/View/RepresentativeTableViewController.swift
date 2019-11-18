//
//  RepresentativeTableViewController.swift
//  APIsProject
//
//  Created by Ella  Neumarker on 11/12/19.
//  Copyright © 2019 Ella Neumarker. All rights reserved.
//

import UIKit

class RepresentativeTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var items = [RepresentativeItem]()
    var representativeController = RepresentativeController()
    
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
                "zip": searchTerm,
                "output": "json"
            ]
            
            representativeController.fetchItems(matching: query) { (fetchItems) in
                if let fetchItems = fetchItems {
                    DispatchQueue.main.async {
                        self.items = fetchItems
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
//    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
//        let item = items[indexPath.row]
//
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = item.state
//
//    }
    
   

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath) as! RepTableViewCell

//        configure(cell: cell, forItemAt: indexPath)
        
        let item = items[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.partyLabel.text = item.party
        cell.stateLabel.text = item.state
        cell.phoneLabel.text = item.phone
        cell.linkLabel.text = item.link

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension RepresentativeTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
