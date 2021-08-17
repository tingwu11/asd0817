//
//  commentViewController.swift
//  asd
//
//  Created by apple on 2021/8/17.
//

import UIKit
import FirebaseDatabase

class commentViewController: UIViewController {
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()


        ref = Database.database().reference()
    }
    
    @IBAction func sendAction(_ sender: Any) {
        let nicknames = self.nicknameTextField.text
        let comments = self.commentTextField.text
        self.ref.child("users").child("\(nicknames!)").setValue(["comment": "\(comments!)"])
        
        let alertController = UIAlertController(title: "傳送成功", message: "謝謝您的留言！", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "確定", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
