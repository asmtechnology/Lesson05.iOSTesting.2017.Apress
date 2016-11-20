//
//  UserNameValidatorTests.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 16/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class UserNameValidatorTests: XCTestCase {
    
    fileprivate let emptyString = ""
    
    fileprivate let singleCharacterName = "a"
    fileprivate let twoCharacterName = "ab"
    fileprivate let tenCharacterName = "abcdefghij"
    fileprivate let elevenCharacterName = "abcdefghijk"
    
    fileprivate let nameWithWhitespace = "abc def"
    fileprivate let nameWithUnderscore = "abc_def"
    
    fileprivate let nameWithDigit0 = "abc00"
    fileprivate let nameWithDigit1 = "abc11"
    fileprivate let nameWithDigit2 = "abc22"
    fileprivate let nameWithDigit3 = "abc33"
    fileprivate let nameWithDigit4 = "abc44"
    fileprivate let nameWithDigit5 = "abc55"
    fileprivate let nameWithDigit6 = "abc66"
    fileprivate let nameWithDigit7 = "abc77"
    fileprivate let nameWithDigit8 = "abc88"
    fileprivate let nameWithDigit9 = "abc99"
    
    fileprivate let nameWithUnsupportedSpecialCharacters1 = "+-.,!@#$%"
    fileprivate let nameWithUnsupportedSpecialCharacters2 = "^&*();\\/|"
    fileprivate let nameWithUnsupportedSpecialCharacters3 = "<>\""

    fileprivate let nameWithAlphabets1 = "ABCDEFGH"
    fileprivate let nameWithAlphabets2 = "IJKLMNOP"
    fileprivate let nameWithAlphabets3 = "QRSTUVWX"
    fileprivate let nameWithAlphabets4 = "YYYYZZZZ"
    fileprivate let nameWithAlphabets5 = "abcdefgh"
    fileprivate let nameWithAlphabets6 = "ijklmnop"
    fileprivate let nameWithAlphabets7 = "qrstuvwx"
    fileprivate let nameWithAlphabets8 = "yyyyzzzz"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
}



// MARK: Empty string validation
extension UserNameValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: whitespace validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithWhitespace_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(validator.validate(nameWithWhitespace), "string can not be have whitespace.")
    }
    
}

// MARK: underscore validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithUnderscore_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithUnderscore), "/(nameWithUnderscore) should have been valid.")
    }
    
}

// MARK: String length validation
extension UserNameValidatorTests {
    
    func testValidate_InputLessThanTwoCharachtersInLength_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(validator.validate(singleCharacterName), "/(twoCharacterName) should not have been valid.")
    }
    
    func testValidate_InputGreaterThanTwentyCharachtersInLength_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(validator.validate(elevenCharacterName), "/(twoCharacterName) should not have been valid.")
    }
    
    func testValidate_InputTwoCharachtersInLength_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(twoCharacterName), "/(twoCharacterName) should have been valid.")
    }
    
    func testValidate_InputTwentyCharachtersInLength_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(tenCharacterName), "/(tenCharacterName) should have been valid.")
    }
}

// MARK: special character validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithSpecialCharacters1_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(validator.validate(nameWithUnsupportedSpecialCharacters1), "/(nameWithUnsupportedSpecialCharacters1) should not have been valid.")
    }

    func testValidate_StringWithSpecialCharacters2_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(validator.validate(nameWithUnsupportedSpecialCharacters2), "/(nameWithUnsupportedSpecialCharacters2) should not have been valid.")
    }
    
    func testValidate_StringWithSpecialCharacters3_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(validator.validate(nameWithUnsupportedSpecialCharacters3), "/(nameWithUnsupportedSpecialCharacters3) should not have been valid.")
    }
}


// MARK: alphanumeric validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithAlphanumericCharacters1_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets1), "/(nameWithAlphabets1) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters2_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets2), "/(nameWithAlphabets2) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters3_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets3), "/(nameWithAlphabets3) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters4_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets4), "/(nameWithAlphabets4) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters5_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets5), "/(nameWithAlphabets5) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters6_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets6), "/(nameWithAlphabets6) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters7_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets7), "/(nameWithAlphabets7) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters8_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithAlphabets8), "/(nameWithAlphabets8) should have been valid.")
    }
}


// MARK: Numeric validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithDigit0_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit0), "/(nameWithDigit0) should have been valid.")
    }
    
    func testValidate_StringWithDigit1_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit1), "/(nameWithDigit1) should have been valid.")
    }
    
    func testValidate_StringWithDigit2_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit2), "/(nameWithDigit2) should have been valid.")
    }
    
    func testValidate_StringWithDigit3_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit3), "/(nameWithDigit3) should have been valid.")
    }
    
    func testValidate_StringWithDigit4_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit4), "/(nameWithDigit4) should have been valid.")
    }
    
    func testValidate_StringWithDigit5_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit5), "/(nameWithDigit5) should have been valid.")
    }
    
    func testValidate_StringWithDigit6_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit6), "/(nameWithDigit6) should have been valid.")
    }
    
    func testValidate_StringWithDigit7_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit7), "/(nameWithDigit7) should have been valid.")
    }
    
    func testValidate_StringWithDigit8_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit8), "/(nameWithDigit8) should have been valid.")
    }
    
    func testValidate_StringWithDigit9_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(validator.validate(nameWithDigit9), "/(nameWithDigit9) should have been valid.")
    }
    
    
}

