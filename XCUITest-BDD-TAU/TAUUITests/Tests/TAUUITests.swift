import XCTest

class TAUUITests: TAUUITestBase {

    func testAllElementsOfMainScreen() {
        
        app.staticTexts["welcomeMessage"].tap()
        app.staticTexts["enterCity"].tap()
        app.buttons["Enroll"].tap()
        app.images["TAUlogo"].tap()
        XCTAssertTrue(app.staticTexts["Please Enter City"].exists)
    }
    
    func testThankYouMessage() {
        
        app.textFields["city"].tap()
        app.textFields["city"].typeText("London")
        app.buttons["Enroll"].tap()
        XCTAssertTrue(app.staticTexts["Thanks for Joining!"].exists)
    }
    
    func testTwoEnrollOneFail() {
        
        app.textFields["city"].tap()
        app.textFields["city"].typeText("London")
        app.buttons["Enroll"].tap()
        XCTAssertTrue(app.staticTexts["Thanks for Joining!"].exists)
        
        app.textFields["city"].tap()
        app.textFields["city"].typeText("Daneville")
        app.buttons["Enroll"].tap()
        XCTAssertTrue(app.staticTexts["Thanks for Joining!"].exists)
        
        app.textFields["city"].tap()
        app.textFields["city"].typeText("")
        app.buttons["Enroll"].tap()
        XCTAssertTrue(app.staticTexts["Please Enter City"].exists)
    }
    
    
    
    
    
    

}
