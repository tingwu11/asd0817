//
//  searchDoctorTableViewController.swift
//  asd
//
//  Created by apple on 2021/8/15.
//

import UIKit

class searchDoctorTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var array = ["段彭年", "賴炳村", "賴仁淙", "廖利亨", "林牧熹", "林致瑋", "柯麗鏞", "何明霖", "何秋燕", "許本麟", "黃湘雄", "黃世忠", "黃素雲", "金正詔", "江友馨", "謝明翰", "孫茂勝", "遲景上", "陳可明", "陳建雄", "陳昭星", "陳昶旭", "陳壽星", "陳子勇", "陳宗瀛", "陳彥志", "陳暐棣", "陳瑜泓", "陳昱景", "張家築", "張宏壽", "張偉梁", "張元傑", "禚靖", "曾士婷", "蔡宏志", "蔡全德", "蘇楓琳", "蘇劍秋", "顏弘毅", "楊鈞百", "楊韻秋", "巫漢揆", "吳坤霖", "吳景崇", "吳中興", "溫偉鈞", "王銘甫"]
    
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
