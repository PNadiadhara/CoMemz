//
//  UserPost.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/7/21.
//

import Foundation

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let postType: UserPostType
}
