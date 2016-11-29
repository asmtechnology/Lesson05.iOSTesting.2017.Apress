//
//  MockLoginViewModel.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 28/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockLoginViewModel : LoginViewModel {
    
    var performInitialViewSetupExpectation:XCTestExpectation?
    var userNameDidEndOnExitExpectation:XCTestExpectation?
    var passwordDidEndOnExitExpectation:XCTestExpectation?
    var userNameUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var passwordUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var loginExpectation:(XCTestExpectation, expectedUserName:String, expectedPassword:String)?
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func userNameDidEndOnExit() {
        userNameDidEndOnExitExpectation?.fulfill()
    }
    
    override func passwordDidEndOnExit() {
        passwordDidEndOnExitExpectation?.fulfill()
    }
    
    override func userNameUpdated(_ value:String?) {
        if let (expectation, expectedValue) = self.userNameUpdatedExpectation,
            let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func passwordUpdated(_ value:String?) {
        if let (expectation, expectedValue) = self.passwordUpdatedExpectation,
            let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func login(userName:String?, password:String?) {
        
        if let (expectation, expectedUserName, expectedPassword) = self.loginExpectation,
            let userName = userName,
            let password = password {
            if ((userName.compare(expectedUserName) == .orderedSame) &&
                (password.compare(expectedPassword) == .orderedSame)) {
                
                expectation.fulfill()
            }
        }
    }
    
}
