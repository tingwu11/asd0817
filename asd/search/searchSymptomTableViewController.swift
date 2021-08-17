//
//  searchSymptomTableViewController.swift
//  asd
//
//  Created by apple on 2021/8/15.
//

import UIKit

class searchSymptomTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var array = ["鼻塞、鼻過敏", "不明原因出血", "貧血, 肥胖", "頭部外傷", "頭痛、頭暈", "脫臼、骨折、骨刺", "吞嚥困難", "女性下腹部疼痛、陰道出血、白帶與不正常分泌物", "感冒、發燒", "肛門腫痛、脫肛、痔瘡、長期便秘", "關節疼痛、骨骼疼痛", "咳血, 咳嗽", "牙齒疼痛、口腔內長囊包", "黑色、血便", "呼吸困難、氣喘, 精神分裂、酒癮及藥癮", "頸部腫痛、腰酸背痛", "雀斑、青春痘", "細菌感染", "血尿, 血壓高", "消化不良", "小便困難", "心悸、心雜音、心律不整", "胸部外傷、胸悶、胸痛", "指甲受傷、灰指甲", "腫瘤", "失眠、睡眠障礙", "食慾不振、不明原因體重下降", "燒燙傷、擦挫傷", "手腳酸麻無力痛、冰冷", "上吐下瀉、腹部不舒服", "乳房疼痛、硬塊", "壓力大、焦慮", "藥物過敏", "藥物中毒", "眼睛痛、近視、斜視", "胃食道逆流", "蚊蟲咬、皮膚過敏、長水泡、蜂窩性組織炎", "月經失調", "運動傷害"]
    
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
