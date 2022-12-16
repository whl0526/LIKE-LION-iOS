//
//  Post.swift
//  MyZzangDoll
//
//  Created by Martin on 2022/12/13.
//

import Foundation
import UIKit

struct Post: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var contents: String
    var likeCounts: Int
    var imageName: String?
    let createdAt: Double
    
    var imagePath: String {
        return "images/\(id)/\(imageName ?? "")"
    }
    
    var createdDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd" // "yyyy-MM-dd HH:mm:ss"
        
        let dateCreatedAt = Date(timeIntervalSince1970: createdAt)
        print(dateCreatedAt)
        print(Date().timeIntervalSince1970)
        return dateFormatter.string(from: dateCreatedAt)
    }
    
}

struct PostImage: Identifiable, Hashable {
    var id: String
    var image: UIImage
    var imgName: String
}
