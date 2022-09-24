import Foundation

var arr1 : [Int] = [12,8,10,5,7,4,]
for num in arr1{
    var equal = ""
    
    for _ in  1...num{
        equal += "="
    }
    print("\(arr1.firstIndex(of:num)! + 1)", equal, num)
    
}