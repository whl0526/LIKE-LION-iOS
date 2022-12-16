//
//  ContentView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//


// 주의 : 여기엔 Firebase 관련 코드 안보여야 함!

import SwiftUI

struct ContentView: View {
    @StateObject private var postitStore: PostitStore = PostitStore()
    
    @State private var showingAddingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(postitStore.postits) { postit in
                    PostitView(postit: postit)
                        .contextMenu {
                            ShareLink(item: postit.textForSharing)
                            
                            Button {
                                postitStore.removePostit(postit)
                            } label: {
                                Text("Remove")
                                Image(systemName: "trash")
                            }
                        }
                }
                
                if postitStore.postits.isEmpty {
                    Text("It's empty!")
                        .padding()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Post It")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAddingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddingSheet) {
                AddingView(postitStore: postitStore,  showingSheet: $showingAddingSheet)
            }
            .onAppear {
                postitStore.fetchPostits()
            }
            .refreshable {
                postitStore.fetchPostits()
            }
        }
    }
}

struct PostitView: View {
    var postit: Postit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(postit.memo)
                .padding()
            HStack {
                Text(postit.user)
                    .font(.footnote)
                    .padding()
                Spacer()
                Text(postit.createdDate)
                    .font(.footnote)
                    .padding()
            }
        }
        .background(postit.color)
        .shadow(radius: 6)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
