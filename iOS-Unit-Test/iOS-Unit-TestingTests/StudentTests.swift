//
//  StudentTests.swift
//  iOS-Unit-TestingTests
//
//  Created by Dane Wilkerson on 10/5/20.
//  Copyright © 2020 Dane Wilkerson. All rights reserved.
//

import Foundation
import XCTest

@testable import iOS_Unit_Testing

class StudentTests: XCTestCase {
    
    func testValidFirstName() {
        
        let student = Student(firstName: "Validfname", lastName: "Validlname")
        XCTAssertTrue(student.validFirstName())
        
        let student2 = Student(firstName: "this_is_an_invalid_fname", lastName: "Validlname")
        XCTAssertFalse(student2.validFirstName())
        
        let student3 = Student(firstName: "X", lastName: "Validlname")
        XCTAssertFalse(student3.validFirstName())
        
    }
    
    func testValidLastName() {
        
        let student = Student(firstName: "Validfname", lastName: "Validlname")
        XCTAssertTrue(student.validLastName())
        
        let student2 = Student(firstName: "Validfname", lastName: "this_is_an_invalid_lname")
        XCTAssertFalse(student2.validLastName())
        
        let student3 = Student(firstName: "Validfname", lastName: "X")
        XCTAssertFalse(student3.validLastName())
            
    }
    
    func testAddFriend() {
        let aj = Student(firstName: "AJ", lastName: "Test")
        let tom = Student(firstName: "Tom", lastName: "TestTwo")
        
        XCTAssertTrue(aj.friends.count == 0)
        
        aj.addFriend(friend: tom)
        
        XCTAssertTrue(aj.friends.count > 0)
        
    }
    
}
