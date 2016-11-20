//
//  LoginModelTests.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 11/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class LoginModelTests: XCTestCase {
    
    private let validDummyUserName:String = "username"
    private let validDummyPassword:String = "Aryb4N79"
    private let inValidDummyUserName:String = "u%"
    private let inValidDummyPassword:String = "abc"
    private let emptyDummyUserName:String = ""
    private let emptyDummyPassword:String = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginModel_ValidUserName_ValidPassword_CanBeInstantiated() {
        let loginModel = LoginModel(userName:validDummyUserName, password:validDummyPassword)
        XCTAssertNotNil(loginModel)
    }
    
    func testLoginModel_ValidUserName_InvalidPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:validDummyUserName, password:inValidDummyPassword)
        XCTAssertNil(loginModel)
    }
    
    func testLoginModel_InvallidUserName_ValidPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:inValidDummyUserName, password:validDummyPassword)
        XCTAssertNil(loginModel)
    }
    
    func testLoginModel_InvalidUserName_InvalidPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:inValidDummyUserName, password:inValidDummyPassword)
        XCTAssertNil(loginModel)
    }
    
    func testLoginModel_EmptyUserName_ValidPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:emptyDummyUserName, password:validDummyPassword)
        XCTAssertNil(loginModel)
    }
    
    func testLoginModel_EmptyUserName_InvalidPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:emptyDummyUserName, password:inValidDummyPassword)
        XCTAssertNil(loginModel)
    }
    
    func testLoginModel_EmptyUserName_EmptyPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:emptyDummyUserName, password:emptyDummyPassword)
        XCTAssertNil(loginModel)
    }
    
    func testLoginModel_ValidUserName_EmptyPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:validDummyUserName, password:emptyDummyPassword)
        XCTAssertNil(loginModel)
    }
    
    func testLoginModel_InvalidUserName_EmptyPassword_CanNotBeInstantiated() {
        let loginModel = LoginModel(userName:inValidDummyUserName, password:emptyDummyPassword)
        XCTAssertNil(loginModel)
    }
    
}
