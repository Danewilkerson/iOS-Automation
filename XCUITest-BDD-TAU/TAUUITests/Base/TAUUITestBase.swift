import Foundation
import XCTest

class TAUUITestBase: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()

    }

    override func tearDown() {
        super.tearDown()

    }
    
    func XCTAssertElementExist(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 10)
        if isElementExist {
            XCTAssertTrue(element.exists)
        }
    }
    
    func XCTAssertElementEnabled(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 10)
        if isElementExist {
            XCTAssertTrue(element.isEnabled)
        }
    }
    
    func XCTAssertElementSelected(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 10)
        if isElementExist {
            XCTAssertTrue(element.isSelected)
        }
    }
    
    func XCTAssertElementHittable(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 10)
        if isElementExist {
            XCTAssertTrue(element.isHittable)
        }
    }
}
