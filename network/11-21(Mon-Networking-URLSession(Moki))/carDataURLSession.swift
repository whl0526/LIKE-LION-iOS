
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
        for car in posts{
            print("\(car.name)")
            print("\(car.description)")
            print("\(car.isHybrid)")
            print("---------------------------")

        }
//        print(posts.map { $0.name })
//        print("-------------------------------------------------")
//        print(posts.map { $0.description})
//        print("-------------------------------------------------")
//        print(posts.map { $0.isHybrid})
//        print("-------------------------------------------------")
        PlaygroundPage.current.finishExecution()
    }
    catch {
        print("Error: \(error.localizedDescription)")
        return
    }
}.resume()
