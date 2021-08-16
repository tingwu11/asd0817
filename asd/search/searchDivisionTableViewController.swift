//
//  searchDivisionTableViewController.swift
//  asd
//
//  Created by apple on 2021/8/15.
//


import UIKit

class searchDivisionTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q"]
    
    var result: [String] = []
    
    var mySearchController: UISearchController?
    
    func settingSearchController(){
        mySearchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = mySearchController?.searchBar
        mySearchController?.searchResultsUpdater = self
        mySearchController?.searchBar.placeholder = "Search Words"
        mySearchController?.searchBar.barTintColor = .blue
        mySearchController?.searchBar.tintColor = .red
        mySearchController?.searchBar.searchBarStyle = .prominent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingSearchController()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (mySearchController?.isActive)! {
            return result.count
        } else {
            return array.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let results = ((mySearchController?.isActive)!) ? result[indexPath.row] : array[indexPath.row]
        
        cell.textLabel?.text = results
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    
    func filterContent(for searchText: String) {
        result = array.filter({ (filterArray) -> Bool in
            let words = filterArray
            let isMach = words.localizedCaseInsensitiveContains(searchText)
            
            return isMach
        })
    }
}
