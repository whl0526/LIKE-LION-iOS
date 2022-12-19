//
//  Coments.swift
//  Gabojago
//
//  Created by 전혜성 on 2022/12/19.
//

import Foundation
 
struct Coments: Codable, Hashable, Identifiable {
    
    var id: UUID
    var placeId: String
    var userId: String
    var content: String
    var date: Double
    
}
