//
//  Placement.swift
//  WorkExperience
//
//  Created by Rahala, Jasamrit (Coll) on 04/11/2021.
//

import Foundation

// Placement class
class Placement{
    var title: String
    var description: String
    var author: Employee
    var topics: [Topic]
    
    init(title: String, description: String, author: Employee){
        self.title = title
        self.description = description
        self.author = author
        self.topics = [Topic]()
    }
}

// Date struct
struct Date{
    let day: Int        // 01 = First day
    let month: Int      // 01 = January, 12 = December
    let year: Int       // 00 = 2000
}

// DateRange struct
struct DateRange{
    let startDate: Date
    let endDate: Date
}
