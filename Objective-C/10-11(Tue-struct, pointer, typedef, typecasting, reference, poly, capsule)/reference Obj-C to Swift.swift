import Foundation
class Person {
    var personName: String = ""
    var personAge: Int = 0
    
    init(name: String, age: Int) {
        self.personName = name
        self.personAge = age
    }
    func Info() {
        print("이름 \(personName)")
        print("나이 \(personAge)")
    }
}

class Employee : Person {
    var employeeEdu: String = ""
    
    init(name: String, age: Int, education: String) {
        super.init(name: name, age: age)
        self.employeeEdu = education
    }
    
    override func Info() {
        super.Info()
        print("교육 : \(employeeEdu)")
    }
    
}
var person: Person = Person(name: "wh1", age: 1)
var employee : Employee = Employee(name: "wh2", age: 2, education: "dev")
person.Info();
employee.Info();