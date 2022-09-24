import Foundation

var index: Int = 0


for index in 1...100{
    guard index % 5 == 0 else{
        continue
    }
    print(index)
}