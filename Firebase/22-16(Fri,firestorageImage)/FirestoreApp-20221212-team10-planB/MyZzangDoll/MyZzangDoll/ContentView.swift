//
//  ContentView.swift
//  MyZzangDoll
//
//  Created by Martin on 2022/12/13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    //    @StateObject private var postStore: PostStore = PostStore()
    
    var body: some View {
        TabView {
            NavigationView{
                BoardsView()
            }
            .tabItem {
                Label("게시물", systemImage: "rectangle.grid.1x2.fill")
            }
            
            MyPageView()
                .environmentObject(authViewModel)
                .tabItem {
                    Label("마이페이지", systemImage: "person.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authViewModel: AuthViewModel())
    }
}
