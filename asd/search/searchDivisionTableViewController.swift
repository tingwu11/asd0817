//
//  searchDivisionTableViewController.swift
//  asd
//
//  Created by apple on 2021/8/15.
//


import UIKit

class searchDivisionTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var array = ["皮膚科", "復健科", "婦產科", "大腸直腸肛門科", "內分泌及新陳代謝科", "肝膽腸胃科", "家庭醫學科", "骨科", "血液腫瘤科", "心身科", "心臟內科", "胸腔內科", "胸腔外科", "中醫科", "神經內科", "神經外科", "腎臟內科", "耳鼻喉科", "一般內科", "一般外科", "牙科", "眼科", "兒童醫學部"]
    
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

extension searchDivisionTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        for i in 1...23 {
            if array[indexPath.row] == array[i-1]{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "division\(i)")
                    self.present(vc!, animated: true, completion: nil)

            }
        }
    }
}
