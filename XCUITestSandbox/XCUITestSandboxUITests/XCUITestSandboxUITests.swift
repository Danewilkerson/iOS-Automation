//  Created by Dane Wilkerson on 10/4/20.

import XCTest

class XCUITestSandboxUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        app.activate()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    
    func testLabelCopiesTextField() {
        let app = XCUIApplication()
        app.activate()
        app.textFields.element.tap()

        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        app.keyboards.buttons["Return"].tap()
        XCTAssertTrue(app.staticTexts["test"].exists)
    }
    
    
    func testButtonsShowAlerts() {
        let app = XCUIApplication()
        app.buttons["Blue"].tap()
        XCTAssertTrue(app.alerts["Blue"].exists)
        app.alerts["Blue"].buttons["OK"].tap()
    }
    

    func testSliderControlsProgress() {
        let app = XCUIApplication()
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: 1)

        guard let completion = app.progressIndicators.element.value as? String else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(completion == "0%")
    }
    
    func testSegmentSelections() {
        let app = XCUIApplication()
        app.segmentedControls.buttons["Omega"].tap()
        app.segmentedControls.buttons["Alpha"].tap()
    }

}
