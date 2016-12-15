//
//  MockSignupViewModel.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 15/12/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockSignupViewModel : SignupViewModel {
    
    var performInitialViewSetupExpectation:XCTestExpectation?
    var userNameDidEndOnExitExpectation:XCTestExpectation?
    var passwordDidEndOnExitExpectation:XCTestExpectation?
    var confirmPasswordDidEndOnExitExpectation:XCTestExpectation?
    var emailAddressDidEndOnExitExpectation:XCTestExpectation?
    var userNameUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var emailAddressUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var passwordUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var confirmPasswordUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var signupExpectation:(XCTestExpectation, expectedUserName:String, expectedPassword:String, expectedEmailAddress:String)?

    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func userNameDidEndOnExit() {
        userNameDidEndOnExitExpectation?.fulfill()
    }
    
    override func passwordDidEndOnExit() {
        passwordDidEndOnExitExpectation?.fulfill()
    }
    
    override func confirmPasswordDidEndOnExit() {
        confirmPasswordDidEndOnExitExpectation?.fulfill()
    }
    
    override func emailAddressDidEndOnExit() {
        emailAddressDidEndOnExitExpectation?.fulfill()
    }
    
    override func userNameUpdated(_ value:String?) {
        if let (expectation, expectedValue) = self.userNameUpdatedExpectation,
            let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func emailAddressUpdated(_ value:String?) {
        if let (expectation, expectedValue) = self.emailAddressUpdatedExpectation,
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
    
    override func confirmPasswordUpdated(_ value:String?) {
        if let (expectation, expectedValue) = self.confirmPasswordUpdatedExpectation,
            let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func signup(userName:String?, password:String?, emailAddress:String?) {
        
        if let (expectation, expectedUserName, expectedPassword, expectedEmailAddress) = self.signupExpectation,
            let userName = userName,
            let password = password,
            let emailAddress = emailAddress {
            if ((userName.compare(expectedUserName) == .orderedSame) &&
                (password.compare(expectedPassword) == .orderedSame) &&
                (emailAddress.compare(expectedEmailAddress) == .orderedSame)) {
                
                expectation.fulfill()
            }
        }
    }
    
}
