//
//  searchMapTableViewController.swift
//  asd
//
//  Created by apple on 2021/8/15.
//

import UIKit

class searchMapTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var array = ["童綜合醫院", "光田醫院", "何秋燕皮膚科", "夏在中診所", "潔新眼科", "蕭英宗耳鼻喉科", "長明眼科", "晨安診所", "仁人堂中醫診所", "一品堂中醫診所", "楊耳鼻喉科"]
    
    var result: [String] = []
    
    var mySearchController: UISearchController?
    
    func settingSearchController(){
        mySearchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = mySearchController?.searchBar
        mySearchController?.searchResultsUpdater = self
        mySearchController?.searchBar.placeholder = "Search Words"
        mySearchController?.searchBar.barTintColor = .gray
        mySearchController?.searchBar.tintColor = .blue
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
extension searchMapTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        for i in 1...11 {
            if array[indexPath.row] == array[i-1]{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "map\(i)")
                self.present(vc!, animated: true, completion: nil)
            }
        }
    }
}
