//
//  SignupController.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 28/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol SignupControllerDelegate : class {
    func signupResult(result:Bool)
}

class SignupController : NSObject {
    
    let dummyUsername = "Alibaba"
    let dummyPassword = "Abracadabra"
    let dummyEmailAddress = "a@b.com"
    
    weak var signupControllerDelegate : SignupControllerDelegate?
    
    init(delegate:SignupControllerDelegate?) {
        self.signupControllerDelegate = delegate
        super.init()
    }
    
    func doSignup(model:SignupModel) {
        
        let userName = model.userName
        let password = model.password
        let emailAddress = model.emailAddress
        
        if ((userName.compare(dummyUsername) == .orderedSame) &&
            (password.compare(dummyPassword) == .orderedSame) &&
            (emailAddress.compare(dummyEmailAddress) == .orderedSame)) {
            signupControllerDelegate?.signupResult(result: true)
            return
        }
        
        signupControllerDelegate?.signupResult(result: false)
    }
    
}
