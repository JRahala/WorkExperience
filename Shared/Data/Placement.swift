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
    var interestedStudents: Set<Student>
    
    // tag attributes
    var regionTag: String
    var dateTag: DateRange
    var subjectTags: Set<String>
    var miscellaneousTags: Set<String>
    
    init(title: String, description: String, author: Employee){
        self.title = title
        self.description = description
        self.author = author
        self.regionTag = "Berkshire"
        self.dateTag = DateRange(startDate: Date(day: 1, month: 1, year: 1), finishDate: Date(day: 2, month: 1, year: 1))
        self.subjectTags = Set<String>()
        self.miscellaneousTags = Set<String>()
        self.interestedStudents = Set<Student>()
    }
    
    // set the region tag to new regionTag
    func toggleRegionTag(regionTag: String){
        self.regionTag = regionTag
    }

    // set the date tag to the new dateTag
    func toggleDateTag(dateTag: DateRange){
        self.dateTag = dateTag
    }
    
    // add / remove subject tag
    func toggleSubjectTag(subjectTag: String){
        if (self.subjectTags.remove(subjectTag) == nil){
            self.subjectTags.insert(subjectTag)
        }
    }
    
    // add / remove miscellaneous tag
    func toggleMiscellaneousTag(miscellaneousTag: String){
        if (self.miscellaneousTags.remove(miscellaneousTag) == nil){
            self.miscellaneousTags.insert(miscellaneousTag)
        }
    }
}

// Days in a month
let MONTH_DURATIONS: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

// Names of the ordinal numbers
let ORDINAL_NAMES: [String] = ["0th", "1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th",
                               "11th", "12th", "13th", "14th", "15th", "16th", "17th", "18th", "19th",
                               "20th", "21st", "22nd", "23rd", "24th", "25th", "26th", "27th", "28th",
                               "29th", "30th", "31st"]

// Names of the months
let MONTH_NAMES: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

// Date struct
struct Date{
    let day: Int        // 01 = First day
    let month: Int      // 01 = January, 12 = December
    let year: Int       // 00 = 2000
    
    // Return the number of days since 01/01/2000
    var duration: Int{
        
        // count dates within months
        var count: Int = year * 365 + day
        for index in 0..<(month-1){
            count += MONTH_DURATIONS[index]
        }
        
        // account for leap years (except if before march)
        var starting_year: Int = year
        var leap_years: Int = 0
        if (month <= 2){
            starting_year -= 1
        }
        leap_years += year / 4
        leap_years -= year / 100
        leap_years += year / 400
        
        return count + leap_years
    }
    
    // Convert from numbers into strings
    var verbose: [String]{
        return [ORDINAL_NAMES[day], MONTH_NAMES[month], String(year)]
    }
    
}

// DateRange struct
struct DateRange{
    let startDate: Date
    let finishDate: Date
    
    // Return the number of days a range lasts (including both end points) -> Int
    func duration() -> Int{
        return abs(startDate.duration - finishDate.duration)
    }
    
    // Return the overlap  DateRange? between two date ranges
    static func overlap(a: DateRange, b: DateRange) -> DateRange?{
        
        let firstRange: DateRange
        let lastRange: DateRange
        
        // sort the ranges by earliest first
        if (a.startDate.duration > b.startDate.duration){
            firstRange = b
            lastRange = a
        } else {
            firstRange = a
            lastRange = b
        }
        // check for no overlap
        if (firstRange.finishDate.duration < lastRange.startDate.duration){
            return nil
        }
        // check for full overlap
        if (firstRange.startDate.duration > lastRange.startDate.duration && firstRange.finishDate.duration < lastRange.startDate.duration){
            return DateRange(startDate: lastRange.startDate, finishDate: lastRange.finishDate)
        }
        // partial overlap
        return DateRange(startDate: lastRange.startDate, finishDate: firstRange.finishDate)
    }
    
}
