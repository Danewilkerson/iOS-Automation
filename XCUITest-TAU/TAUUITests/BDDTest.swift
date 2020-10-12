//
//  BBDTest.swift
//  TAUUITests
//
//  Created by Dane Wilkerson on 10/11/20.
//

import Foundation
import XCTest

class BDDTest: TAUUITestBase {
    
    func testThankYouMessageBDD() {
        givenAppIsReady()
        whenIEnter(city: "London")
        whenIEnrolled()
        thenIShouldSeeThankYouMessage()
    }
}

extension TAUUITestBase {
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App is Ready") { _  in
        XCTAssertTrue(app.buttons["enrollButton"].exists)
        }
    }
    func whenIEnter(city: String) {
        XCTContext.runActivity(named: "When I enter \(city)") { _  in
        app.textFields["city"].tap()
        app.textFields["city"].typeText(city)
        }
        
    }
    func whenIEnrolled() {
        XCTContext.runActivity(named: "When I Enrolled") { _  in
        app.buttons["Enroll"].tap()
        }
    }
    func thenIShouldSeeThankYouMessage() {
        XCTContext.runActivity(named: "Then I should see a Thanks Message") { _  in
        XCTAssertTrue(app.staticTexts["Thanks for Joining!"].exists)
        }
    }
}
