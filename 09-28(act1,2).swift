import Foundation

protocol Device {
    var name: String {get}
    var color : String {get set}
    func buildMemoText() -> String
}

class MyComputer : Device {
    //여러분의 구현 코드는 여기에...
    var myColor = "grey"
    var kind: String = ""
    var dateOfPurchase: String = ""
    var price : Int = 0
    
    init(kind : String)
    {
        self.kind = kind
    }
    
    var name : String {
        get{
            return "MacBook Pro 2021"
        }
    }
    
    var color: String{
        get{
            return myColor
        }
        set{
            myColor = newValue + myColor
        }
    }
    
    
    func displayComputer() -> String{
        return "\(kind), \(dateOfPurchase), \(price)"
    }
    
    func buildMemoText() -> String {
        return "name : \(name), color: \(color)"
    }
    
}

class MyNotebook : MyComputer {
    var usedBatteryCycles : Int = 0
    override func displayComputer() -> String {
        return super.displayComputer() + "\(usedBatteryCycles)"
    }
}
//var myMac: MyComputer = MyComputer(kind:"MacBook")
//myMac.dateOfPurchase = "2022-04-01"
//myMac.price = 100
//print("information: \(myMac.displayComputer())")
//myMac.color = "Space"
//print(myMac.buildMemoText())

var myNotebook : MyNotebook = MyNotebook(kind:"MacBook Pro")
myNotebook.dateOfPurchase = "2022-09-27"
myNotebook.price = 160
myNotebook.usedBatteryCycles = 32
    //객체의 모든 정보(프로퍼티)출력 - 종류,구매일,가격,사용된 배터리 사이클 등
print("information:\(myNotebook.displayComputer())")

extension MyNotebook {
    func reaminBatteryCycles() -> Int {
        return 100 - self.usedBatteryCycles
    }
}

print("remainBatteryCycles: \(myNotebook.reaminBatteryCycles())")