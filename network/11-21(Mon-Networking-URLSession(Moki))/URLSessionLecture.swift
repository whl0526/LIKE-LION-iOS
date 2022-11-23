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
