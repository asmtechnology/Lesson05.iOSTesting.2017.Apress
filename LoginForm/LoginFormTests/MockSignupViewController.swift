//
//  MockSignupViewController.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 28/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockSignupViewController : SignupViewControllerProtocol {
    
    var expectationForClearUserNameField:XCTestExpectation?
    var expectationForClearPasswordField:XCTestExpectation?
    var expectationForClearConfirmPasswordField:XCTestExpectation?
    var expectationForEnableCancelButton:(XCTestExpectation, Bool)?
    var expectationForEnableCreateButton:(XCTestExpectation, Bool)?
    var expectationForHideKeyboard:XCTestExpectation?
    
    func clearUserNameField() {
        self.expectationForClearUserNameField?.fulfill()
    }
    
    func clearPasswordField() {
        self.expectationForClearPasswordField?.fulfill()
    }
    
    func clearConfirmPasswordField() {
        self.expectationForClearConfirmPasswordField?.fulfill()
    }
    
    func enableCancelButton(_ status:Bool) {
        if let (expectation, expectedValue) = self.expectationForEnableCancelButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func enableCreateButton(_ status:Bool) {
        if let (expectation, expectedValue) = self.expectationForEnableCreateButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func hideKeyboard() {
        self.expectationForHideKeyboard?.fulfill()
    }
}


