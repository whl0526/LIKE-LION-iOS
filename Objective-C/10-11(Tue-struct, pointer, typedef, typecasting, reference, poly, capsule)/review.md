
![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0b99b982-2a44-4dd4-a002-023a6b2acb33/Untitled.png)

## 🔸구조체

배열을 사용하면 같은 종류의 여러 데이터 항목을 보유할 수 있는 변수 유형을 정의할 수 있지만 

구조체는 다른 종류의 데이터 항목을 결합할 수 있는 objec-c 프로그래밍에서 사용할 수 있는 또 다른 사용자 정의 데이터 유형입니다.

## 🔸구조체 정의

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/382e9b77-4f26-46af-9bec-b5e9e4dcb793/Untitled.png)

- 구조체 태크는 선택사항이며 각 멤버 정의는 int i 와 같은 일반 변수 정의입니다.
- 또는 float f; 또는 다른 유효한 변수 정의. 구조 정의 끝에서 마지막 세미콜론 앞에 하나 이상의 구조 변수를 지정할 수 있지만 선택 사항입니다.
- Book 구조를 선언하는 방법은 다음과 같습니다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bb3f7d80-e0c4-4211-a258-2dc656861f7a/Untitled.png)

## 🔸구조체 정의

구조체 멤버 접근 

```objectivec
//
//  main.m
//  HelloObjC
//
//  Created by 이원형 on 2022/10/11.
//

#import <Foundation/Foundation.h>

struct Books{
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
    
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Books book1;
        struct Books book2;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"c언어 학습 공식도서";
        book1.bookId = 1234567;
        
        NSLog(@"%@",book1.title);
        NSLog(@"%@",book1.author);
        NSLog(@"%@",book1.subject);
        NSLog(@"%@",book1.bookId);
        
        
        
        
            }
    return 0;
}
```

함수의 인수로서의 구조체

```objectivec
//
//  main.m
//  HelloObjC
//
//  Created by 이원형 on 2022/10/11.
//

#import <Foundation/Foundation.h>

struct Books{
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
    
};

@interface SampleClass : NSObject
-(void)printBookinfo:(struct Books)book;
@end

@implementation SampleClass
-(void)printBookinfo:(struct Books)book;{
    NSLog(@"%@", book.title);
    NSLog(@"%@", book.author);
    NSLog(@"%@", book.subject);
    NSLog(@"%d", book.bookId);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Books book1;
       // struct Books book2;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"c언어 학습 공식도서";
        book1.bookId = 1234567;
        
//        NSLog(@"%@",book1.title);
//        NSLog(@"%@",book1.author);
//        NSLog(@"%@",book1.subject);
//        NSLog(@"%d",book1.bookId);
        
        SampleClass *sampleClass = [[SampleClass alloc]init];
        [sampleClass printBookinfo:book1];
        
        
            }
    return 0;
}
```

---

## 🔸★★★구조체에 대한 포인터 ★★★

```objectivec
#import <Foundation/Foundation.h>

struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
};

@interface SampleClass : NSObject
- (void)updateBookInfoTitle:(struct Books)books;
- (void)printBookInfo:(struct Books)books;

- (void)updateBookTitle:(struct Books *)book;
- (void)descriptionBookInfo:(struct Books *)book;
@end

@implementation SampleClass

- (void)updateBookInfoTitle:(struct Books)books {
    books.title = @"Hello World";
}

- (void)printBookInfo:(struct Books)books {
    NSLog(@"%@", books.title);
    NSLog(@"%@", books.author);
    NSLog(@"%@", books.subject);
    NSLog(@"%d", books.bookId);
}

- (void)updateBookTitle:(struct Books *)books {
    books->title = @"Hello Objective-C";
}

- (void)descriptionBookInfo:(struct Books *)books {
    NSLog(@"%@", books->title);
    NSLog(@"%@", books->author);
    NSLog(@"%@", books->subject);
    NSLog(@"%d", books->bookId);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Books book1;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"C언어 학습 공식도서";
        book1.bookId = 1234567;
        
        SampleClass *sampleClass = [[SampleClass alloc] init];
        
        // 값으로 복제시킬 매개변수 - call by value
        [sampleClass updateBookInfoTitle:book1];
        [sampleClass printBookInfo:book1];
        
        // 포인터 참조값으로 알려주고 직접 건드리게 할 매개변수 - call by reference
        [sampleClass updateBookTitle:&book1];
        [sampleClass descriptionBookInfo:&book1];
    }
    return 0;
}
```

---

## 🔸typedef

```objectivec
#import <Foundation/Foundation.h>

/*
struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
};

typedef struct Books BOOK;
 
이렇게 나눠서 쓸 걸 한번에 쓰자면...
*/
typedef struct Books {
    NSString *title;
    NSString *author;
    NSString *subject;
    int bookId;
} BOOK;

@interface SampleClass : NSObject
- (void)updateBookInfoTitle:(BOOK)books;
- (void)printBookInfo:(BOOK)books;

- (void)updateBookTitle:(BOOK *)book;
- (void)descriptionBookInfo:(BOOK *)book;
@end

@implementation SampleClass

- (void)updateBookInfoTitle:(BOOK)books {
    books.title = @"Hello World";
}

- (void)printBookInfo:(BOOK)books {
    NSLog(@"%@", books.title);
    NSLog(@"%@", books.author);
    NSLog(@"%@", books.subject);
    NSLog(@"%d", books.bookId);
}

- (void)updateBookTitle:(BOOK *)books {
    books->title = @"Hello Objective-C";
}

- (void)descriptionBookInfo:(BOOK *)books {
    NSLog(@"%@", books->title);
    NSLog(@"%@", books->author);
    NSLog(@"%@", books->subject);
    NSLog(@"%d", books->bookId);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOK book1;
        
        book1.title = @"C언어 프로그래밍";
        book1.author = @"데니스 리치";
        book1.subject = @"C언어 학습 공식도서";
        book1.bookId = 1234567;
        
        SampleClass *sampleClass = [[SampleClass alloc] init];
        
        // 값으로 복제시킬 매개변수 - call by value
        [sampleClass updateBookInfoTitle:book1];
        [sampleClass printBookInfo:book1];
        
        // 포인터 참조값으로 알려주고 직접 건드리게 할 매개변수 - call by reference
        [sampleClass updateBookTitle:&book1];
        [sampleClass descriptionBookInfo:&book1];
    }
    return 0;
}
```

## 🔸typedef와 구조체

```objectivec
#import <Foundation/Foundation.h>

// Person 구조체를 정의해서 타입이름으로 쓰고 싶다면
typedef struct _Person {
    float height;
    int weight;
} Person;

// BMI 계산 함수
float calcBMI(Person person) {
    return person.weight / (person.height * person.height);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //struct _Person person;
        Person person;
        
        person.height = 1.65;
        person.weight = 55;
        
        
        NSLog(@"height : %f", person.height);
        NSLog(@"weight : %d", person.weight);
        NSLog(@"BMI : %f", calcBMI(person));
    }
    return 0;
}
```

## 🔸타입캐스팅

```objectivec
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int sum = 17;
        int count = 5;
        
        // int와 int의 나눗셈이라 int라고 결과를 생각할 수 있음
        NSLog(@"Value of mean : %d", (sum / count));
        
        // 강제로 위 계산 결과를 float값으로 각각 타입캐스팅 변환처리해준다면? 결과는 float 타입이 된다.
        NSLog(@"Value of mean : %f", ((float)sum / (float)count));
    }
    return 0;
}
```

---

## 🔸클래스와 개체

데이터 멤버 액세스

```objectivec
#import <Foundation/Foundation.h>

@interface Box : NSObject {
    double length;  // 길이
    double breadth; // 폭
    double height;  // 높이
}
//@property(nonatomic, readwrite) double length;
//@property(nonatomic, readwrite) double breadth;
@property(nonatomic, readwrite) double height;

- (double)volume;

@end

@implementation Box

// 선언된 프로퍼티를 가장 쉽게 구현부에서 만들어주는 방법
//@synthesize length;
//@synthesize breadth;
@synthesize height;

// 초기화 처리후 반환될 인스턴스는 id라고 통칭된다.
- (id)init {
    self = [super init];
    self->length = 1.0;
    self->breadth = 1.0;
    return self;
}

- (double)volume {
    return length * breadth * height;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box1 = [[Box alloc] init];
        Box *box2 = [[Box alloc] init];
        
        box1.height = 5.0;
        box2.height = 10.0;
        
        NSLog(@"Volume of Box1 : %f", [box1 volume]);
        NSLog(@"Volume of Box2 : %f", [box2 volume]);
    }
    return 0;
}
```

## 🔸상속

```objectivec
#import <Foundation/Foundation.h>

// Person 클래스 정의
@interface Person : NSObject {
    NSString *personName;
    NSInteger personAge;
}

- (id)initWithName:(NSString *)name andAge:(NSInteger)age;
- (void)print;
@end

@implementation Person

- (id)initWithName:(NSString *)name andAge:(NSInteger)age {
    self = [super init];
    
    personName = name;
    personAge = age;
    
    return self;
}

- (void)print {
    NSLog(@"Name: %@", personName);
    NSLog(@"Age: %ld", personAge);
}

@end

// Person을 상속받은 Employee 클래스 정의
@interface Employee : Person {
    NSString *employeeEducation;
}

- (id)initWithName:(NSString *)name andAge:(NSInteger)age andEducation:(NSString *)education;
- (void)print;

@end

@implementation Employee

- (id)initWithName:(NSString *)name andAge:(NSInteger)age andEducation:(NSString *)education {
    self = [super initWithName:name andAge:age];
    employeeEducation = education;
    return self;
}

- (void)print {
    [super print];
    NSLog(@"Educaiton: %@", employeeEducation);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *person = [[Person alloc] initWithName:@"Ned" andAge:13];
        [person print];
        
        Employee *employee = [[Employee alloc] initWithName:@"홍길동" andAge:15 andEducation:@"서당"];
        [employee print];
    }
    return 0;
}
```

## 🔸Activity 위에 Obj-C를 Swift로 바꾸어 보자!@#!@#

```swift
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
```

## 🔸다형성 Obj-C

```objectivec
#import <Foundation/Foundation.h>

// 윤곽 클래스 정의
@interface Shape : NSObject {
    CGFloat area;   // 넓이
}

- (void)printArea;
- (void)calculateArea;
@end

@implementation Shape

- (void)printArea {
    NSLog(@"The area is %f", area);
}

- (void)calculateArea {
    // 아직 모르겠음
}

@end

// 윤곽을 상속받은 정사각형 클래스 정의
@interface Square : Shape {
    CGFloat length; // 정사각형 변의 길이
}

- (id)initWithSide:(CGFloat)side;
- (void)calculateArea;
@end

@implementation Square

- (id)initWithSide:(CGFloat)side {
    self = [super init];
    length = side;
    return self;
}

- (void)calculateArea {
    area = length * length;
}

@end

// 윤곽을 상속받은 직사각형 클래스 정의
@interface Rectangle : Shape

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Shape *shape = [[Shape alloc] init];
        [shape printArea];
        
        Square *square = [[Square alloc] initWithSide:10.0];
        [square calculateArea];
        [square printArea];
    }
    return 0;
}
```

## 🔸위에 코드 cacultate, Rectangle 추가

```objectivec
#import <Foundation/Foundation.h>

// 윤곽 클래스 정의
@interface Shape : NSObject {
    CGFloat area;   // 넓이
}

- (void)printArea;
- (void)calculateArea;
@end

@implementation Shape
- (void)printArea {
    NSLog(@"The area is %f", area);
}

- (void)calculateArea {
    // 아직 모르겠음
}
@end

// 윤곽을 상속받은 정사각형 클래스 정의
@interface Square : Shape {
    CGFloat length; // 정사각형 변의 길이
}

- (id)initWithSide:(CGFloat)side;
- (void)calculateArea;
@end

@implementation Square
- (id)initWithSide:(CGFloat)side {
    self = [super init];
    length = side;
    return self;
}

- (void)calculateArea {
    area = length * length;
}
@end

// 윤곽을 상속받은 직사각형 클래스 정의
@interface Rectangle : Shape {
    CGFloat length;
    CGFloat breadth;
}

- (id)initWithLength:(CGFloat)length andBreadth:(CGFloat)breadth;
@end

@implementation Rectangle
- (id)initWithLength:(CGFloat)length andBreadth:(CGFloat)breadth {
    self = [super init];
    self->length = length;
    self->breadth = breadth;
    return self;
}

- (void)calculateArea {
    area = length * breadth;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Shape *shape = [[Shape alloc] init];
        [shape printArea];
        
        Square *square = [[Square alloc] initWithSide:10.0];
        [square calculateArea];
        [square printArea];
        
        Rectangle *rectangle = [[Rectangle alloc] initWithLength:10.0 andBreadth:5.0];
        [rectangle calculateArea];
        [rectangle printArea];
    }
    return 0;
}
```

## 🔸위에 코드 Obj-C 에서 Swift로 바꾸어보자!@#$%%

강사님 코드

```swift
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
```

## 🔸데이터 캡슐화

```objectivec
#import <Foundation/Foundation.h>

@interface Adder : NSObject
//@property(nonatomic, readonly) NSInteger total;

- (id)initWithInitialNumber:(NSInteger)initialNumber;
- (void)addNumber:(NSInteger)newNumber;
- (NSInteger)getTotal;

@end

@implementation Adder {
    NSInteger total;
}

//@synthesize total;

- (id)initWithInitialNumber:(NSInteger)initialNumber {
    self = [super init];
    total = initialNumber;
    return self;
}

- (void)addNumber:(NSInteger)newNumber {
    total = total + newNumber;
}

- (NSInteger)getTotal {
    return total;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Adder *adder = [[Adder alloc] initWithInitialNumber:10];
        [adder addNumber:5];
        [adder addNumber:4];
        
//        NSLog(@"The total is %ld", adder.total);
        NSLog(@"The total is %ld", [adder getTotal]);
    }
    return 0;
}
```

## 🔸카테고리

```objectivec
#import <Foundation/Foundation.h>

// 카테고리 만들기 예제
@interface NSString(MyAddtions)
+(NSString *)getCopyRightString;    // 저작권자 이름 알려주는 클래스 메서드
-(NSString *)getName;
@end

@implementation NSString(MyAddtions)

+(NSString *)getCopyRightString {
    return @"저작권자 멋쟁이사자처럼 2022";
}

-(NSString *)getName {
    return @"ned";
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [NSString getCopyRightString]);
        
        NSString *temp = [[NSString alloc] init];
        NSLog(@"%@", [temp getName]);
    }
    return 0;
}
```
