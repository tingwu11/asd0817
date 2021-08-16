//
//  LogoutViewController.swift
//  asd
//
//  Created by apple on 2021/8/15.
//

import Firebase
import FirebaseAuth

class LogoutViewController: UIViewController {

    @IBAction func logoutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                dismiss(animated: true, completion: nil)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

}
