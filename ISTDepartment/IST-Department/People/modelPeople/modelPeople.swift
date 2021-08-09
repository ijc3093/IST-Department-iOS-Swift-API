//
//  Faculty.swift
//  IST-Department
//
//  Created by Ike Chukz on 8/5/21.
//

import Foundation

struct PeopleReturned: Codable{
    var title: String?
    var subTitle: String?
    var faculty: [Faculty]
    var staff: [Staff]
}

struct Faculty: Codable{
    var username: String?
    var name: String?
    var tagline: String?
    var imagePath: String?
    var title: String?
    var interestArea: String?
    var office: String?
    var website: String?
    var phone: String?
    var email: String?
    var twitter: String?
    var facebook: String?
}

struct Staff: Codable{
    var username: String?
    var name: String?
    var tagline: String?
    var imagePath: String?
    var title: String?
    var interestArea: String?
    var office: String?
    var website: String?
    var phone: String?
    var email: String?
    var twitter: String?
    var facebook: String?
}
