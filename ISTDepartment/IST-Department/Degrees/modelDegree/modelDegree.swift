//
//  modelDegree.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/10/21.
//

import Foundation

struct DegreeReturned: Codable{
    var undergraduate: [Undergraduate]
    var graduate: [Graduate]
}

struct Undergraduate: Codable{
    var degreeName : String?
    var title: String?
    var description: String?
    var concentrations: [String]?
}

struct Graduate: Codable{
    var degreeName : String?
    var title: String?
    var description: String?
    var concentrations: [String]?
}
