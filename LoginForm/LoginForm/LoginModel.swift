//
//  LoginModel.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 12/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class LoginModel: NSObject {
    
    var userName:String
    var password:String
    
    init?(userName:String, password:String,
          userNameValidator:UserNameValidator? = nil,
          passwordValidator:PasswordValidator? = nil) {
        
        let validator1 = userNameValidator ?? UserNameValidator()
        if validator1.validate(userName) == false {
            return nil
        }
        
        let validator2 = passwordValidator ?? PasswordValidator()
        if validator2.validate(password) == false {
            return nil
        }
        
        self.userName = userName
        self.password = password

        super.init()
    }
}
