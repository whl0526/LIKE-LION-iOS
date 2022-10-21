```swift
import SwiftUI

struct ContentView: View {
    
    
    @State private var textIndex = ""
    @State private var randomAngle = 0.0
    var body: some View {
       
        
        VStack{
         
            ZStack {
                Group{
                    Path { path in
                        path.move(to: CGPoint(x: 180, y: 300))
                        path.addArc(center: .init(x: 180, y: 300), radius: 150, startAngle: Angle(degrees: 45), endAngle: Angle(degrees: 135), clockwise: false)
                    }
                    .fill(Color(.systemYellow))
                    
                    TextField("입력하세요", text: $textIndex)
                        .frame(maxWidth: 100, maxHeight: 50, alignment: .center)
                        .position(CGPoint(x: 190, y: 400))
                      
                    
                    
                    
                    
                    
                    Path { path in
                        path.move(to: CGPoint(x: 180, y: 300))
                        path.addArc(center: .init(x: 180, y: 300), radius: 150, startAngle: Angle(degrees: 135), endAngle: Angle(degrees: 225), clockwise: false)
                    }
                    .fill(Color(.systemTeal))
                  
                TextField("입력하세요", text: $textIndex)
                    .frame(maxWidth: 100, maxHeight: 50, alignment: .center)
                    .position(CGPoint(x: 90, y: 300))
                    
                    
                
                
                
                
                    Path { path in
                        path.move(to: CGPoint(x: 180, y: 300))
                        path.addArc(center: .init(x: 180, y: 300), radius: 150, startAngle: Angle(degrees: 225), endAngle: Angle(degrees: 315), clockwise: false)
                    }
                    .fill(Color(.systemBlue))
                    
            TextField("입력하세요", text: $textIndex)
                .frame(maxWidth: 100, maxHeight: 50, alignment: .center)
                .position(CGPoint(x: 190, y: 225))
                
                    
                    
                    
                    
                    Path { path in
                        path.move(to: CGPoint(x: 180, y: 300))
                        path.addArc(center: .init(x: 180, y: 300), radius: 150, startAngle: Angle(degrees: 315), endAngle: Angle(degrees: 45), clockwise: false)
                    }
                    .fill(Color(.systemPurple))
                   
                    TextField("입력하세요", text: $textIndex)
                        .frame(maxWidth: 100, maxHeight: 50, alignment: .center)
                        .position(CGPoint(x: 280, y: 300))
        
                }

            }
            
           
        }
        .rotationEffect(Angle(degrees: self.randomAngle))
        .animation(.timingCurve(0, 0.8, 0.2, 1, duration:10))
        .padding()
        Button("Start") {
            self.randomAngle += Double.random(in: 1080 ..< 3600)
        }
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
