import Foundation

@propertyWrapper
struct Lowercase{
    private var name : String = ""
    var wrappedValue : String{
        get{name}
        set{name = newValue.lowercased()}
    }
        init(wrappedValue initialValue: String){
        wrappedValue = initialValue
        }
}


protocol Device {
    var name: String {get}
    var color : String {get set}
    func buildMemoText() -> String
}

struct MyComputer : Device {
    //여러분의 구현 코드는 여기에...
    @Lowercase var  myColor = "grey"
    @Lowercase var  kind: String = ""
    @Lowercase var  dateOfPurchase: String = ""
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

var myStruct1Mac = MyComputer(kind:"MacBook Pro")
var myStruct2Mac = myStruct1Mac
print(myStruct1Mac.kind)
print(myStruct2Mac.kind)
print("\n")
myStruct2Mac.kind = "MacBook Air"
print(myStruct1Mac.kind)
print(myStruct2Mac.kind)
print("\n")