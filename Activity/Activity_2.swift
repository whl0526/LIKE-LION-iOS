import Foundation

let team: [String] = [
    "sj","jh","sm","yw","hg","sj","hs",
    ]
var counter: Int = 1
for teamName in team {
    if counter <= 3{
        print("hi \(teamName)")
    } else {
        print("hihi \(teamName)")
    }
    counter += 1
}