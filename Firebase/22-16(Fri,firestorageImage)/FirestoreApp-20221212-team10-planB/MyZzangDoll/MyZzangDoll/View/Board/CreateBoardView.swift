//
//  CreateBoardView.swift
//  MyZzangDoll
//
//  Created by Martin on 2022/12/13.
//

import SwiftUI
import PhotosUI
import UIKit

struct CreateBoardView: View {
    
    @StateObject var postStore: PostStore = PostStore()
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages  = [UIImage]()
    @State private var photosName = UIImage()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                if selectedImages.count > 0 {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(selectedImages, id: \.self) { img in
                                Image(uiImage: img)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                            }
                        }
                    }
                } else {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray.opacity(0.6))
                        .padding()
                }
                
                PhotosPicker(selection: $selectedItems,  matching: .any(of: [.images, .not(.videos)])) {
                    Label("Pick Photo", systemImage: "photo.artframe")
                }
                .onChange(of: selectedItems) { newValues in
                    Task {
                        selectedImages = []
                        for value in newValues {
                            if let imageData = try? await value.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                                selectedImages.append(image)
                                photosName = image
                                
                            }
                        }
                    }
                }
                TextField("제목", text: $title)
                TextField("내용", text: $content)
                Button {
                    let id = UUID().uuidString
                    let photoName = UUID().uuidString
                    
                    let post = Post(id: id, title: title, contents: content, likeCounts: 0, imageName: photoName, createdAt: Date().timeIntervalSince1970)
                    let postImage = PostImage(id: id, image: photosName, imgName: photoName)
                    
                    Task {
                        await postStore.addPost(post, postImage)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            isPresented.toggle()
                        }
                    }
                    
                } label: {
                    Text("등록")
                }

            }
        }
        //        VStack {
        //            PhotosPicker(
        //                selection: $selectedItem,
        //                matching: .images,
        //                photoLibrary: .shared()) {
        //                    Text("사진가져오기")
        //                }
        //                .onChange(of: selectedItem) { newItem in
        //                    Task {
        //                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
        //                            selectedImageData = data
        //                        }
        //                    }
        //
        //                }
        //            ForEach(selectedImageData!, id: \.self) { item in
        //                if let selectedImageData, let uiImage = UIImage(data: item) {
        //
        //                    Image(uiImage: uiImage)
        //                        .resizable()
        //                        .scaledToFit()
        //                        .frame(width: 250, height: 250)
        //                    }
        //
        //            }
        //            if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
        //
        //                Image(uiImage: uiImage)
        //                    .resizable()
        //                    .scaledToFit()
        //                    .frame(width: 250, height: 250)
        //            }
        
                
        //
        //        Button {
        //                ForEach(selectedImageData!, id: \.self) { item in
        //                    postStore.uploadImage(image: UIImage(data: item)!, name: "test")
        //                }
        //            postStore.uploadImage(image: UIImage(data: selectedImageData!)!, name: "test")
        //        } label: {
        //            Text("등록")
        //        }
        
    }
}



//struct CreateBoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateBoardView()
//    }
//}
