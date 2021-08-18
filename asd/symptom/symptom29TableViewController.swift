//
//  symptom29TableViewController.swift
//  asd
//
//  Created by apple on 2021/8/18.
//

import UIKit

class symptom29TableViewController: UITableViewController {

    var array = ["血液腫瘤科", "感染病科", "放射腫瘤科", "腫瘤整合門診"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }

}
