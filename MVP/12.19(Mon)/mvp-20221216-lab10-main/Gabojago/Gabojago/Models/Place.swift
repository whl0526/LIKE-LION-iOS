//
//  Place.swift
//  Gabojago
//
//  Created by 전혜성 on 2022/12/19.
//

import Foundation

struct Place: Codable, Hashable, Identifiable {
    
    var id: String
    var title: String
    var lat: Double
    var long: Double
    var category: Int
    var description: String
    var likeCount: Int
    var location: String
    var images: [String]
    
}
