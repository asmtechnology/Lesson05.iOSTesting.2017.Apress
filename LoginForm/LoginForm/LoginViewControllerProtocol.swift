//
//  LoginViewControllerProtocol.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 20/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol : class {
    func clearUserNameField()
    func clearPasswordField()
    func enableLoginButton(_ status:Bool)
    func enableCreateAccountButton(_ status:Bool)
    func hideKeyboard()
}
