//
//  User.swift
//  WorkExperience
//
//  Created by Rahala, Jasamrit (Coll) on 04/11/2021.
//

import Foundation

// User class
class User: Equatable, Hashable{
    let id: UUID
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String){
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(self.id)
    }
    
    static func ==(lhs: User, rhs: User) -> Bool{
        return lhs.id == rhs.id
    }

}


// Student class
class Student: User{
    var following: Set<Employee>
    
    override init(firstName: String, lastName: String){
        self.following = Set<Employee>()
        super.init(firstName: firstName, lastName: lastName)
    }
    
    // insert / remove employee from following set
    func toggleFollowingEmployee(employee: Employee){
        if (self.following.contains(employee)){
            self.following.remove(employee)
            employee.followers.remove(self)
        } else {
            self.following.insert(employee)
            employee.followers.insert(self)
        }
    }
    
    // toggle interest in a placement
    func toggleInterestPlacement(placement: Placement){
        if (placement.interestedStudents.contains(self)){
            placement.interestedStudents.remove(self)
        } else {
            placement.interestedStudents.insert(self)
        }
    }
    
}

// Employee class
class Employee: User{
    var placements: [Placement]
    var followers: Set<Student> // set of followers, so that notifications can be dispatched to all followers
    
    override init(firstName: String, lastName: String){
        self.placements = [Placement]()
        self.followers = Set<Student>()
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
    var classes: [String: Set<Student>]
    
    override init(firstName: String, lastName: String){
        self.classes = [String: Set<Student>]()
        super.init(firstName: firstName, lastName: lastName)
    }
    
    // generate a class, returns false if class is already used
    func generateClass(className: String, classStudents: Set<Student>) -> Bool{
        if (self.classes.keys.contains(className)){
            return false
        }
        self.classes[className] = classStudents
        return true
    }
    
    // delete a class
    func deleteClass(className: String){
        self.classes[className] = nil
    }
    
    // toggle student in / out class set
    func toggleStudentClass(className: String, classStudent: Student){
        if (self.classes[className]!.contains(classStudent)){
            self.classes[className]!.insert(classStudent)
        } else {
            self.classes[className]!.remove(classStudent)
        }
    }
    
    
}
