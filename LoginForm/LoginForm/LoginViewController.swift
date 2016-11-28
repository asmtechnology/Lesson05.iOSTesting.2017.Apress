//
//  LoginViewController.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 10/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
    }

    @IBAction func userNameDidEndOnExit(_ sender: Any) {
        
    }

    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
    
        return true
    }
    
}


extension LoginViewController : LoginViewControllerProtocol {
    
    func clearUserNameField() {
        self.userNameTextField.text = ""
    }
    
    func clearPasswordField() {
        self.passwordTextField.text = ""
    }
    
    func enableLoginButton(_ status:Bool) {
        self.loginButton.isEnabled = status
    }
    
    func enableCreateAccountButton(_ status:Bool) {
        self.loginButton.isEnabled = status
    }
    
    func hideKeyboard() {
        self.userNameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
}
