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
    
    init(view:LoginViewControllerProtocol) {
        super.init()
        self.view = view
    }
    
}
