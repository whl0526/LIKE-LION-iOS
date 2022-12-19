//
//  User.swift
//  Gabojago
//
//  Created by 전혜성 on 2022/12/19.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    
    var id: UUID
    var nickName: String
    var age: Int
    var gender: Int
    var likeHistory: [String]
    
}
