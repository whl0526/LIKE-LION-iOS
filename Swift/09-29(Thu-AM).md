![1.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2d479559-b5be-400d-9034-3095fe0951e8/1.png)

## 🔸구조체

- 앞서 배운 것
    - 서브클래싱
    - 상속
    - 익스텐션의 개념
- 이번에 배울 것
    - 구조체는 클래스와 비슷해보이지만, 어떤 것을 사용해야 할지를 결정할 때 이해해야 할 중요한 차이점들이 있다.
    - 구조체를 어떻게 선언하고 사용해야 하는지
    - 구조체와 클래스의 차이점
    - **값 타입**과 **참조 타입**에 대한 개념

## 🔸구조체개요

- 클래스처럼 구조체도 객체지향 프로그래밍의 기초를 형성ㅁ하며 데이터와 기능을 재사용할 수 있는 객체로 캡슐화하는 방법을 제공한다.
- 구조체 선언은 클래스와 비슷하지만, **class**키워드를 사용하는 대신에 **struct** 키워드를 사용한다는 점이 다르다.
- 예를 들어 다음은 String 변수와 초기화, 메서드로 구성된 간단한 구조체를 선언한다.

![3.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ac65edcd-9ea1-4304-b1a4-26aa78517de1/3.png)

---

- 앞의 구조체 선언부와 동일한 클래스 선언부를 비교해보자
- class 키워드 대신에 struct 키워드를 사용했다는 것을 제외하면 두 개의 선언부는 동일하다.
    
    ![5.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5f2b2e65-babf-4025-925b-cd7033bb83db/5.png)
    
    ---
    
- 각각의 인스턴스를 생성할 때도 동일한 문구를 사용

![7.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4f7d03f9-1d89-4681-a020-760ff3569953/7.png)

---

- 클래스와 마찬가지로 구조체도 확장될 수 있으며, 프로토콜을 채택하거나 초기화를 가질 수 있다.
- 클래스와 구조체의 공통점이 많이 때문에 서로가 어떻게 다른지를 이해하는 것이 중요하다.
- 가장 큰 차이점에 대해 알아보기 전에 값 타입과 참조 타입에 대한 개념을 이해하는 게 먼저다.

## 🔸값 타입 vs 참조 타입

- 겉으로 보기엔 구조체와 클래스는 비슷하지만, 구조체의 인스턴스와 클래스의 인스턴스가 복사되거나 메서드 또는 함수에 인자가 전달될 때 발생하는 동작의 큰 차이가 있다.
- 왜냐하면 구조체 인스턴스의 타입은 **값 타입**이고, 클래스의 인스턴스는 타입은 **참조 타입**이기 때문이다.
- 구조체 인스턴스가 복사되거나 메서드에 전달될 대 인스턴스의 실제 복사본이 생성되면서 원본 객체가 가지고 있던 모든 데이터를 그대로 복사해서 갖게 된다.
- 즉, 복사본은 원본 구조체 인스턴스와는 별개인 자신만의 데이터를 가진다는 의미다.
- 실제로 실행중인 앱 내의 구조체 인스턴스에 대한 복사본이 여러개 존재할 수 있으며, 각각의 복사본은 자신만의 데이터를 가질 수 있다는 말이다.
- 따라서 어떤 하나의 인스턴스를 변경해도 다른 복사본들에 영향을 미치지 않는다.

---

- 이와는 반대로, 클래스 인스턴스가 복사되거나 인자로 전달되면 해당 클래스 인스턴스가 있는 메모리의 위치에 대한 참조체가 만들어지거나 전달된다.
- 참조체를 변경하면 원본 인스턴스에도 동일한 작업이 수행된다.
- 다시말해, 단 하나의 클래스 인스턴스가 있고 그 인스턴스를 가리키는 여러개의 참조체가 존재하는 것이다.
- 참조체들 중 하나를 이용하여 인스턴스 데이터를 변경하면 모든 참조체의 데이터가 변경된다.

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cddad321-e9ec-4339-a63a-3520b546d439/Untitled.png)

![11.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6f82fea0-c822-48a9-a6c1-b70380cb3107/11.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/74ea9993-8e79-42bb-aee7-11434a83fcae/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ad9670f6-a193-471b-9709-844a490a75d9/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9d4f406f-875d-4168-b215-3b18a8c660a2/Untitled.png)

- 지금까지 봤던 값 타입과 참조 타입에 대한 차이점 뿐만 아니라 구조체는 클래스에 있던 상속이나 하위클래스를 지원하지 않는다.
- 다시 말해, 하나의구조체가 다른 구조체에 상속될 수 없다는 뜻이다.
- 클래스와는 다르게 구조체는 소멸자 메서드를 포함할 수 없다.
- 마지막으로, 런타임에서 클래스 인스턴스의 유형을 식별할 수 있지만 구조체는 그렇지 않다.

## 🔸구조체와 클래스는 `언제` 사용하는가

- 일반적으로 구조체가 클래스보다 효율적이고 멀티스레드 코드를 사용하는데 안정적이기 때문에 가능하다면 구조체를 권장한다.
- 하지만, 상속이 필요하거나 데이터가 캡슐화된 하나의 인스턴스가 필요할 때는 클래스를 사용해야 한다.
- 또한 인스턴스가 소멸될 때 리소스를 확ㅎ보하기 위한 작업이 필요할 때도 클래스를 사용해야 한다.

## 🔸다시 살펴보기

![15.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/63cfbdb9-68bc-4ab8-919c-683c3ae437c7/15.png)

## 🔸프로퍼티 및 메서드 구현

![24.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2134f448-cf0b-437a-8c40-2b3a629e3e90/24.png)

## 🔸구조체 사용

![18.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f4d8f18e-ae22-475c-bb56-22c35ae82ebc/18.png)

## 🔸학생 구조체 만들어보기

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/de17eda3-91a2-4b59-8498-33fe499f7c54/Untitled.png)

## 🔸요약

구조체

- 구조체와 클래스 모두는 프로퍼티를 정의하고, 값을 저장하며, 메서드를 정의할 수 있는 개체 생성 메커니즘을 제공한다.
- 두개의 메커니즘이 서로 비슷해보이지만, 구조체 인스턴스와 클래스 인스턴스가 복사되거나 메서드에 전달될 때는 중요한 차이점을 보인다.
- 구조체 인스턴스가 복사되거나 메서드로 전달되면 완전히 새로운 복사본이 생성되며, 복사본 자신의 데이터를 갖게 된다.
- 클래스만 갖는 고유한 기능은 상속과 소멸자를 지원한다는 것이며, 런타임에서 클래스 타입을 식별할 수 있다는 것이다.
- 클래스만의 기능이 필요하지 않다면 일반적으로는 클래스 대신에 구조체를 사용해야 한다.

## 🔸구조체 Activity

![22.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a1f6dc3c-859b-41a3-9b53-bc57dc1c8307/22.png)

![23.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/139f3200-3019-4c94-9a6c-f41fdf6e97fc/23.png)

```swift
import Foundation

protocol Device {
    var name: String {get}
    var color : String {get set}
    func buildMemoText() -> String
}

struct MyComputer : Device {
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
```

## 🔸구조체

- 앞서배운것
    - 클래스
    - 구조체
- 이번에 배울 것
    - 프로퍼티 래퍼(wrapper) 형태
    - Swift 5.1부터 나온 프로퍼티 래퍼는 클래스와 구조체 구현부에 게터, 세터,연산 프로퍼티 코드의 중복을 줄이는 방법을 제공한다.

## 🔸프로퍼티 래퍼 이해하기

- 클래스 || 구조체 인스턴스에 있는 프로퍼티에 값을 할당하거나 접근할 때 값을 저장하거나 읽어내기 전에 변환하거나 유효성 검사를 해야 할 경우가 종종 있다.
- 이 작업은 **연산프로퍼티**를 만들어서 구현할 수 있따.
- 그런데 **여러 클래스나 구조체에 생성한 연산 프로퍼티들이 유사한 패털을 갖는 경우**가 빈번하게 발생한다.
- Swift 5.1 이전에는 연산 프로퍼티 로직을 공유하는 유일한 방법이 해당 코드를 복사하여 각각의 클래스 구현부나 구조체 구현부에 포함시키는 것뿐이었다.
- 이것은 매우 비효율적일 뿐만 아니ㄹ, 계산 방법이 수정되는 일이 생기면 각각 클래스나 구조체에 복사해둔 연산 프로퍼티를 일일이 찾아 직접 수정해야 했다.
- 이러한 단점을 개선하기 위해서 swift 5.1은 **프로퍼티 래퍼**라는 기능을 도입하였다.
- 프로퍼티 래퍼는 기본적으로 연산 프로퍼티 기능을 개별 클래스와 구조체와 분리할 수 잇게 하며 ,앱코드에서 재사용할 수 있게한다.

## 🔸간단한 프로퍼티 래퍼 예제(흘려들어라!)

![26.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/686ea6f0-9ab3-40bf-babf-a9cd270c7243/26.png)

---

![27.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3c9fadef-1f61-4983-8c76-f5a75af1c7ec/27.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e48f0314-2802-47b4-8010-1c2fda9b7664/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4ed71846-77a7-47ac-bc69-46d3ef03bfe9/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/81821042-64f3-4bd7-b844-c9cf91f28bbc/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c321b56a-efb4-467b-bf97-9ec4e025725e/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4d74656c-9f13-467e-b3dc-c1bd69ec4da9/Untitled.png)

## 🔸여러 변수와 타입 지원하기

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5c87e31b-cc0d-454b-95af-c1006f974c63/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ddaa13b2-0250-469f-9ed8-0702711cd3ec/Untitled.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c476629c-09e9-43f5-9ee0-6509aea0a11f/Untitled.png)

- 현재 구현된 프로퍼티 래퍼는 Int 값만 가지고 작업한다.
- 만약 타입의 다른 값과 비교할 수 있는 모든 변수 타입과 함께 사용할 수 있다면 더 유용하게 될 것이다.
- 다행히도 프로퍼티 래퍼는 특정 프로토콜을 따르는 모든 타입과 작업하도록 구혀할 수 있다.
- 프로퍼티 래퍼의 목적은 비교작업 하는 것이므로, **Foundation** 프레임워크에 포함된 Comparable 프로토콜을 달는 모든 데이터 타입을 지원하도록 수정해야 한다.
- Comparable 프로토콜을 따르는 타입은 값이 같은지, 더 큰지, 더 작은지를 비교하는데 사용될 수 있다.
- String, Int, Date, DateInterval, 그리고 Character 같은 다양한 타팁이 이 프로토콜을 따른다.

---

## 🔸여러 변수와 타입 지원하기

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/09401488-f31b-448e-9814-b9a29d300aa9/Untitled.png)

---

![40.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/46d69c77-5b43-4af7-8adf-33ab3fddc41b/40.png)

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5874d44a-f14b-4477-ab84-8479a121b894/Untitled.png)

---

## 🔸요약

구조체

- Swift 5.1에서 도입된 프로퍼티 래퍼는 클래스 및 구조 선언 내에서 코드의 중복을 피하면서 앱 프로젝트의 코드를 통해 재사용되는 프로퍼티의 게터와 세터의 구현체를 사용할 수 있게 한다.
- 프로퍼티 래퍼는 @propertyWrapper 지시자를 이용하여 구조체 형태로 선언된다.
- 프로퍼티 래퍼는 강력한 스위프트 기능으로 우리가 만든 동작(작업)을 Swift 코드에 추가할 수 있게 한다.
- 우리가 만든 고유한 프로퍼티 래퍼 외에도 iOS SDK로 작업하다 보면 이러한 프로퍼티 래퍼를 접하게 될 것이다.
- 실제로, 미리 정의된 프로퍼티 래퍼는 나중에 설명할 SwiftUI 작업을 할 때 광범위하게 사용된다.

---

![43.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/71f3ae62-985f-4e61-8285-184b8f9a0fd8/43.png)

```swift
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
```

---
