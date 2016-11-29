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
    
    var viewModel:LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.viewModel == nil {
            self.viewModel = LoginViewModel(view: self)
        }
        
        self.viewModel?.performInitialViewSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        viewModel?.login(userName: userNameTextField.text, password: passwordTextField.text)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        self.performSegue(withIdentifier: "presentCreateAccount", sender: self)
    }

    @IBAction func userNameDidEndOnExit(_ sender: Any) {
        viewModel?.userNameDidEndOnExit()
    }

    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        viewModel?.passwordDidEndOnExit()
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
    
        if textField == self.userNameTextField {
            self.viewModel?.userNameUpdated(textField.text)
        }
        
        if textField == self.passwordTextField {
            self.viewModel?.passwordUpdated(textField.text)
        }
        
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
