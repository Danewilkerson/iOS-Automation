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
