![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b9052336-882a-4a5d-93b2-a4296cf43a8c/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/41e0dac4-3d0c-4b8f-a77e-c0c30788738c/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/46a3a57a-a8c5-4b9d-93b8-fd0a510ab024/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4d82d511-91bc-408c-b056-87514a9e95e7/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4cad2ec0-d527-4b56-8227-a0f8d2f27a05/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0549e70a-eb25-4566-a7cd-b7f3a070d7ab/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ac83776f-0bd2-442a-8d55-7544e8706d8a/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/102bc9b3-4c4e-4c09-a91d-efbc9032f997/Untitled.png)

### GROUP

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e1581dba-fe6e-4777-8c59-78a25908b43e/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/204df2e5-6348-404d-8e9d-4dafc7265af8/Untitled.png)

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

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3c3f4e9e-ce62-4a2e-869c-3eaa37fd1559/Untitled.png)
