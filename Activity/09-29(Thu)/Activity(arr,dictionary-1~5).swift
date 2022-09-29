import Foundation

//1
let teamNameArray10 = [String]([
    "SeungJun",
    "Yewon",
    "JinHyung",
    "Wonhyeong",
    "Hyunggu",
    "Hyesung",
    "SeokJun",
    "Ted"
])
for name in teamNameArray10 {
    print("\(name)")
}
print("-----------------------------------------------------\n")
//2
let teamNameArray11 = [String]([
    "eunno",
    "jeonghoon",
    "minkyoung",
    "yeseul",
    "junho",
    "keunsub",
    "jonghyeon",
])
let together = teamNameArray10 + teamNameArray11
for name in together {
    print("\(name)")
}
print("-----------------------------------------------------\n")
//3
var teamFavoriteArtists10 : [String:String] = [
    "SeungJun": "joji",
    "Yewon": "Day 6",
    "JinHyung": "Jay Park",
    "Wonhyeong": "Post Malone",
    "Hyunggu": "IU",
    "Hyesung": "Crush",
    "SeokJun": "The Weekend",
    "Ted" :"J.Cole",
    
]
for (name,artist) in teamFavoriteArtists10 {
    print("name :\(name), artist : \(artist) ")
}
print("-----------------------------------------------------\n")
    


//4
var teamFavoriteArtists11 : [String:String] = [
    "eunno":"Rihnna",
    "jeonghoon":"Post Malone",
    "minkyoung":"10cm",
    "yeseul":"None",
    "junho":"AKMU",
    "keunsub":"jannabi",
    "jonghyeon":"neroconnection",
]

let mergeteam = teamFavoriteArtists10.merging(teamFavoriteArtists11){(_, new) in new}
print(mergeteam)
print("-----------------------------------------------------\n")


//5
var i = 0
var NewDic = [Int : String]()
for j in teamFavoriteArtists10.values{
    NewDic[i] = j
    i += 1
}
for (key,value) in NewDic{
    print(key,value)
}
print("-----------------------------------------------------\n")


//5 etc..
var OhItsMyFaultArtist10 : [String] = [
    "joji",
    "Day 6",
    "Jay Park",
    "IU",
    "Crush",
    "The Weekend",
    "J.Cole",
]
var keyNumber = Dictionary(uniqueKeysWithValues: zip(1...,OhItsMyFaultArtist10))
for (key,value) in keyNumber {
    print(key,value)
}