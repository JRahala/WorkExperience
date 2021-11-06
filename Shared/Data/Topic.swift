//
//  Topic.swift
//  WorkExperience
//
//  Created by Rahala, Jasamrit (Coll) on 04/11/2021.
//

import Foundation

// Subject enumerables (plural)
enum SubjectTag{
    case Accounting
    case Engineering
    case DataScience
    case Investing
}

// Region enumerables (singular)
enum RegionTag{
    case Bedford
    case Berkshire
    case Cambridge
    case Cheshire
    case London
    case Derby
    case Devon
    case Essex
    case Hampshire
    case Lancashire
    case Leicestershire
    case Norfolk
    case Oxford
    case Suffolk
    case Warwick
    case Worcestershire
}

enum Tag{
    case RegionTag(RegionTag)
    case SubjectTag(SubjectTag)
    case DateTag(DateRange)
    case DetailsTag(String)
}


