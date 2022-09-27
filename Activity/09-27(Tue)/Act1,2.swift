import Foundation

protocol Device {
    var name: String {get}
    var color : String {get set}
    func buildMemoText() -> String
}

class MyComputer : Device {
    //여러분의 구현 코드는 여기에...
    var colors = "grey"
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
            return colors
        }
        set{
            colors = newValue + colors
        }
    }
    
    
    func displayComputer() -> (String, String, Int){
        return (kind,dateOfPurchase,price)
    }
    
    func buildMemoText() -> String {
        return "name : \(name), color: \(color)"
    }
}
    var myMac: MyComputer = MyComputer(kind:"MacBook")
    myMac.dateOfPurchase = "2022-04-01"
    myMac.price = 100
    print("information: \(myMac.displayComputer())")
    myMac.color = "Space"
    print(myMac.buildMemoText())
