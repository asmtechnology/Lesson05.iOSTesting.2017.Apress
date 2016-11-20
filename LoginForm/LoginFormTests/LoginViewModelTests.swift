//
//  LoginViewModelTests.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 20/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class LoginViewModelTests: XCTestCase {
    
    fileprivate var mockLoginViewController:MockLoginViewController?
    
    override func setUp() {
        super.setUp()
        mockLoginViewController = MockLoginViewController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: initialization tests
extension LoginViewModelTests {
    
    func testInit_ValidView_InstantiatesObject() {
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidView_CopiesViewToIvar() {
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        
        if let lhs = mockLoginViewController, let rhs = viewModel.view as? MockLoginViewController {
            XCTAssertTrue(lhs === rhs)
        }
    }
}
