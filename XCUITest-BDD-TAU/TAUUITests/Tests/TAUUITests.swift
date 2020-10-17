import Foundation
import XCTest

class TAUUITests: TAUUITestBase {
    // pom style
    func testAllElementsOfMainScreen() {
        TAUScreen.welcomeMessage.element.tap()
        TAUScreen.enterCityLabel.element.tap()
        TAUScreen.enrollButton.element.tap()
        TAUScreen.taulogo.element.tap()
        XCTAssertTrue(TAUScreen.enterCityLabel.element.exists)
    }
    
    func testThankYouMessage() {
        TAUScreen.cityTextField.element.tap()
        TAUScreen.cityTextField.element.typeText("Daneville")
        TAUScreen.enrollButton.element.tap()
        XCTAssertTrue(TAUScreen.welcomeMessage.element.exists)
    }
    
    // manual style
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
