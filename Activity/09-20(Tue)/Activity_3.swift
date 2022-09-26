import Foundation

let team: [String] = [
    "sj","jh","sm","yw","hg","sj","hs",
    ]
var counter: Int = 1
for teamName in team {
    switch teamName {
    case "jw":
        print(1)
    case "jh":
        print(2)
    case "sj":
        print(3)
    case "sj":
        print(4)
    case "hg":
        print(5)
    case "hs":
        print(6)
    case "sm":
        print(7)
    case "hg":
        print(8)
    default:
        break
    }
    
}