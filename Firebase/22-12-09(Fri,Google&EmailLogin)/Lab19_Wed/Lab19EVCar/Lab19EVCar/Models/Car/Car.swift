//
//  Car.swift
//  ListNavDemo
//
//  Created by Neil Smyth on 10/15/19.
//  Copyright © 2019 eBookFrenzy. All rights reserved.
//

import Foundation

struct Car : Codable, Identifiable, Hashable {
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
}


extension Encodable{
    var toDictionary: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else{
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
    
  
}
