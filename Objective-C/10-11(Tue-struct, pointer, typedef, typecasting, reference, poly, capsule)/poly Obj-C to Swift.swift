class Shape {
    var area: CGFloat = 0.0
    
    func printArea() {
        print("The area is \(area)")
    }
    
    func calculateArea() {
        // 아직 모르겠음
    }
}

class Square: Shape {
    var length: CGFloat = 0.0
    
    init(side: CGFloat) {
        super.init()
        length = side
    }
    
    override func calculateArea() {
        super.calculateArea()
        area = length * length
    }
}

class Rectangle: Shape {
    var length: CGFloat = 0.0
    var breadth: CGFloat = 0.0
    
    init(length: CGFloat, breadth: CGFloat) {
        super.init()
        self.length = length
        self.breadth = breadth
    }
    
    override func calculateArea() {
        super.calculateArea()
        area = length * breadth
    }
}

let square: Square = Square(side: 10.0)
square.calculateArea()
square.printArea()

let rectangle: Rectangle = Rectangle(length: 10.0, breadth: 5.0)
rectangle.calculateArea()
rectangle.printArea()