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
    let identifier: String
    let thumbnailImage : URL
    let caption: String?
    let likeCount: [PostLikes]
    let comments: [PostComment]
    let createdDate: Data
    let taggedUsers: [String]
    
}



