//
//  LoginViewController.swift
//  asd
//
//  Created by apple on 2021/8/14.
//
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginAction(_ sender: AnyObject) {

        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
        
            // 提示用戶是不是忘記輸入 textfield ？
        
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
        
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
        
            self.present(alertController, animated: true, completion: nil)

        } else {
        
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
            
                if error == nil {
                
                    // 登入成功，打印 ("You have successfully logged in")
                
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                    self.present(vc!, animated: true, completion: nil)
                
                } else {
                
                    // 提示用戶從 firebase 返回了一個錯誤。
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func newLogin(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
