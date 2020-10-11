//
//  TAUUITestBase.swift
//  TAUUITests
//
//  Created by Dane Wilkerson on 10/11/20.
//

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
    
    
}
