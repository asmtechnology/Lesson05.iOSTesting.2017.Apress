//
//  PasswordValidatorTests.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 16/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class PasswordValidatorTests: XCTestCase {
    
    fileprivate let emptyString = ""
    
    fileprivate let validPassword1 = "aou4%F"
    fileprivate let validPassword2 = "aou4AF%"
    fileprivate let validPassword3 = "aou4AF%0"
    fileprivate let validPassword4 = "aou4AF%0#"
    fileprivate let validPassword5 = "D%io7AFn9Y"
    
    fileprivate let invalidPassword1 = "a3$Am"
    fileprivate let invalidPassword2 = "abdtmg"
    fileprivate let invalidPassword3 = "ABCDEF"
    fileprivate let invalidPassword4 = "Abdtmg"
    fileprivate let invalidPassword5 = "4bdtmg"
    fileprivate let invalidPassword6 = "4*(A£$9"
    fileprivate let invalidPassword7 = "4bdtmgTYS0A"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}



// MARK: Empty string validation
extension PasswordValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: invalid passwords
extension PasswordValidatorTests {
    
    func testValidate_InputLessThanSixChar_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(invalidPassword1), "/(invalidPassword1) is not a valid password.")
    }
    
    func testValidate_InputSixCharAllLowercase_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(invalidPassword2), "/(invalidPassword2) is not a valid password.")
    }
    
    func testValidate_InputSixCharAllUppercase_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(invalidPassword3), "/(invalidPassword3) is not a valid password")
    }
    
    func testValidate_InputSixChar_WithOneUppercase_NoNumbers_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(invalidPassword4), "/(invalidPassword4) is not a valid password")
    }
    
    func testValidate_InputSixChar_WithOneNumber_NoUppercase_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(invalidPassword5), "/(invalidPassword5) is not a valid password.")
    }
    
    func testValidate_InputSixChar_Nolowercase_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(invalidPassword6), "/(invalidPassword6) is not a valid password.")
    }
    
    func testValidate_InputMoreThanTenChar_ReturnsFalse() {
        let validator = PasswordValidator()
        XCTAssertFalse(validator.validate(invalidPassword7), "/(invalidPassword7) is not a valid password.")
    }
    
}


// MARK: valid passwords
extension PasswordValidatorTests {
    
    func testValidate_InputSixChar_OneUpperCase_OneLowercase_OneNumber_ReturnsTrue() {
        let validator = PasswordValidator()
        XCTAssertTrue(validator.validate(validPassword1), "/(validPassword1) is a valid password.")
    }
    
    func testValidate_InputSevenChar_OneUpperCase_OneLowercase_OneNumber_ReturnsTrue() {
        let validator = PasswordValidator()
        XCTAssertTrue(validator.validate(validPassword2), "/(validPassword2) is a valid password.")
    }
    
    func testValidate_InputEightChar_OneUpperCase_OneLowercase_OneNumber_ReturnsTrue() {
        let validator = PasswordValidator()
        XCTAssertTrue(validator.validate(validPassword3), "/(validPassword3) is a valid password.")
    }
    
    func testValidate_InputNineChar_OneUpperCase_OneLowercase_OneNumber_ReturnsTrue() {
        let validator = PasswordValidator()
        XCTAssertTrue(validator.validate(validPassword4), "/(validPassword4) is a valid password.")
    }
    
    func testValidate_InputTenChar_OneUpperCase_OneLowercase_OneNumber_ReturnsTrue() {
        let validator = PasswordValidator()
        XCTAssertTrue(validator.validate(validPassword5), "/(validPassword5) is a valid password.")
    }
    
}
