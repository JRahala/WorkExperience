//
//  User.swift
//  WorkExperience
//
//  Created by Rahala, Jasamrit (Coll) on 04/11/2021.
//

import Foundation

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



