//
//  LoginController.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 27/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol LoginControllerDelegate : class {
    func loginResult(result:Bool)
}

class LoginController : NSObject {
    
    let dummyUsername = "Alibaba"
    let dummyPassword = "Abracadabra"
    
    weak var loginControllerDelegate : LoginControllerDelegate?
    
    init(delegate:LoginControllerDelegate?) {
        self.loginControllerDelegate = delegate
        super.init()
    }
    
    func doLogin(model:LoginModel) {
        
        let userName = model.userName
        let password = model.password
        
        if ((userName.compare(dummyUsername) == .orderedSame) &&
            (password.compare(dummyPassword) == .orderedSame)) {
            loginControllerDelegate?.loginResult(result: true)
            return
        }
        
        loginControllerDelegate?.loginResult(result: false)
    }
    
}
