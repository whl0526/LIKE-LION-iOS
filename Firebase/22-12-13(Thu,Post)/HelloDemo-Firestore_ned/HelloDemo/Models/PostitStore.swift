//
//  PostitStore.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//

import Foundation
import FirebaseFirestore

class PostitStore: ObservableObject {
    @Published var postits: [Postit] = []
    
    let database = Firestore.firestore()
    
    init() {
        /*
        postits = [
            Postit(id: UUID().uuidString, user: "ned", memo: "Good morning", colorIndex: 0, createdAt: Date().timeIntervalSince1970),
            
            Postit(id: UUID().uuidString, user: "ned", memo: "Good evening", colorIndex: 1, createdAt: Date().timeIntervalSince1970),
            
            Postit(id: UUID().uuidString, user: "ned", memo: "Hello World", colorIndex: 2, createdAt: Date().timeIntervalSince1970),
            
            Postit(id: UUID().uuidString, user: "ned", memo: "Hello my friend", colorIndex: 3, createdAt: Date().timeIntervalSince1970)
        ]
         */
        postits = []
    }
    
  
    func fetchPostits() {
        database.collection("Postits")
            .getDocuments { (snapshot, error) in
                self.postits.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        let user: String = docData["user"] as? String ?? ""
                        let memo: String = docData["memo"] as? String ?? ""
                        let colorIndex: Int = docData["colorIndex"] as? Int ?? 0
                        let createdAt: Double = docData["createdAt"] as? Double ?? 0
                        
                        let postit: Postit = Postit(id: id, user: user, memo: memo, colorIndex: colorIndex, createdAt: createdAt)
                        
                        self.postits.append(postit)
                    }
                }
            }
    }
    
    func addPostit(_ postit: Postit) {
        database.collection("Postits")
            .document(postit.id)
            .setData(["user": postit.user,
                      "memo": postit.memo,
                      "colorIndex": postit.colorIndex,
                      "createdAt": postit.createdAt])
        
        fetchPostits()
    }
    
    func removePostit(_ postit: Postit) {
        database.collection("Postits")
            .document(postit.id).delete()
        fetchPostits()
    }
}
