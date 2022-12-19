//
//  PlaceStore.swift
//  Gabojago
//
//  Created by 전혜성 on 2022/12/19.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import UIKit

class PlaceStore: ObservableObject {
    
    @Published var places: [Place] = []
    @Published var imgArr: [UIImage] = []
    
    let database = Firestore.firestore()
    let storage = Storage.storage()
    
    func fetchPlace() {
        database.collection("Place")
            .getDocuments { [self] (snapshot, error) in
                if let snapshot {
                    for document in snapshot.documents {
                        
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        
                        
                        let title: String = docData["title"] as? String ?? ""
                        let lat: Double = docData["lat"] as? Double ?? 0.0
                        let long: Double = docData["long"] as? Double ?? 0.0
                        let category: Int = docData["category"] as? Int ?? 0
                        let description: String = docData["description"] as? String ?? ""
                        let likeCount: Int = docData["likeCount"] as? Int ?? 0
                        let location: String = docData["location"] as? String ?? ""
                        let images: [String] = docData["location"] as? [String] ?? []
                        
                        let place = Place(id: id, title: title, lat: lat, long: long, category: category, description: description, likeCount: likeCount, location: location, images: images)
                        
                        print("\(place)")
                        self.fetchAllImage(place: place)
                        self.places.append(place)
                        
                    }
                }
            }
    }
    
    func fetchAllImage(place: Place) {
        
        let _ = storage.reference().child("\(place.id)").listAll { result, error in
            
            if let result = result {
                result.items.forEach { item in
                    
                    item.getData(maxSize: 20 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("error while downloading image\n\(error.localizedDescription)")
                            return
                        } else {
                            let image = UIImage(data: data!)
                            
                            self.imgArr.append(image!)
                            
                        }
                    }
                }
            } else {
                
            }
            
        }
    }
    
    func fetchCategoryImage(place: Place) {
        let _ = storage.reference().child("\(place.id)/\(place.category)").listAll { result, error in
            
            if let result = result {
                result.items.forEach { item in
                    
                    item.getData(maxSize: 20 * 1024 * 1024) { data, error in
                        if let error = error {
                            print("error while downloading image\n\(error.localizedDescription)")
                            return
                        } else {
                            let image = UIImage(data: data!)
                            
                            self.imgArr.append(image!)
                            
                        }
                    }
                }
            } else {
                
            }
            
        }
    }
    
}
