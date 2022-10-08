
## 🔸함수

Functions

- 함수는 작업을 함게 수행하는 명령문의 그룹입니다.
- 모든 objective-c프로그램에는  main() 이라는 하나의 c함수가 있으며 가장 사소한 프로그램은 모두 추가 함수를 정의할 수 있습니다.
    - 코드를 별도의 기능으로 나눌 수 있습니다.
- 코드를 여러 기능으로 나누는 방법은 사용자에게 달려 있지만 논리적으로 구분은 일반적으로 각 기능이 특정 작업을 수행하도록 합니다.
- 함수 **선언**은 컴파일러에게 함수의 이름, 반환 유형 및 매개변수에 대해 알려줍니다.
    - 함수 **정의**는 함수의 실제 본문을 제공합니다.
    - 기본적으로 objective0-c에서는 함수를 메서드라고 부릅니다.
- objective-c 기반 프레임워크는 프로그램에서 호출할 수 있는 수많은 기본 제공 메서드를 제공합니다.
    - Ex), 다른 문자열에 문자열을 추가하려면 **appendString() 메서드**를 사용합니다.
- 메소드는 함수, 서브루틴, 프로시저 등과 같이 다양한 이름으로 알려져 있습니다.

---

## 🔸메서드 정의

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/09307175-cbdd-4a79-a418-01aba870b29d/Untitled.png)

## 🔸메서드 정의

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/959cab51-9638-4352-b63e-6119ee9ffcb4/Untitled.png)

```objectivec
#import <Foundation/Foundation.h>

@interface MyNumber: NSObject
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2;
@end

@implementation MyNumber
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2 {
    
    int result;
    
    if (num1 > num2) {
        result = num1;
    } else {
        result = num2;
    }
    
    return result;
}
@end

int main (int argc, const char * argv[])
{
    MyNumber *num = [[MyNumber alloc] init];
    int maxNum = [num getMaxiumNumberWithFirstNumber:13 secondNumber:10];
    printf("%d", maxNum);
   return 0;
}
```

## 🔸메서드 선언

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/82ca8b8b-6bcb-42a5-b5d2-67899f88b38d/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0c5653d8-7ed1-4aca-aed7-39d6ee6f4b18/Untitled.png)

## 🔸메서드 호출

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b848569c-2c00-452a-a087-25d33e981ad9/Untitled.png)

---

## 🔸함수의 인수

- 함수가 인수를 사용하려면 인수값을 허용하는 변수를 선언해야 하니다. 이러한 변수를 함수의 **형식 매개변수**라고 합니다.
- 형식의 매개변수는 함수 내부의 다른 지역 변수처럼 작동하며 함수에 들어갈 때 생성되고 종료할 때 소멸됩니다.
- 함수를 호출하는 동안 인수를 함수에 전달할 수 있는 두 가지 방법이 있습니다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e52045a1-ed6b-4f95-989a-4f3ca2a1d842/Untitled.png)

```objectivec
#import <Foundation/Foundation.h>

@interface MyNumber: NSObject
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2;
- (NSString *)getHello;
@end

@implementation MyNumber
- (int)getMaxiumNumberWithFirstNumber:(int)num1 secondNumber:(int)num2 {
    
    int result = num1 > num2 ? num1: num2;
    
    return result; // call by value
}

- (NSString *)getHello {
    NSString *hello = @"Hello World";
    return hello; // call by reference
}
@end

int main (int argc, const char * argv[])
{
    MyNumber *num = [[MyNumber alloc] init];
    int maxNum = [num getMaxiumNumberWithFirstNumber:13 secondNumber:20];
    NSLog(@"%d", maxNum);
    
    NSString *hello = [num getHello];
    NSLog(@"%@", hello);
   return 0;
}
```

---

## 🔸블록(클로저의 조상님)

- objective-c 클래스는 관련 동작과 데이터를 결합하는 개체를 정의합니다.
- 때로는 메서드 모음이 아니라 단일 작업이나 동작 단위를 나타내는 것이 합리적입니다.

- 블록은 c,objective-c 및 c++에 추가된 언어 수준 기능으로, 이를 통해 마치 값인 것처럼 메서드나 함수에 전달할 수 있 고유한 코드 세그먼트를 만들 수 있습니다.
- 블록은 NSArray 또는 NSDictionary와 같은 컬렉션에 추가할 수 있음을 의미하는 objective-c 개체입니다
- 또한 엔클로징 범위에서 값을 캡처하여 다른 프로그래밍 언어의 **클로저** 또는 **람다**와 유사하게 만드는 기능이 있습니다.

---

## 🔸단순 블록 선언 구문

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fcd1ca79-b3e5-4dac-8be4-2b10dc7d457b/Untitled.png)

- 간단한 블록 구현

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/73b687e5-70c2-4a21-a14b-5e09643ac116/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/32a9334b-c496-4486-9770-12bbc034d129/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6782b598-a02d-454a-a751-5353d4280256/Untitled.png)

---

## 🔸 유형 정의를 사용하는 블록

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c8ea8771-43c2-47f4-8cf7-6587c9e83c99/Untitled.png)

---

```objectivec
#import <Foundation/Foundation.h>

// C언어 스타일의 함수
double multiplyTwoValuesOrgin(double firstValue, double secondValue)
{
    return firstValue * secondValue;
}

// Block으로 다시 위 함수를 써본다면
// Block의 이름은 (^multiplyTwoValues)(double, double)
// Block의 실제 작동내용은 ^{ ... }으로 구현
double (^multiplyTwoValues)(double, double) = ^(double firstValue, double secondValue){
    return firstValue * secondValue;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        double myNum = multiplyTwoValues(2, 4);
        NSLog(@"%f", myNum);
    }
    return 0;
}
```

---

```objectivec
#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)();

@interface SampleClass: NSObject
- (void)performActionWithCompletion:(CompletionBlock)completionBlock;
@end

@implementation SampleClass

- (void)performActionWithCompletion:(CompletionBlock)completionBlock {
    NSLog(@"Action performed");
    completionBlock();
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        SampleClass *sampleClass = [[SampleClass alloc] init];
        [sampleClass performActionWithCompletion:^{
            NSLog(@"Completion is called to intimate action is performed.");
        }];
    }
    return 0;
}
```

---

## 🔸 숫자

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/effa5b10-f8f9-4c81-8d11-287865f96240/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/baca8a98-1980-4969-a8ef-e6be6f727c28/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cca26739-b97b-4268-9ebf-f598b0cbe0a2/Untitled.png)

---

```objectivec
#import <Foundation/Foundation.h>

// Foundation이 제공하는 NSObject를 상속받은 SampleClass는 이러한 내용을 구현합니다.
@interface SampleClass : NSObject
- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b;
@end

// SampleClass의 구체적인 내용은 다음과 같습니다.
@implementation SampleClass

- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b {
    
    // NSNumber 타입으로 받은 a와 b로부터 float 값들을 꺼내서 곱셈한 후
    float number1 = [a floatValue];
    float number2 = [b floatValue];
    float product = number1 * number2;
    
    // 결과를 NSNumber로 다시 만들어 반환한다.
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        // swift였다면 ... var sampleClass: SampleClass = SampleClass()
        SampleClass *sampleClass = [[SampleClass alloc] init];
        
        NSNumber *a = [NSNumber numberWithFloat:10.5];
        NSNumber *b = [NSNumber numberWithFloat:10.0];
        NSNumber *result = [sampleClass multiplyA:a withB:b];
        
        // 결과의 NSNumber로부터 NSString를 만들어 활용한다.
        NSString *resultString = [result stringValue];
        NSLog(@"The product is %@", resultString);
    }
    return 0;
}
```

---

## 🔸 배열

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/135d7a50-b420-4756-a711-f908f8bcdc13/Untitled.png)

## 🔸 배열선언

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3084c61b-939a-43a4-b485-5e2a5e4c1025/Untitled.png)

---

```objectivec
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int myArray[10];    // 10개의 int값이 들어갈 배열 선언
        int i, j;           // for 반복문에 활용
        
        for (i = 0; i < 10; i++) { // i는 0..<10 구간으로 증가하며 반복
            myArray[i] = i + 100;
        }
        
        for (j = 0; j < 10; j++) {
            NSLog(@"Element[%d] = %d\n", j, myArray[j]);
        }
        
    }
    return 0;
}
```

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ccac5804-c864-4807-8c72-59eedee69f69/Untitled.png)

---

## 🔸 포인터 pointer

```objectivec
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    int age = 13;
    double height = 145.32;
    
    // 변수에 담긴 값을 출력
    NSLog(@"value of age : %d", age);
    NSLog(@"value of hegith : %f", height);
    
    // 변수가 위치한 메모리 안에서의 주소
    NSLog(@"address of age : %x", &age);
    NSLog(@"address of height : %x", &height);
    
    // 포인터 정보 = 해당 데이터의 메모리 주소 + 메모리를 차지하는 크기
    // 토지대장 = 주소지(경상북도 울릉군...) + 몇 평수 정보(임야 13평)
    
    return 0;
}
```

```objectivec
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 포인터 정보 = 해당 데이터의 메모리 주소 + 메모리를 차지하는 크기
    // 토지대장 = 주소지(경상북도 울릉군...) + 몇 평수 정보(임야 13평)

    int index = 17;
    printf("i stores its value at %x\n", &index);
    printf("this function starts at %x\n", &main);
    
    return 0;
}
```

```objectivec
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 포인터 정보 = 해당 데이터의 메모리 주소 + 메모리를 차지하는 크기
    // 토지대장 = 주소지(경상북도 울릉군...) + 몇 평수 정보(임야 13평)

    int age = 17;
    
    // 변수 age의 주소를 확인해서, int 타입이 담길 거라고 생각하는 포인터 변수 만들기
    int *addressOfAge = &age;
    
    NSLog(@"age는 %p 주소에 위치했습니다.", addressOfAge);
    NSLog(@"%p 주소에 가보니 %d 값이 들어있습니다.", addressOfAge, *addressOfAge);
    
    /*
     출력문:
     age는 0x16fdff3ac 주소에 위치했습니다.
     0x16fdff3ac 주소에 가보니 17 값이 들어있습니다.
     */
    
    return 0;
}
```

```objectivec
#import <Foundation/Foundation.h>

@interface SampleClass : NSObject
- (void)sayHello;
@end

@implementation SampleClass
- (void)sayHello {
    NSLog(@"Hello World");
}
@end

int main(int argc, const char * argv[]) {
    // 포인터 정보 = 해당 데이터의 메모리 주소 + 메모리를 차지하는 크기
    // 토지대장 = 주소지(경상북도 울릉군...) + 몇 평수 정보(임야 13평)

    int age = 17;
    
    // 변수 age의 주소를 확인해서, int 타입이 담길 거라고 생각하는 포인터 변수 만들기
    int *infoOfAge = &age;
    
    NSLog(@"age는 %p 주소에 위치했습니다.", infoOfAge);
    // age는 0x16fdff3ac 주소에 위치했습니다.
    
    NSLog(@"int 타입의 메모리 크기는 %zu 바이트입니다.", sizeof(int));
    // int 타입의 메모리 크기는 4 바이트입니다.
    NSLog(@"변수 age의 메모리 크기는 %zu 바이트입니다.", sizeof(age));
    // 변수 age의 메모리 크기는 4 바이트입니다.
    NSLog(@"처음 %p 주소에 가보니 %d 값이 들어있습니다.", infoOfAge, *infoOfAge);
    // 처음 0x16fdff3ac 주소에 가보니 17 값이 들어있습니다.
    
    *infoOfAge = 32;
    NSLog(@"다시 %p 주소에 가보니 %d 값이 들어있습니다.", infoOfAge, *infoOfAge);
    // 다시 0x16fdff3ac 주소에 가보니 32 값이 들어있습니다.
    
    NSLog(@"int를 담은 데이터의 포인터정보 크기는 %zu 바이트입니다.", sizeof(int *));
    // int를 담은 데이터의 포인터정보 크기는 8 바이트입니다.
    NSLog(@"%p를 가르키는 정보의 메모리 크기는 %zu 바이트입니다.", infoOfAge, sizeof(infoOfAge));
    // 0x16fdff3ac를 가르키는 정보의 메모리 크기는 8 바이트입니다.
    
    
    // SampleClass의 인스턴스를 만들어서
    // 그 메모리의 위치 정보를 SampleClass클래스에 맞춘 포인터 변수 sampleClass에 할당한다
    // 클래스에 의해 만들어지는 인스턴스는 무조건 포인터 단위로 관리해야만 활용 가능하다.
    SampleClass *sampleClass = [[SampleClass alloc] init];
    
    // sampleClass 포인터 정보가 가르키는 인스턴스 데이터를 찾아가서
    // 데이터에 명시된 sayHello 메소드를 실행하라
    [sampleClass sayHello];
    
    
    return 0;
}
```

---

## 🔸 문자열

- objective-c 프로그래밍 언어의 문자열 NSString을 사용하여 표현되며 하위 클래스 NSMutableString은 문자열 개체를 생성하는 여러 방법을 제공합니다.
- 문자열 개체를 만드는 가장 간단한 방법은 objective-c @”…” 구문을 사용하는 것입니다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1041065d-d790-4a17-bf54-6d408126e260/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/85196ada-2d96-43c1-967c-b796f3dee710/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/64560729-5820-4406-87e9-884d5f695545/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/36f9961c-278f-454e-a3f3-ad45e2b9cc04/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b0e862d3-b5ae-4a73-bd33-f15862c47b94/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/aaa50c25-8c6c-42e1-91e3-deccc83458b5/Untitled.png)

---
