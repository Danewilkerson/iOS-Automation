import Foundation
import XCTest

extension TAUUITestBase {

    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App is Ready") { _  in
            XCTAssertTrue(TAUScreen.enrollButton.element.exists)
        }
    }

    func whenIEnterCity(city: String) {
        XCTContext.runActivity(named: "When I enter \(city)") { _  in
            TAUScreen.cityTextField.element.tap()
            TAUScreen.cityTextField.element.typeText(city)
        }
    }

    func whenITapEnrollButton() {
        XCTContext.runActivity(named: "When I Tap the Enroll Button") { _  in
            TAUScreen.enrollButton.element.tap()
        }
    }

    func thenIShouldSeeThankYouMessage() {
        XCTContext.runActivity(named: "Then I should see a Thanks Message") { _  in
            XCTAssertElementExist(TAUScreen.welcomeMessage.element)
        }
    }
}
