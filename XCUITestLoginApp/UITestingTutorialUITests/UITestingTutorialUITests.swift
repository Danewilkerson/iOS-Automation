//  Created by Dane Wilkerson on 10/4/20.

import XCTest

class UITestingTutorialUITests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
        super.setUp()
    }

    override func tearDown() {
        XCUIApplication().terminate()
        super.tearDown()
    }
    
    
    func testInvalidLogin_progressSpinnerIsHidden() {
        
        let app = XCUIApplication()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.buttons["Login"].tap()
        app.alerts["Missing Credentials"].buttons["Ok"].tap()
        
        let activitySpinner = app.activityIndicators["In progress"]
        XCTAssertFalse(activitySpinner.exists)
    }
    
    
    func testInvvalidLogin_missingCredentialsAlertIsShown() {
        
        let app = XCUIApplication()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.textFields["Username"].tap()
        app.secureTextFields["Password"].tap()
        app.buttons["Login"].tap()
        
        let alertDialog = app.alerts["Missing Credentials"]
        XCTAssertTrue(alertDialog.exists)
        
        alertDialog.buttons["Ok"].tap()
    }

    
    func testValidLoginSuccess() {
        
        let validPassword = "abc123"
        let validUsername = "CodePro"
        
        let app = XCUIApplication()
        
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        
        let usernameTextField = app.textFields["Username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validUsername)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
        
        app.buttons["Login"].tap()
        
        let myDownloads = app.tables/*@START_MENU_TOKEN@*/.staticTexts["My Downloads"]/*[[".cells.staticTexts[\"My Downloads\"]",".staticTexts[\"My Downloads\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: myDownloads, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(myDownloads.exists)
    }
}
