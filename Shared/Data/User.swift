//
//  User.swift
//  WorkExperience
//
//  Created by Rahala, Jasamrit (Coll) on 04/11/2021.
//

import Foundation

// User class
class User{
    let id: UUID
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String){
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
    }
}

// Student class
class Student: User{
    override init(firstName: String, lastName: String){
        super.init(firstName: firstName, lastName: lastName)
    }
}

// Employee class
class Employee: User{
    var placements: [Placement] = []
    
    override init(firstName: String, lastName: String){
        super.init(firstName: firstName, lastName: lastName)
    }
    
    // Create, append, return new placement (given title, description) to self.placements array
    func createNewPlacement(title: String, description: String) -> Placement{
        let newPlacement = Placement(title: title, description: description, author: self)
        self.placements.append(newPlacement)
        return newPlacement
    }
}

// Teacher class
class Teacher: User{
    override init(firstName: String, lastName: String){
        super.init(firstName: firstName, lastName: lastName)
    }
}


