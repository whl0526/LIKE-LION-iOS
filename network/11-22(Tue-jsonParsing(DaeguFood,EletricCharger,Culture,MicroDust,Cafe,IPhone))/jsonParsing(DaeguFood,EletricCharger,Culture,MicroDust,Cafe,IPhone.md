
![Untitled (8)](https://user-images.githubusercontent.com/67450169/203598924-2b212ac2-d844-413f-9498-ac33eb0af755.png)
## DaeguFood

```swift
import UIKit

struct Food : Codable {
    var status: String
    var total: String
    var data: [DataInfo]
}

struct DataInfo: Codable {
    var MNU: String
}

let url = URL(string: "https://mocki.io/v1/68e2942d-de2c-4987-87cd-53e29a560c70")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing")
//        print("\(error)")
        return
    }

    do {
        let myData = try JSONDecoder().decode(Food.self, from: data)
        for info in myData.data {
            print(info.MNU)
            print("---")
            
        }
    } catch {
        print("\(error)")
    }
}

task.resume()
```

## ElectricCharger

```swift
import UIKit

struct Charge : Codable {
    var info: InfoData
    
}
struct InfoData: Codable {
    var version: String
    var title: String
}

let url = URL(string: "https://infuser.odcloud.kr/oas/docs?namespace=15039557/v1")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing")
//        print("\(error)")
        return
    }

    do {
        let myData = try JSONDecoder().decode(Charge.self, from: data)
        print(myData.info)
            print("---")

    } catch {
        print("\(error)")
    }
}

task.resume()
```

## Culture

```swift
import UIKit

struct Culture : Codable {
    var subject: String
    var place: String
    var end_date: String
}

let url = URL(string: "https://mocki.io/v1/a1a97431-0d38-4d08-a4e7-01d5948960e2")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing")
        return
    }

    do {
        let myData = try JSONDecoder().decode([Culture].self, from: data)
        for info in myData {
            print("제목: \(info.subject)")
            print("장소: \(info.place)")
            print("종료일: \(info.end_date)")
            print("---")
        }

    } catch {
        print("\(error)")
    }
}

task.resume()
```

## MicroDust

```swift
import UIKit

struct Dust : Codable {
    var status: String
    var message: String
    var data: [dataInfo]
}

struct dataInfo: Codable {
    var name: String
    var loc: String
    var ison: Bool
}

let url = URL(string: "https://smartcity.gimhae.go.kr/smart_tour/dashboard/api/publicData/dustSensor")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing")
        return
    }

    do {
        let myData = try JSONDecoder().decode(Dust.self, from: data)
        for info in myData.data {
            print("이름: \(info.name)")
            print("위치: \(info.loc)")
            print("isOn: \(info.ison)")
            print("---")
        }

    } catch {
        print("\(error)")
    }
}

task.resume()
```

## Cafe

```swift
import Foundation

struct Cafe : Codable {
    var resultList: [Item]
    var totalCount: Int
    var message: String
}

struct Item: Codable {
    var areaName: String
    var title: String
    var address: String
    
}

let url = URL(string: "https://www.pettravel.kr/api/listArea.do?page=1&pageBlock=10&areaCode=AC01")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing")
//        print("\(error)")
        return
    }

    do {
        let myData = try JSONDecoder().decode([Cafe].self, from: data)
        
        for i in myData {
            for j in i.resultList {
                print(j.areaName)
                print(j.title)
                print(j.address)
                print("---")

            }
        }
        
        
    } catch {
        print("\(error)")
    }
}

task.resume()
```

### IPhone

```swift
import Foundation

// playground에서 URLSession 통신하려면 다음의 코드가 필요하다
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// 1. carData.json 파일을 mocki.io에 올린다. 
// 2. URLSession으로 데이터를 가져와 바로 출력이 가능한지 살펴본다
// 3. 차 이름들만 출력되도록 만들어본다
// 4. 목록 데이터들을 더 활용해서 차 이름과 설명, 하이브리드 여부를 print로 출력하도록 한다

struct IPhone : Codable {
    var Models: [Models]
    var Generation: String
}

struct Models: Codable {
    var Color: String
    var Storage: String
    var Model: [String]
    
}

let url = URL(string: "https://mocki.io/v1/80857d90-2e06-4b58-9e08-e5801ac2cc04")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data, response, error을 활용한 데이터 가져온 이후의 작업
    
    // data가 nil로서 옵셔널 바인딩에서 else처리 된다면 끝
    guard let data else {
        print("nothing")
//        print("\(error)")
        return
    }

    do {
        let myData = try JSONDecoder().decode([IPhone].self, from: data)
        
        for i in myData {
            print("Generation:\(i.Generation)")
            for j in i.Models {
                print(j.Color)
                print(j.Storage)
                print(j.Model)
                print("-------------------------------------------")
            }
        }
        
        
    } catch {
        print("\(error)")
    }
}

task.resume()
```

## 강사님 코드

```swift
import Foundation

// playground에서 URLSession 통신하려면 다음의 코드가 필요하다
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

struct CovidCenters: Codable {
    var currentCount: Int
    var data: [CovidCenter]
    var matchCount: Int
    var page: Int
    var perPage: Int
    var totalCount: Int
}

struct CovidCenter: Codable {
    var address: String
    var centerName: String
    var centerType: String
    var sido: String
}

func loadJson<T: Decodable>(data: Data) -> T {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse data: \(error)")
    }
}

let url = URL(string:"https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=10&serviceKey=IqV8U3oL39Xq5A1gSbKYKHnRESAPgGu397bHbKxmiAlqiHoR1Zkf5yNLne8Xtc%2B9MEt8XKceRDvE%2F%2Bu4%2Fn6rbQ%3D%3D")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    guard let data else {
        print("data - not found")
        return
    }
    
    let dataToString = String(data: data, encoding: .utf8)!
    print("\(dataToString)")
    
    let centers: CovidCenters = loadJson(data: data)
    print("\(centers)")
    print("currentCount: \(centers.currentCount)")
    print("matchCount : \(centers.matchCount)")
    
    let centerList = centers.data
    
    for center in centerList {
        print("\(center.centerName)")
        print("\(center.sido)")
        print("\(center.address)")
        print("\(center.centerType)")
        print("------------------------")
    }
}

task.resume()
```

![Untitled (9)](https://user-images.githubusercontent.com/67450169/203598969-fd5fb552-11b7-4974-b754-b0ed23411d7c.png)
