import Foundation

//1
let names : [String] = [
    "승","성","진","석","예","형","혜",
]

func greeting(name : String ) -> (){
    print("hi, \(name)")
    }
greeting(name : "원")

//2
func greeting2(names: [String]) -> (){
    for name in names{
        greeting(name:name)    
}
}

//3
func greeting3(names: [String], index: Int)-> (){
    greeting(name: names[index])
}


//4
func greeting4(names : [String], index : Int)-> String{
    var greeting5 = "hi :"
    greeting5 += names[index]
    return greeting5
}

//5
func greeting6(names : [String], index: Int) -> (String, Int){
    return(names[index],index)
}

//6
func greeting7(names: String...) ->(){
    for name in names{
        greeting(name: name)
    }
}
print("act2,")
greeting2(names:names)
print("\n")
print("act3,")
greeting3(names:names,index:1)
print("\n")
print("act4,")
print(greeting4(names: names,index:3))
print("\n")
print("act5,")
let act5 = greeting6(names: names, index:3)
print("hi: \(act5.0), \(act5.1)")
print("\n")
print("act6,")
print(greeting7(names: "0","1"))