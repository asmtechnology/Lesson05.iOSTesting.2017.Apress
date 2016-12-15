//
//  SignupViewController.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 10/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var viewModel:SignupViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.viewModel == nil {
            self.viewModel = SignupViewModel(view: self)
        }
        
        self.viewModel?.performInitialViewSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func create(_ sender: Any) {
        viewModel?.signup(userName: userNameTextField.text, password: passwordTextField.text, emailAddress: emailAddressTextField.text)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func userNameDidEndOnExit(_ sender: Any) {
        viewModel?.userNameDidEndOnExit()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        viewModel?.passwordDidEndOnExit()
    }

    @IBAction func confirmPasswordDidEndOnExit(_ sender: Any) {
        viewModel?.confirmPasswordDidEndOnExit()
    }
    
    @IBAction func emailAddressDidEndOnExit(_ sender: Any) {
        viewModel?.emailAddressDidEndOnExit()
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


extension SignupViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == self.userNameTextField {
            self.viewModel?.userNameUpdated(textField.text)
        }
        
        if textField == self.passwordTextField {
            self.viewModel?.passwordUpdated(textField.text)
        }
        
        if textField == self.confirmPasswordTextField {
            self.viewModel?.confirmPasswordUpdated(textField.text)
        }
        
        if textField == self.emailAddressTextField {
            self.viewModel?.emailAddressUpdated(textField.text)
        }
        
        return true
    }
    
}

extension SignupViewController : SignupViewControllerProtocol {
    
    func clearUserNameField() {
        self.userNameTextField.text = ""
    }
    
    func clearPasswordField() {
        self.passwordTextField.text = ""
    }
    
    func clearConfirmPasswordField() {
        self.confirmPasswordTextField.text = ""
    }
    
    
    func enableCancelButton(_ status:Bool) {
        self.cancelButton.isEnabled = status
    }
    
    func enableCreateButton(_ status:Bool) {
        self.createButton.isEnabled = status
    }
    
    func hideKeyboard() {
        self.userNameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.confirmPasswordTextField.resignFirstResponder()
    }
}


