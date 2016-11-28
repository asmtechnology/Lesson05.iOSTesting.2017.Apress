//
//  MockLoginViewController.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 20/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import UIKit
import XCTest

class MockLoginViewController : LoginViewControllerProtocol {
    
    var expectationForClearUserNameField:XCTestExpectation?
    var expectationForClearPasswordField:XCTestExpectation?
    var expectationForEnableLoginButton:(XCTestExpectation, Bool)?
    var expectationForCreateAccountButton:(XCTestExpectation, Bool)?
    var expectationForHideKeyboard:XCTestExpectation?
    
    func clearUserNameField() {
        self.expectationForClearUserNameField?.fulfill()
    }
    
    func clearPasswordField() {
        self.expectationForClearPasswordField?.fulfill()
    }
    
    func enableLoginButton(_ status:Bool) {
        if let (expectation, expectedValue) = self.expectationForEnableLoginButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func enableCreateAccountButton(_ status:Bool) {
        if let (expectation, expectedValue) = self.expectationForCreateAccountButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func hideKeyboard() {
        self.expectationForHideKeyboard?.fulfill()
    }
}
