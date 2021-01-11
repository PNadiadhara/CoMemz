//
//  PostComment.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/11/21.
//

import Foundation

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
