//
//  LoginViewModel.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 20/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class LoginViewModel: NSObject {
    
    weak var view:LoginViewControllerProtocol?
    
    var userNameValidator:UserNameValidator?
    var passwordValidator:PasswordValidator?
    var userNameValidated:Bool
    var passwordValidated:Bool
    
    var loginController:LoginController?
    
    init(view:LoginViewControllerProtocol) {
        self.userNameValidated = false
        self.passwordValidated = false
        
        super.init()
        
        self.view = view
    }
    
    func performInitialViewSetup() {
        view?.clearUserNameField()
        view?.clearPasswordField()
        view?.enableLoginButton(false)
        view?.enableCreateAccountButton(true)
    }
    
    func userNameDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func passwordDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func userNameUpdated(_ value:String?) {
        
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = self.userNameValidator ?? UserNameValidator()
        userNameValidated = validator.validate(value)
            
        if userNameValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
    }
    
    
    func passwordUpdated(_ value:String?) {
        
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = self.passwordValidator ?? PasswordValidator()
        passwordValidated = validator.validate(value)
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if userNameValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
    }
    
    func login(userName:String?, password:String?) {
        
        let controller = self.loginController ?? LoginController(delegate:self)
        
        
        if let userName = userName,
            let password = password,
            let model = LoginModel(userName: userName, password: password) {
            controller.doLogin(model: model)
        }
    }
 
}

extension LoginViewModel : LoginControllerDelegate {
    
    func loginResult(result: Bool) {
        // do someting with the result, 
        // perhaps segue to a different screen of the app.
    }
    
}
