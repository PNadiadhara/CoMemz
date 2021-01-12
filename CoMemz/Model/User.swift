//
//  User.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/11/21.
//

import Foundation

enum Gender {
    case male, female, other
}

struct User {
    let username: String
    let bio: String?
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let joinDate: Date
}

struct UserStatsCount {
    let followers: Int
    let following:Int
    let posts: Int
}



