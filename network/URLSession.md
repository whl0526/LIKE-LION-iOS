![Untitled (19)](https://user-images.githubusercontent.com/67450169/203008002-81dd0bca-0605-4ae9-93ff-a8012dab8d15.png)
![Untitled (20)](https://user-images.githubusercontent.com/67450169/203008014-7e0b3cce-154d-4415-ae28-2b8e334f5008.png)
![Untitled (21)](https://user-images.githubusercontent.com/67450169/203008033-b9d8aa32-09ac-4ee2-b0db-de844f316b31.png)
![Untitled (22)](https://user-images.githubusercontent.com/67450169/203008055-af8ec8ab-7da0-4423-a8d6-3495e324c844.png)![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4cad2ec0-d527-4b56-8227-a0f8d2f27a05/Untitled.png)
![Untitled (23)](https://user-images.githubusercontent.com/67450169/203008079-4fdb1ec1-63ad-4b36-8935-1eb70f55a0ab.png)

![Untitled (24)](https://user-images.githubusercontent.com/67450169/203008099-421b71a6-2e4e-4af4-bfcd-2d92fb60ed71.png)
![Untitled (25)](https://user-images.githubusercontent.com/67450169/203008107-f6359ddd-bb06-43f2-8402-b23d81710d05.png)
### GROUP

![Untitled (26)](https://user-images.githubusercontent.com/67450169/203008118-367d205a-d442-499d-9e1c-45775f5705bc.png)
![Untitled (28)](https://user-images.githubusercontent.com/67450169/203008128-8c849602-cdfe-44ab-a742-80865864bab9.png)
```swift
import Foundation

// playground에서 URLSession 통신하려면 다음의 코드가 필요하다
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// 1. carData.json 파일을 mocki.io에 올린다. 
// 2. URLSession으로 데이터를 가져와 바로 출력이 가능한지 살펴본다
// 3. 차 이름들만 출력되도록 만들어본다
// 4. 목록 데이터들을 더 활용해서 차 이름과 설명, 하이브리드 여부를 print로 출력하도록 한다

let url = URL(string: "...")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing")
        print("\(error)")
        return
    }
    
    let showingData = String(data: data, encoding: .utf8)!
    print("\(showingData)")
}

task.resume()
```

## carData URLSession

```swift
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Post: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case isHybrid
        case imageName
    }
    
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
    
}

let url = URL(string: "https://mocki.io/v1/c5c5be2f-9fae-49a8-8578-d2c290aa0b11")!

URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        print("Error: invalid HTTP response code")
        return
    }
    guard let data = data else {
        print("nothing")
        return
    }
    
    
    do {
        let decoder = JSONDecoder()
        let posts = try decoder.decode([Post].self, from: data)
        
        print(posts.map { $0.name })
        print("-------------------------------------------------")
        print(posts.map { $0.description})
        print("-------------------------------------------------")
        print(posts.map { $0.isHybrid})
        print("-------------------------------------------------")
        PlaygroundPage.current.finishExecution()
    }
    catch {
        print("Error: \(error.localizedDescription)")
        return
    }
}.resume()
```

```swift
import Foundation

// playground에서 URLSession 통신하려면 다음의 코드가 필요하다
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// 1. carData.json 파일을 mocki.io에 올린다. 
// 2. URLSession으로 데이터를 가져와 바로 출력이 가능한지 살펴본다
// 3. 차 이름들만 출력되도록 만들어본다
// 4. 목록 데이터들을 더 활용해서 차 이름과 설명, 하이브리드 여부를 print로 출력하도록 한다

struct Car : Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}

func loadJson<T: Decodable>(data: Data) -> T {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse data: \(error)")
    }
}

let url = URL(string: "https://mocki.io/v1/c21cbc0e-9877-4cd3-9f00-2d5b909caa10")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing by error")
        return
    }
    
    var carData: [Car] = loadJson(data: data)

    for car in carData {
        print("\(car.name)")
        print("\(car.description)")
        if car.isHybrid {
            print("It's Hybrid!")
        }
        print("-----------------")
    }
}

task.resume()
```

![Untitled (29)](https://user-images.githubusercontent.com/67450169/203008488-feab1747-1aad-44b1-aa03-48311d1fc234.png)
