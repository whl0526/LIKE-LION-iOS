//
//  Comment.swift
//  MyZzangDoll
//
//  Created by Martin on 2022/12/13.
//

import Foundation

struct Comment: Hashable, Codable {
    var id = UUID()
    var user: String
    var content: String
    var commentLike: Int
    var postId: String
}
