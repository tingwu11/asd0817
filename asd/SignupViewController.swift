//
//  SignupViewController.swift
//  asd
//
//  Created by apple on 2021/8/14.
//

import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func createAccountAction(_ sender: AnyObject) {
  
    if emailTextField.text == "" {
        let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    
    } else {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error == nil {
                
                let alertController = UIAlertController(title: "Success", message: "Please return to the login screen to log in again", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)

                
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
