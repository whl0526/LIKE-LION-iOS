//
//  BoardsView.swift
//  MyZzangDoll
//
//  Created by Martin on 2022/12/13.
//

import SwiftUI
import FirebaseStorage

struct BoardsView: View {
    
    
    @StateObject private var postStore: PostStore = PostStore()
    @State private var url = ""
    @State private var isPresented: Bool = false
    @State private var urlArr: [String] = []
    
    var body: some View {
        VStack {
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "plus")
            }
            
            List {
                VStack {
                    ForEach(Array(postStore.uiImg.enumerated()), id: \.offset) { index, img in
                        
                        HStack {
                            Spacer()
                            Image(uiImage: img)
                                .resizable()
                                .frame(width: 150, height: 150)
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("제목 : \(postStore.posts[index].title)")
                                Text("내용 : \(postStore.posts[index].contents)")
                                Text("좋아요 : \(postStore.posts[index].likeCounts)")
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .refreshable {
            postStore.fetchPost()
        }
        .onAppear {
            print("BoardsView Appear")
            postStore.fetchPost()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            postStore.fetchPost()
        }) {
            CreateBoardView(isPresented: $isPresented)
            
        }
        
        
    }
    
    
}



//struct Board: View {
//
//    @Binding var post: Post
//
//    var body: some View {
//        VStack {
//            Text("\(post.title)")
//            Text("\(post.)")
//        }
//    }
//}



//struct BoardsView_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardsView()
//    }
//}

