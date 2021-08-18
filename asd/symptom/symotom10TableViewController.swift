//
//  symotom10TableViewController.swift
//  asd
//
//  Created by apple on 2021/8/18.
//

import UIKit

class symotom10TableViewController: UITableViewController {
    
    var array = ["胸腔內科", "感染病科", "小兒科", "耳鼻喉科"]
    
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
