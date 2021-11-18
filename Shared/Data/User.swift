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
    var placements: [Placement]
    
    override init(firstName: String, lastName: String){
        self.placements = [Placement]()
        super.init(firstName: firstName, lastName: lastName)
    }
    
    // Create and append placement (given title, description) to self.placements array (returns placement)
    func createNewPlacement(title: String, description: String) -> Placement{
        let newPlacement = Placement(title: title, description: description, author: self)
        self.placements.append(newPlacement)
        return newPlacement
    }
    
    // Edit existing placement, given placement, title? and description? (returns placement)
    func editPlacement(placement: Placement, titleChange: String?, descriptionChange: String?) -> Placement{
        if (titleChange != nil){ placement.title = titleChange! }
        if (descriptionChange != nil){ placement.description = descriptionChange! }
        return placement
    }
    
    // returns True if placement exists in placements array and is deleted, else returns False
    func deletePlacement(placement: Placement) -> Bool{
        var index: Int = 0
        while (index < self.placements.count){
            if (self.placements[index] === placement){
                self.placements.remove(at: index)
                return true
            }
            index += 1
        }
        return false
    }
    

}

// Teacher class
class Teacher: User{
    override init(firstName: String, lastName: String){
        super.init(firstName: firstName, lastName: lastName)
    }
}
