
NavitationView & TabView

```swift
//
//  ContentView.swift
//  TabViewDemo
//
//  Created by 이원형 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 2
    
    var body: some View {
        
        TabView(selection: $tabSelection){
            
            NavigationView {
                SecondView()
                
            }.tabItem {
                    Image(systemName: "house.fill")
                    Text("Tab Label 1")
            }.tag(1)
            
            
            NavigationView {
                SecondView()
                
            }.tabItem {
                Image(systemName: "house.circle")
                Text("Tab Label 2")}.tag(2)
            
            NavigationView {
                SecondView()
                
            }.tabItem {
                Image(systemName: "music.note.house.fill")
                Text("Tab Label 3")}.tag(3)
            
            NavigationView {
                SecondView()
                
            }.tabItem {
                Image(systemName: "homepod.2.fill")
                Text("Tab Label 4")}.tag(4)
            
            NavigationView {
                SecondView()
                
            }.tabItem {
                Image(systemName: "homepodmini.and.appletv.fill")
                Text("Tab Label 5")}.tag(5)
        }//TabView
    }//body
    
}//Conetent

struct SecondView: View{
    var body: some View{
        List {
            NavigationLink(destination:{
                ThirdView()
                
            }, label: {
                HStack {
                    Text("hello")
                        .font(.largeTitle)
                }//HStack
            })
        }//List
        .navigationTitle(Text("funkin world"))
    }
    struct ThirdView: View{
        var body: some View {
            List{
                Text("hello")
                    .font(.largeTitle)
            }//List
            .navigationTitle(Text("funkin world"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

ContextMenu

```swift
//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by 이원형 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var foregroundColor : Color = .black
    @State private var backgroundColor: Color = .blue
    var body: some View {
  
        VStack {
            Text("Hello, world!")
                .font(.largeTitle)
                .padding()
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .contextMenu{
                    Button(action: {
                        foregroundColor = .black
                        backgroundColor = .white
                    }){
                        Text("Normal Colors")
                        Image(systemName: "paintbrush")
                    }
                    Button(action: {
                        foregroundColor = .white
                        
                        backgroundColor = .purple

                    }){
                        Text("purple Colors")
                        Image(systemName: "paintbrush.fill")
                    }
                }//contextMenu
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
