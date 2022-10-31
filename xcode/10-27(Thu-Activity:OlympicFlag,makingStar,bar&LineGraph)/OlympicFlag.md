![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a68c24a4-565b-493d-a170-a6a114b187cd/Untitled.png)

```swift
//
//  ContentView.swift
//  DrawDemo
//
//  Created by 이원형 on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          Text("Hello, Rectangle")
                .font(.largeTitle)
            Rectangle()
            
            Text("Hello Circle")
                .font(.largeTitle)
            
    
            Circle()
                .fill(Color.purple)
                .frame(width: 600, height: 240)
            
            Text("Hello, Capsule")
                .font(.largeTitle)
            Capsule()
                .stroke(lineWidth: 10)
                .foregroundColor(.blue)
                .frame(width: 200, height: 100)
            
            Text("Hello, RoundRectangle")
            
            RoundedRectangle(cornerRadius: CGFloat(20))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(5), dash:[CGFloat(10), CGFloat(5)]))
            Text("Hello, Ellipse")
            
            Ellipse()
            
            
            
        }//VStack
        .padding()
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
