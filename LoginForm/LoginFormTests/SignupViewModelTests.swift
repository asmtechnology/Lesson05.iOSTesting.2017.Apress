//
//  SignupViewModelTests.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 28/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class SignupViewModelTests: XCTestCase {
    
    fileprivate var mockSignupViewController : MockSignupViewController?
    
    fileprivate var validUserName = "abcdefghij"
    fileprivate var invalidUserName = "a"
    
    fileprivate let validPassword = "D%io7AFn9Y"
    fileprivate let validPassword2 = "B%un9AG91A"
    fileprivate let invalidPassword = "a3$Am"
    
    fileprivate let validEmailAddress = "a@b.com"
    
    override func setUp() {
        super.setUp()
        mockSignupViewController = MockSignupViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}


// MARK: initialization tests
extension SignupViewModelTests {
        
    func testInit_ValidView_InstantiatesObject() {
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidView_CopiesViewToIvar() {
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        
        if let lhs = mockSignupViewController, let rhs = viewModel.view as? MockSignupViewController {
            XCTAssertTrue(lhs === rhs)
        }
    }
}


// MARK: performInitialViewSetup tests
extension SignupViewModelTests {
    
    func testPerformInitialViewSetup_Calls_ClearUserNameField_OnViewController() {
        let expectation = self.expectation(description: "expected clearUserNameField() to be called")
        mockSignupViewController!.expectationForClearUserNameField = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_Calls_ClearPasswordField_OnViewController() {
        let expectation = self.expectation(description: "expected clearPasswordField() to be called")
        mockSignupViewController!.expectationForClearPasswordField = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_Calls_ClearConfirmPasswordField_OnViewController() {
        let expectation = self.expectation(description: "expected clearConfirmPasswordField() to be called")
        mockSignupViewController!.expectationForClearConfirmPasswordField = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testPerformInitialViewSetup_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_EnablesCancelButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCancelButton(true) to be called")
        mockSignupViewController!.expectationForEnableCancelButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


// MARK: userNameDidEndOnExit tests
extension SignupViewModelTests {
    
    func testUserNameDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockSignupViewController!.expectationForHideKeyboard = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameDidEndOnExit()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}

// MARK: passwordDidEndOnExit tests
extension SignupViewModelTests {
    
    func testPasswordDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockSignupViewController!.expectationForHideKeyboard = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.passwordDidEndOnExit()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


// MARK: confirmPasswordDidEndOnExit tests
extension SignupViewModelTests {
    
    func testConfirmPasswordDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockSignupViewController!.expectationForHideKeyboard = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.confirmPasswordDidEndOnExit()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}

// MARK: userNameUpdated tests
extension SignupViewModelTests {
    
    func testUserNameUpdated_Calls_Validate_OnUserNameValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidator = MockUserNameValidator(expectation, expectedValue: validUserName)
        
        viewModel.userNameUpdated(validUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_ValidUserName_PasswordsValidatedAndEqual_EnablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(true) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = true
        viewModel.userNameUpdated(validUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_ValidUserName_PasswordsValidatedButNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = false
        viewModel.userNameUpdated(validUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testUserNameUpdated_ValidUserName_Password1NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = false
        
        viewModel.userNameUpdated(validUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_ValidUserName_Password2NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        
        viewModel.userNameUpdated(validUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testUserNameUpdated_InvalidUserName_PasswordsValidatedAndEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = true
        
        viewModel.userNameUpdated(invalidUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_InvalidUserName_PasswordsValidatedButNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = false
        
        viewModel.userNameUpdated(invalidUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testUserNameUpdated_InvalidUserName_Password1NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = false
        
        viewModel.userNameUpdated(invalidUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_InvalidUserName_Password2NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        
        viewModel.userNameUpdated(invalidUserName)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

}


// MARK: passwordUpdated tests
extension SignupViewModelTests {
    
    func testPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_Passwords2Validated_PasswordsEqual_UserNameValidated_EnablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(true) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password2Validated = true
        viewModel.password2 = validPassword
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_Passwords2Validated_PasswordsNotEqual_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password2Validated = true
        viewModel.password2 = validPassword2
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testPasswordUpdated_ValidPassword_Passwords2NotValidated_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password2Validated = false
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testPasswordUpdated_ValidPassword_Passwords2Validated_PasswordsEqual_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = false
        viewModel.password2Validated = true
        viewModel.password2 = validPassword
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_Passwords2Validated_PasswordsNotEqual_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password2Validated = true
        viewModel.password2 = validPassword2
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func testPasswordUpdated_ValidPassword_Passwords2NotValidated_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = false
        viewModel.password2Validated = false
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}



// MARK: confirmPasswordUpdated tests
extension SignupViewModelTests {
    
    func testConfirmPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_ValidPassword_Passwords1Validated_PasswordsEqual_UserNameValidated_EnablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(true) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password1Validated = true
        viewModel.password1 = validPassword
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_ValidPassword_Passwords1Validated_PasswordsNotEqual_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password1Validated = true
        viewModel.password1 = validPassword2
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testConfirmPasswordUpdated_ValidPassword_Passwords1NotValidated_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password1Validated = false
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testConfirmPasswordUpdated_ValidPassword_Passwords1Validated_PasswordsEqual_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = false
        viewModel.password1Validated = true
        viewModel.password1 = validPassword
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_ValidPassword_Passwords1Validated_PasswordsNotEqual_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = true
        viewModel.password1Validated = true
        viewModel.password1 = validPassword2
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testConfirmPasswordUpdated_ValidPassword_Passwords1NotValidated_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.userNameValidated = false
        viewModel.password1Validated = false
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}


// MARK: signup tests
extension SignupViewModelTests {
    
    func testSignup_ValidParameters_Calls_doSignup_OnLoginController() {
        let expectation = self.expectation(description: "expected doSignup() to be called")
        
        let mockSignupController = MockSignupController(expectation,
                                                        expectedUserName:validUserName,
                                                        expectedPassword:validPassword,
                                                        expectedEmailAddress:validEmailAddress)
        mockSignupController.shouldReturnTrueOnSignup = true
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.signupController = mockSignupController
        mockSignupController.signupControllerDelegate = viewModel
        
        viewModel.signup(userName: validUserName, password: validPassword, emailAddress:validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testSignup_ValidParameters_Calls_doSignupWithExpectedUserName_OnLoginController() {
        let expectation = self.expectation(description: "expected doSignup() to be called")
        
        let mockSignupController = MockSignupController(expectation,
                                                        expectedUserName:validUserName,
                                                        expectedPassword:validPassword,
                                                        expectedEmailAddress:validEmailAddress)
        mockSignupController.shouldReturnTrueOnSignup = true
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.signupController = mockSignupController
        mockSignupController.signupControllerDelegate = viewModel
        
        viewModel.signup(userName: validUserName, password: validPassword, emailAddress:validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testSignup_ValidParameters_Calls_doSignupWithExpectedPassword_OnLoginController() {
        let expectation = self.expectation(description: "expected doSignup() to be called")
        
        let mockSignupController = MockSignupController(expectation,
                                                        expectedUserName:validUserName,
                                                        expectedPassword:validPassword,
                                                        expectedEmailAddress:validEmailAddress)
        mockSignupController.shouldReturnTrueOnSignup = true
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.signupController = mockSignupController
        mockSignupController.signupControllerDelegate = viewModel
        
        viewModel.signup(userName: validUserName, password: validPassword, emailAddress:validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testSignup_ValidParameters_Calls_doSignupWithExpectedEmailAddress_OnLoginController() {
        let expectation = self.expectation(description: "expected doSignup() to be called")
        
        let mockSignupController = MockSignupController(expectation,
                                                        expectedUserName:validUserName,
                                                        expectedPassword:validPassword,
                                                        expectedEmailAddress:validEmailAddress)
        mockSignupController.shouldReturnTrueOnSignup = true
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.signupController = mockSignupController
        mockSignupController.signupControllerDelegate = viewModel
        
        viewModel.signup(userName: validUserName, password: validPassword, emailAddress:validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

