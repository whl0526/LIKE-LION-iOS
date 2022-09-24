import Foundation

let team: [String] = [
    "sj","jh","sm","yw","hg","sj","hs",
]
var counter: Int = 1
for teamName in team {
    switch teamName {
    case "yw", "jh", "sm", "sj":
        print(1)
    case "sj", "wh", "hg", "hs":
        print(2)
    default:
        break
    }
}