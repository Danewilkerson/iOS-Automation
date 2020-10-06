//
//  Student.swift
//  iOS-Unit-Testing
//
//  Created by Dane Wilkerson on 10/5/20.
//  Copyright © 2020 Dane Wilkerson. All rights reserved.
//

import Foundation

class Student {
    
    private let firstName: String
    private let lastName: String
    
    var friends: [Student] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func addFriend(friend: Student) {
        friends.append(friend)
    }
    
    func validFirstName() -> Bool {
        return firstName.count > 3 && firstName.count < 16
    }
    
    func validLastName() -> Bool {
        return lastName.count > 3 && lastName.count < 16
    }

}
