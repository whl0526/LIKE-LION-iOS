import Foundation 

func getTemperature(temp:Float, isCalvin: Bool) -> Int {
    if isCalvin{
        let calvin = (temp - 32) * (5/9)
        return Int(calvin)
    }else{
        return Int(temp)
    }
}


let temperature = getTemperature(temp: 50, isCalvin: true) //화씨f

switch(temperature){
case 0...49:
    print("cold")
    
case 50...79:
    print("warm")
    
case 80...110:
    print("hot")
    
default:
    print("temperature out of range")
}