//
//  PostStore.swift
//  MyZzangDoll
//
//  Created by 전혜성 on 2022/12/13.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import UIKit

class PostStore: ObservableObject {
    @Published var posts: [Post] = []
    @Published var postImage: [PostImage] = []
    @Published var uiImg: [UIImage] = []
    
    let database = Firestore.firestore()
    let storage = Storage.storage()
    
    
    func fetchPost() {
        self.posts.removeAll()
        self.uiImg.removeAll()
        database.collection("Post")
            .order(by: "createdAt", descending: true)
            .getDocuments { [self] (snapshot, error) in
            if let snapshot {
                for document in snapshot.documents {
                    
                    let id: String = document.documentID
                    
                    let docData = document.data()
                    let title: String = docData["title"] as? String ?? ""
                    let contents: String = docData["contents"] as? String ?? ""
                    let likeCounts: Int = docData["likeCounts"] as? Int ?? 0
                    let imagePath: String = docData["imagePath"] as? String ?? ""
                    
                    let createdAt: Double = docData["createdAt"] as? Double ?? 0.0
                    
                    let post = Post(id: id, title: title, contents: contents, likeCounts: likeCounts, imageName: imagePath, createdAt: createdAt)
                    
                    self.fetchImage(post: post)
                    self.posts.append(post)
                    
                }
            }
        }
    }
    
    
    @MainActor
    func addPost(_ post: Post, _ postImage: PostImage) async {
        
        self.postImage.append(postImage)
        do {
            uploadImage(postId: post.id, image: postImage.image, name: post.imageName ?? "")
            //        print("post.imagePath : \(post.imagePath)")
            
            try await database.collection("Post")
                .document(post.id)
                .setData([
                    "title": post.title,
                    "contents": post.contents,
                    "likeCounts": post.likeCounts,
                    "imagePath": post.imagePath,
                    "createdAt": post.createdAt
                ])
            
            fetchPost()
        } catch {
            print("\(error.localizedDescription)")
        }
        
    }
    
    
    
    func removePost(_ post: Post) {
        database.collection("Post")
            .document(post.id).delete()
        
        fetchPost()
    }
    
    
    
    private func uploadImage(postId: String, image: UIImage, name: String)  {
        let storageRef = storage.reference().child("images/\(postId)/\(name)")
        let data = image.jpegData(compressionQuality: 0.1)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        
        if let data = data {
            storageRef.putData(data, metadata: metadata) { (metadata, err) in
                if let err = err {
                    print("err when uploading jpg\n\(err)")
                }

                if let _ = metadata {
                }
            }
            
            
        }

    }
    
    func fetchImage(post: Post) {
        let ref = storage.reference(forURL: "gs://mzdoll-920ea.appspot.com/\(String(describing: post.imageName!))")
        
        
        ref.getData(maxSize: 20 * 1024 * 1024) { data, error in
            if let error = error {
                print("error while downloading image\n\(error.localizedDescription)")
                return
            } else {
                let image = UIImage(data: data!)
                
                self.uiImg.append(image!)
            }
        }
        
    }
    
}
