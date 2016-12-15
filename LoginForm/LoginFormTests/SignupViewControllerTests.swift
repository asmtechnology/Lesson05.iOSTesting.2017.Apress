//
//  SignupViewControllerTests.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 15/12/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import XCTest

class SignupViewControllerTests: XCTestCase {
    
    fileprivate let validUserName = "abcdefghij"
    fileprivate let validPassword = "D%io7AFn9Y"
    fileprivate let validEmailAddress = "amishra@asmtechnology.com"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewDidLoad_Calls_PerformInitialSetup_OnViewModel() {
        
        let expectation = self.expectation(description: "expected performInitialViewSetup() to be called")
        
        let signupViewController = SignupViewController()
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.performInitialViewSetupExpectation = expectation
        
        signupViewController.viewModel = viewModel
        
        signupViewController.viewDidLoad()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameDidEndOnExit_Calls_UserNameDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected userNameDidEndOnExit() to be called")
        
        let signupViewController = SignupViewController()
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.userNameDidEndOnExitExpectation = expectation
        
        signupViewController.viewModel = viewModel
        
        signupViewController.userNameDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailAddressDidEndOnExit_Calls_EmailAddressDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected emailAddressDidEndOnExit() to be called")
        
        let signupViewController = SignupViewController()
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.emailAddressDidEndOnExitExpectation = expectation
        
        signupViewController.viewModel = viewModel
        
        signupViewController.emailAddressDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testPasswordDidEndOnExit_Calls_PasswordDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected passwordDidEndOnExit() to be called")
        
        let signupViewController = SignupViewController()
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.passwordDidEndOnExitExpectation = expectation
        
        signupViewController.viewModel = viewModel
        
        signupViewController.passwordDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordDidEndOnExit_Calls_ConfirmPasswordDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected confirmPasswordDidEndOnExit() to be called")
        
        let signupViewController = SignupViewController()
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.confirmPasswordDidEndOnExitExpectation = expectation
        
        signupViewController.viewModel = viewModel
        
        signupViewController.confirmPasswordDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testTextFieldShouldChangeCharacters_userNameTextField_Calls_UserNameUpdated_OnViewModel_WithExpectedUsername() {
        
        let expectation = self.expectation(description: "expected userNameUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)
        
        let signupViewController = SignupViewController()
        signupViewController.userNameTextField = userNameTextFieldStub
        signupViewController.passwordTextField = passwordTextFieldStub
        signupViewController.confirmPasswordTextField = confirmPasswordTextFieldStub
        signupViewController.emailAddressTextField = emailAddressTextFieldStub
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.userNameUpdatedExpectation = (expectation, expectedValue:validUserName)
        
        signupViewController.viewModel = viewModel
        
        let _ = signupViewController.textField(userNameTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testTextFieldShouldChangeCharacters_passwordTextField_Calls_PasswordUpdated_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected passwordUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)
        
        let signupViewController = SignupViewController()
        signupViewController.userNameTextField = userNameTextFieldStub
        signupViewController.passwordTextField = passwordTextFieldStub
        signupViewController.confirmPasswordTextField = confirmPasswordTextFieldStub
        signupViewController.emailAddressTextField = emailAddressTextFieldStub
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.passwordUpdatedExpectation = (expectation, expectedValue:validPassword)
        
        signupViewController.viewModel = viewModel
        
        let _ = signupViewController.textField(passwordTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    
    func testTextFieldShouldChangeCharacters_confirmPasswordTextField_Calls_ConfirmPasswordUpdated_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected confirmPasswordUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)
        
        let signupViewController = SignupViewController()
        signupViewController.userNameTextField = userNameTextFieldStub
        signupViewController.passwordTextField = passwordTextFieldStub
        signupViewController.confirmPasswordTextField = confirmPasswordTextFieldStub
        signupViewController.emailAddressTextField = emailAddressTextFieldStub
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.confirmPasswordUpdatedExpectation = (expectation, expectedValue:validPassword)
    
        signupViewController.viewModel = viewModel
        
        let _ = signupViewController.textField(confirmPasswordTextFieldStub,
                                               shouldChangeCharactersIn: NSMakeRange(0, 1),
                                               replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    
    func testTextFieldShouldChangeCharacters_emailAddressTextField_Calls_EmailAddressUpdated_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected emailAddressUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)
        
        let signupViewController = SignupViewController()
        signupViewController.userNameTextField = userNameTextFieldStub
        signupViewController.passwordTextField = passwordTextFieldStub
        signupViewController.confirmPasswordTextField = confirmPasswordTextFieldStub
        signupViewController.emailAddressTextField = emailAddressTextFieldStub
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.emailAddressUpdatedExpectation = (expectation, expectedValue:validEmailAddress)
        
        signupViewController.viewModel = viewModel
        
        let _ = signupViewController.textField(emailAddressTextFieldStub,
                                               shouldChangeCharactersIn: NSMakeRange(0, 1),
                                               replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testCreate_ValidUserNamePasswordEmailAddress_Calls_Signup_OnViewModel_WithExpectedUserName() {
        
        let expectation = self.expectation(description: "expected signup() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:"")
        let confirmPasswordTextFieldStub = UITextFieldStub(text:"")
        let emailAddressTextFieldStub = UITextFieldStub(text:"")
        
        let signupViewController = SignupViewController()
        signupViewController.userNameTextField = userNameTextFieldStub
        signupViewController.passwordTextField = passwordTextFieldStub
        signupViewController.confirmPasswordTextField = confirmPasswordTextFieldStub
        signupViewController.emailAddressTextField = emailAddressTextFieldStub
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.signupExpectation = (expectation, expectedUserName:validUserName, expectedPassword:"", expectedEmailAddress:"")
        
        signupViewController.viewModel = viewModel
        
        signupViewController.create(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testCreate_ValidUserNamePasswordEmailAddress_Calls_Signup_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected signup() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:"")
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:"")
        
        let signupViewController = SignupViewController()
        signupViewController.userNameTextField = userNameTextFieldStub
        signupViewController.passwordTextField = passwordTextFieldStub
        signupViewController.confirmPasswordTextField = confirmPasswordTextFieldStub
        signupViewController.emailAddressTextField = emailAddressTextFieldStub
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.signupExpectation = (expectation, expectedUserName:"", expectedPassword:validPassword, expectedEmailAddress:"")
        
        signupViewController.viewModel = viewModel
        
        signupViewController.create(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testCreate_ValidUserNamePasswordEmailAddress_Calls_Signup_OnViewModel_WithExpectedEmailAddress() {
        
        let expectation = self.expectation(description: "expected signup() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:"")
        let passwordTextFieldStub = UITextFieldStub(text:"")
        let confirmPasswordTextFieldStub = UITextFieldStub(text:"")
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)
        
        let signupViewController = SignupViewController()
        signupViewController.userNameTextField = userNameTextFieldStub
        signupViewController.passwordTextField = passwordTextFieldStub
        signupViewController.confirmPasswordTextField = confirmPasswordTextFieldStub
        signupViewController.emailAddressTextField = emailAddressTextFieldStub
        
        let viewModel = MockSignupViewModel(view:signupViewController)
        viewModel.signupExpectation = (expectation, expectedUserName:"", expectedPassword:"", expectedEmailAddress:validEmailAddress)
        
        signupViewController.viewModel = viewModel
        
        signupViewController.create(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    
    
}
