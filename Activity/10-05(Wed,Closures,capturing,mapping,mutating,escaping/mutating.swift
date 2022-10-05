// mutating을 알아보자

class SomeClass {
    var name: String = ""
    
    func changeName(newName: String) {
        self.name = newName
    }
}

var someThingByClass = SomeClass()
someThingByClass.changeName(newName: "ned")
print("someThingByClass.name = \(someThingByClass.name)")


struct SomeStruct {
    var name: String = ""
    
    // 이 메소드에 의해서 프로퍼티가 바뀔 수 있음을 알리기 위해 mutating을 앞에 붙인다
    mutating func changeName(newName: String) {
        self.name = newName
    }
}

var someThingByStruct = SomeStruct()
someThingByStruct.changeName(newName: "뽀뽀로")
print("someThingByStruct.name = \(someThingByStruct.name)")