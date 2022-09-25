import Foundation


var team :[String:Int] = [
    "Jane": 5,
    "Kei": 7,
    "Alex" : 1,
]

for (name,index) in team{
    print("Index: \(index), Name: \(name)")
}