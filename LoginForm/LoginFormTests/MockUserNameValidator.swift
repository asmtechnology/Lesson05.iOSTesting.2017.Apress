//
//  MockUserNameValidator.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 16/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation
import XCTest

class MockUserNameValidator: UserNameValidator {

    private var expectation:XCTestExpectation?
    private var expectedValue:String?
    
    init(_ expectation:XCTestExpectation, expectedValue:String) {
        self.expectation = expectation
        self.expectedValue = expectedValue
        super.init()
    }
    
    override func validate(_ value:String) -> Bool {
        
        if let expectation = self.expectation,
            let expectedValue = self.expectedValue {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        return super.validate(value)
    }

    
}
