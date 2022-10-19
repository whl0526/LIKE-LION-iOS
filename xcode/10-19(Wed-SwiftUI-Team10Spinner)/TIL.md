## 🔸@State Binding

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
            
            Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
            Text(wifiEnable ? "WIFI On" : "WIFI Off")
            
        }
        .padding()
        .font(.largeTitle)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## 🔸@Team10 Miracle Spinner

<img width="441" alt="Untitled (6)" src="https://user-images.githubusercontent.com/67450169/196712012-46d07242-df0f-4acb-a1e4-e695a8c3e829.png">
<img width="464" alt="Untitled (7)" src="https://user-images.githubusercontent.com/67450169/196712026-355a1fc7-7869-48a0-ad42-4d7cfac1b571.png">
```swift
import SwiftUIimport SwiftUI

struct ContentView: View {
    var colornames = ["black", "red", "blue", "green"]
    var colors: [Color] = [.black, .red, .blue, .green]
    
    var teamnames = ["승준", "원형", "진형", "형구", "예원", "혜성", "성민", "석준"]
    var namecolors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple, .black]
    var namelinks = [
        "https://upload.wikimedia.org/wikipedia/commons/4/41/Left_side_of_Flying_Pigeon.jpg", "https://m.media-amazon.com/images/I/81wGn2TQJeL._SX425_.jpg", "https://www.sefiles.net/images/library/large/jamis-boss-7-368093-1.jpg", "https://www.rei.com/dam/content_team_071018_0071_htc_bike_hero_lg.jpg", "https://thetyee.ca/Culture/2019/12/25/ZengaBrosTallBike.jpg", "https://www.reidbikes.com/wp-content/uploads/2022/02/2-4.png", "https://i.natgeofe.com/k/70c8c0b3-e6e9-4c8e-9e9b-795e6dcc2b1c/bike-large-front-wheel1_square.jpg", "https://i.pinimg.com/474x/9b/54/b3/9b54b3942523d74ce4aadaba09299c75--antique-bicycles-penny-farthing.jpg"]
    
    @State private var nameIndex = 0
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Miracle Team 10"
    @State private var text2: String = "names"
    
    var body: some View {
        VStack {
            Spacer()
            
            withAnimation (Animation.easeInOut(duration: 3), {
                Group {
                    AsyncImage(url: URL(string: namelinks[nameIndex])) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 400, height: 400)
                    .rotationEffect(.degrees(self.rotation))
                    .animation(.easeInOut(duration: 1))
                    
                    
                    Text(text)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .rotationEffect(.degrees(self.rotation))
                        .animation(.easeInOut(duration: 1))
                        .foregroundColor(self.colors[self.colorIndex])
                    
                    Text(teamnames[nameIndex])
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .rotationEffect(.degrees(self.rotation))
                        .animation(.easeInOut(duration: 1))
                        .foregroundColor(self.namecolors[self.nameIndex])
                    
                }
            })
            
            Spacer()
            Divider()
            Slider(value: $rotation, in:0...360, step:0.1)
                .padding()
            
            TextField("Eenter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("color")) {
                ForEach ( 0 ..< colornames.count ) {
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
            
            Picker(selection: $nameIndex, label: Text("name")) {
                ForEach( 0 ..< teamnames.count ) {
                    Text(self.teamnames[$0])
                        .foregroundColor(self.namecolors[$0])
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    var colornames = ["black", "red", "blue", "green"]
    var colors: [Color] = [.black, .red, .blue, .green]
    
    var teamnames = ["승준", "원형", "진형", "형구", "예원", "혜성", "성민", "석준"]
    var namecolors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple, .black]
    var namelinks = [
        "https://upload.wikimedia.org/wikipedia/commons/4/41/Left_side_of_Flying_Pigeon.jpg", "https://m.media-amazon.com/images/I/81wGn2TQJeL._SX425_.jpg", "https://www.sefiles.net/images/library/large/jamis-boss-7-368093-1.jpg", "https://www.rei.com/dam/content_team_071018_0071_htc_bike_hero_lg.jpg", "https://thetyee.ca/Culture/2019/12/25/ZengaBrosTallBike.jpg", "https://www.reidbikes.com/wp-content/uploads/2022/02/2-4.png", "https://i.natgeofe.com/k/70c8c0b3-e6e9-4c8e-9e9b-795e6dcc2b1c/bike-large-front-wheel1_square.jpg", "https://i.pinimg.com/474x/9b/54/b3/9b54b3942523d74ce4aadaba09299c75--antique-bicycles-penny-farthing.jpg"]
    
    @State private var nameIndex = 0
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Miracle Team 10"
    @State private var text2: String = "names"
    
    var body: some View {
        VStack {
            Spacer()
            
            withAnimation (Animation.easeInOut(duration: 3), {
                Group {
                    AsyncImage(url: URL(string: namelinks[nameIndex])) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 400, height: 400)
                    .rotationEffect(.degrees(self.rotation))
                    .animation(.easeInOut(duration: 1))
                    
                    
                    Text(text)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .rotationEffect(.degrees(self.rotation))
                        .animation(.easeInOut(duration: 1))
                        .foregroundColor(self.colors[self.colorIndex])
                    
                    Text(teamnames[nameIndex])
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .rotationEffect(.degrees(self.rotation))
                        .animation(.easeInOut(duration: 1))
                        .foregroundColor(self.namecolors[self.nameIndex])
                    
                }
            })
            
            Spacer()
            Divider()
            Slider(value: $rotation, in:0...360, step:0.1)
                .padding()
            
            TextField("Eenter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            **Picker(selection: $colorIndex, label: Text("color")) {
                ForEach ( 0 ..< colornames.count ) {
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
            
            Picker(selection: $nameIndex, label: Text("name")) {
                ForEach( 0 ..< teamnames.count ) {
                    Text(self.teamnames[$0])
                        .foregroundColor(self.namecolors[$0])
                }
            }
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
