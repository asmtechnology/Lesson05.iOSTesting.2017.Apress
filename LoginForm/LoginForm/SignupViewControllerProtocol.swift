//
//  SignupViewControllerProtocol.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 28/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

protocol SignupViewControllerProtocol : class {
    func clearUserNameField()
    func clearPasswordField()
    func clearConfirmPasswordField()
    func enableCancelButton(_ status:Bool)
    func enableCreateButton(_ status:Bool)
    func hideKeyboard()
}
