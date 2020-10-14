import Foundation
import XCTest

class BDDTest: TAUUITestBase {
    
    func testThankYouMessageBDD() {
        givenAppIsReady()
        whenIEnterCity(city: "London")
        whenITapEnrollButton()
        thenIShouldSeeThankYouMessage()
    }
}
