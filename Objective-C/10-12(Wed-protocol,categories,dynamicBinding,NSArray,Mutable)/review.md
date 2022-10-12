
## 🔸프로토콜

```objectivec
#import <Foundation/Foundation.h>

// Objective-C에서는 이런 일을 해줄 클래스를 찾는다면서 Delegate라고 표현한다.
// (Delegate: 위임자, 대행자)
@protocol PrintProtocolDelegate
@optional
- (void)processCompleted;
@end

@interface PrintClass : NSObject {
    // 내가 위임자로서 그 일을 하겠다는 데가 있으면 그게 바로 delegate
    // id는 "어떤 Objective-C 객체를 가리키는 포인터"
    id delegate;
}

// 이 클래스가 원하는 일을 대신 해줄 delegate 객체를 지정하는 메서드
- (void)setDelegate:(id)newDelegate;
- (void)printDetails;
@end

@implementation PrintClass

- (void)setDelegate:(id)newDelegate {
    delegate = newDelegate;
}

- (void)printDetails {
    NSLog(@"Print Details");
    
    // deleage 객체가 PrintProtocolDelegate 프로토콜을 잘 따른다면
    // processCompleted 메서드가 있기 때문에 호출 가능하다
    // 더 확실히 하기위해 해당 메서드가 실행가능한지 체크해보는 습관이 좋다.
    if ([delegate respondsToSelector:@selector(processCompleted)]) {
        [delegate processCompleted];
//        [delegate performSelector:@selector(processCompleted)];
    }
}

@end

@interface SampleClass : NSObject<PrintProtocolDelegate>
- (void)startAction;
@end

@implementation SampleClass

- (void)startAction {
    PrintClass *printClass = [[PrintClass alloc] init];
    
    // PrintClass 클래스로 만들어진 printClass 인스턴스 객체에게
    // 내가 너의 delegate가 되어줄께 라고 말해준다.
    // PrintProtocolDelegate 프로토콜을 따라주니까
    // PrintClass 클래스에서 요구하는 delegate 역할을 잘 해줄거라 기대한다.
    [printClass setDelegate:self];
    
    [printClass printDetails];
}

- (void)processCompleted {
    NSLog(@"Printing Process Completed");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SampleClass *sampleClass = [[SampleClass alloc] init];
        [sampleClass startAction];
    }
    return 0;
}
```

## 🔸obj-c에서 카테고리☑️만 알면된다. (익스텐션 X)

---

## 🔸객체, 카테고리, 익스텐션, 그리고 프로토콜 **(다시보기)**

BMI 계산

self

```objectivec
#import <Foundation/Foundation.h>

// BMI 계산

@interface Person : NSObject {
    float heightInMeter;
    int weightInKilos;
}
@property(nonatomic, readwrite) float heightInMeter;
@property(nonatomic, readwrite) int weightInKilos;

- (float)bodyMassIndex;
@end

@implementation Person

@synthesize heightInMeter;
@synthesize weightInKilos;

- (float)bodyMassIndex {
    // self는 메소드의 실행 주체가 되는 객체의 포인터다.
    // 객체가 자신에게 메시지를 보내야할 때 이 self가 사용된다.
    float height = [self heightInMeter];
    return [self weightInKilos] / ( height * height);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        person.heightInMeter = 1.5;
        person.weightInKilos = 50;
        NSLog(@"%f", [person bodyMassIndex]);
    }
    return 0;
}
```

## 🔸카테고리

 문자열 안의 모음 문자의 갯수를 알아보려는 카테고리

```objectivec
#import <Foundation/Foundation.h>

// 문자열 안의 모음 문자의 갯수를 알아보려는 카테고리
@interface NSString(VowelCounting)
- (int)vowelCount;
@end

@implementation NSString(VowelCounting)

- (int)vowelCount {
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSUInteger count = [self length];
    
    int sum = 0;
    int index = 0;
    
    for (index = 0; index < count; index++) {
        unichar charactor = [self characterAtIndex:index];
        if ([charSet characterIsMember: charactor]) {
            sum++;
        }
    }
    
    return sum;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"I'm your father";
        NSLog(@"%@ has %d vowels", string, [string vowelCount]);
    }
    return 0;
}
```

## 🔸동적 바인딩

- 동적 바인딩은 컴파일 시간이 아닌 런타임에 호출할 메서드를 결정합니다.
- 동적 바인딩은 후기 바인딩 이라고도 합니다.
- Obj-c에서 모든 메소드는 런타임에 동적으로 해결됩니다.
- 실행되는 정확한 코드는 메소드 이름(선택자)과 수신 객체에 의해 결정됩니다.
- 동적바인딩은 다형성을 가능하게 합니다.
- Ex), Rectangle 및 Square를 포함한 개체 컬렉션을 고려하십시오.
- 각 개체에는 고유한 printArea 메서드 구현이 있습니다.
- 다음 코드에서 [anObject printArea] 표현식에 의해 실행되어야 하는 실제 코드는 런타임에 결정됩니다.
- 런타임 시스템은 메서드 실행을 위한 선택기를 사용하여 Object의 클래스가 무엇이든 적절한 메서드를 식별합니다.

---

```objectivec
#import <Foundation/Foundation.h>

// 정사각형 정보를 담은 클래스
@interface Square : NSObject {
    float area; // 면적 정보를 담은 내부 변수(클래스 밖에서는 접근 불가)
}

- (void)calculateAreaOfSide:(CGFloat)side;  // 네 변의 길이가 같으므로 하나의 길이만 가져와도 면적 계산 가능
- (void)printArea; // 계산된 면적을 출력하는 메서드
@end

@implementation Square

- (void)calculateAreaOfSide:(CGFloat)side {
    area = side * side;
}

- (void)printArea {
    NSLog(@"The area of square is %f", area);
}
@end

// 가로 세로 길이가 별개인 일반적인 직사각형 정보의 클래스
@interface Reactangle : NSObject {
    float area; // 면적 정보를 담은 내부 변수(클래스 밖에서는 접근 불가)
}

- (void)calculateAreaOfLength:(CGFloat)length andBreadth:(CGFloat)breadth;
- (void)printArea; // 계산된 면적을 출력하는 메서드
@end

@implementation Reactangle

- (void)calculateAreaOfLength:(CGFloat)length andBreadth:(CGFloat)breadth {
    area = length * breadth;
}

- (void)printArea {
    NSLog(@"The area of reactangle is %f", area);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Square *square = [[Square alloc] init];
        [square calculateAreaOfSide:10.0];
//        [square printArea];
        
        Reactangle *reactangle = [[Reactangle alloc] init];
        [reactangle calculateAreaOfLength:10.0 andBreadth:5.0];
//        [reactangle printArea];
        
        // [object printArea] 메소드 실행은
        // 매번 object에 printArea 메소드가 각각 무엇인지 확인하고
        // 해당 매소드로 실행해서, 서로 다른 결과가 나올 수 있다.
        id object = square;
        [object printArea]; // The area of square is 100.000000
        
        object = reactangle;
        [object printArea]; // The area of reactangle is 50.000000
        
        object = square;
        [object printArea]; // The area of reactangle is 50.000000
    }
    return 0;
}
```

- 위의 ex에서 볼수 있듯이 printArea 메서드는 런타임에 동적으로 선택됩니다.
- 이는 동적 바인딩의 예이며 유사한 종류의 개체를 처맇라 때 많은 상황에서 매우 유용합니다.

## 🔸Foundation Framework

- 작은 기본 유틸리티 클래스 세트를 제공합니다.
- 할당 해제와 같은 일관도니 규칙을 도입하여 소프트웨어 개발을 더 쉽게 만듭니다.
- 유니코드 문자열, 개체 지속성 및 개체 배포를 지원합니다.
- 이식성 향상을 위해 OS 독립성 수준을 제공합니다.
- 프레임워크는 Apple이 인수한 NeXTStep 에서 개밟했으며 이러한 기초 클래스는 Mac OS X 및 iOS의 일부가 되었습니다.
- NeXTStep에 의해 개발되었기 때문에 클래스 접수다 “NS”가 있습니다.

---

## 🔸NSArray & NSMutableArray

```objectivec
#import <Foundation/Foundation.h>
int main() {
 NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
 NSArray *array = [[NSArray alloc]
 initWithObjects:@"string1", @"string2",@"string3",nil];
 NSString *string1 = [array objectAtIndex:0];
 NSLog(@"The object in array at Index 0 is %@",string1);
 
 NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
 [mutableArray addObject: @"string"];
 string1 = [mutableArray objectAtIndex:0];
 NSLog(@"The object in mutableArray at Index 0 is %@",string1); 
 
 [pool drain];
 return 0;
}
```
