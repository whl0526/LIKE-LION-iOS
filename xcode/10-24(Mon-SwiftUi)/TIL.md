
- 10-24(월-SwiftUI-)
    
    Am 10
    
    ```swift
    //
    //  ContentView.swift
    //  ReHelloSwiftUI
    //
    //  Created by 이원형 on 2022/10/19.
    //
    
    import SwiftUI
    
    struct ContentView: View {
        @State private var wifiEnable: Bool = false
        @State private var userName: String = ""
        var body: some View {
            
            VStack{
                Toggle(isOn: $wifiEnable){
                    Text("WIFI On & Off")
                }.toggleStyle(SwitchToggleStyle(tint: .orange))
                
                TextField("입력하시오!", text: $userName)
                Text(userName)
                
                ExtractedView(wifiEnable: $wifiEnable)
        
                
            }//VStack
            .padding()
            .font(.largeTitle)
            
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct ExtractedView: View {
        @Binding var wifiEnable: Bool
        
        var body: some View {
            Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue,.red)
            Text(wifiEnable ? "WIFI On" : "WIFI Off")
        }
    }
    ```
    

```swift
//
//  ContentView.swift
//  ReHelloSwiftUI
//
//  Created by 이원형 on 2022/10/19.
//

import SwiftUI

//Observable의 의미는, '이거 지켜봐줘' 라는 뜻
//1. 내부의 내용들이 바뀔 예정!

class DemoData : ObservableObject{
    
    
   @Published var userCount: Int = 0
   @Published var currentUser: String = ""
    
    init(){
        updateData()
    }
    func updateData(){
        userCount += 1
        currentUser = "circle"
        
    }
}
struct ContentView: View {
    @ObservedObject var demoData: DemoData = DemoData()
    
    @State private var wifiEnable: Bool = false
    @State private var userName: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Text("userCount: \(demoData.userCount)")
                Text("currentUser: \(demoData.currentUser)")
                Button(action:{  demoData.updateData()
                    print("\(demoData.userCount)")
                }, label:{
                    Text("click")
                })
            

                Toggle(isOn: $wifiEnable){
                    Text("WIFI On & Off")
                }.toggleStyle(SwitchToggleStyle(tint: .orange))
                
                TextField("입력하시오!", text: $userName)
                Text(userName)
                
                WifiView(wifiEnable: $wifiEnable)
                SecondView()//navigationBarTitle

                
            }//VStack
            
            .padding()
            .font(.largeTitle)
            
            .navigationBarTitle(Text("master"))
        }//NavigationView
    }///body
    
}//ContentView

struct WifiView: View {
    @Binding var wifiEnable: Bool
    
    var body: some View {
        Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
            .symbolRenderingMode(.palette)
            .foregroundStyle(.blue,.red)
        Text(wifiEnable ? "WIFI On" : "WIFI Off")
    }
}

struct SecondView: View {
    var body: some View {
        NavigationLink(destination:
                        Text("Detail")
                       
            .navigationBarTitle(Text("navTitle")))
        {
            Text("push")
                .padding()
        }
    }
}

struct ContentView_Previews:PreviewProvider{
    static var previews: some View{
        ContentView(demoData: DemoData())
    }
}
```
