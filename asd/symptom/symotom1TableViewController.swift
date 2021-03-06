//
//  symotom1TableViewController.swift
//  asd
//
//  Created by apple on 2021/8/18.
//

import UIKit

class symotom1TableViewController: UITableViewController {
   
    var array = ["耳鼻喉科", "小兒科"]
    
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

extension symotom1TableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if array[indexPath.row] == array[0]{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "division18")
                self.present(vc!, animated: true, completion: nil)
        }
        if array[indexPath.row] == array[1]{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "division23")
                self.present(vc!, animated: true, completion: nil)
        }
    }
}
