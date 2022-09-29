## 🔸오후 수업

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b21b304d-d8f6-4f9f-960c-452d5f6750bc/Untitled.png)

## 🔸가변형 `컬렉션`과 불변형 컬렉션

- Swift에서 컬렉션은 **가변형(mutable)**과 **불변형(immutable)** 있다.
- 불변형 컬렉션 인스턴스에 속한 것은 객체가 초기화 된 이후에 변경될 수 없다.
- 불변형 컬렉션을 만들고 싶다면 컬렉션을 생성할 때 **상수(constant)**에 할당한다.
- 반면, **변수(variable)**에 할당했다면 가변형이 된다.

## 🔸배열 초기화

- `배열`은 하나의 순서 있는 컬렉션에 여러 값을 담기 위하여 특별하게 설계된 데이터 타입이다.
- 예를 들어, String 값들을 저장하기 위해 배열을 생성 할 수 있다.
- 엄밀히 말하자면, 하나의 스위프트 배열은 동일한 타입의 값들만 저장할 수 있다.
- 따라서 String 값을 포함하도록 선언된 배열에 Int 값을 포함할 수 없다.
- 그러나 여러 타입이 혼합된 배열을 생성할 수도 있다.
- 배열의 타입은 **타입 어노테이션(type annotation)**을 이용하여 구체적으로 지정할 수도 있고, **타입 추론(type inference)**을 이용하여 컴파일러가 식별하게 할 수도 있다.

---

- 다음의 구문을 이용하면 배열을 생성할 때 값들을 갖도록 초기화할 수 있다.
- 이것을 배열 리터럴(array literal)이라고 부른다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/685435ea-9cf1-4b0e-b3a6-1a6435a7acff/Untitled.png)

---

- 다음의 코드는 세 개의 문자열 값으로 초기화되어 생성된 새로운 배열을 변수에 할당한다.
- 이 인스턴스에서 Swift 컴파일러는 타입 추론을 이용하여 배열 String 타입의 값을 담고 있다고 판단하며, 앱 코드 어디에서든 다른 타입의 값이 배열에 추가되지 않도록 막을 것이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7ed923af-e906-4807-b3f0-90eeec35b089/Untitled.png)

---

- 다른 방법으로, 동일한 배열을 가지고 타입 어노테이션을 이용하여 선언할 수 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6220cf81-56c3-442f-b6c9-1056fd7b76f5/Untitled.png)

---

- 배열을 생성할 때 반드시 값을 할당해야 할 필요는 없다. 다음 구문은 빈 배열을 생성할 때 사용되는 것이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3153469d-2fe0-4102-b6ff-116d54520f04/Untitled.png)

---

- 예를 들어, 다음의 코드는 부동소수점 값을 저장하도록 설계한 빈 배열을 생성하고 priceArray라는 이름의 변수에 할당한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9cf5bc08-3857-493f-ae0c-67084e71f993/Untitled.png)

---

- 또 다른 유용한 초기화 기술로는 배열의 각 항목마다 지정된 디폴트 값으로 미리 설정하여 배열이 특정 크기로 초기화 되도록 할 수 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6c21e612-fe07-4a96-bb32-39c41108290f/Untitled.png)

- 앞의 코드를 컴파일하고 실행하면 “My String”이라는 문자열로 배열의 각 항목이 초기화되어 10개의 항목을 가진 배열이 생성된다.

---

- 마지막으로, 기존의 배열 두 개를 합하여(배열 모두가 동일한 타입의 값을 포함하고 있다고 가정) 새로운 배열을 생성 할 수도 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/612a41d7-95c0-4e46-aa72-fafba0e215cb/Untitled.png)

---

## 🔸배열로 작업하기

**`배열 항목 개수`**

- 하나의 배열에 들어 있는 항목들의 개수는 배열의 count **프로퍼티**에 접근하여 얻을 수 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6c76502a-63a7-4a61-807e-276695a0873b/Untitled.png)

---

- 다음과 같이 불리언 타입인 **isEmpty 프로퍼티**를 이용하면 배열이 비었는지 알 수 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fd1cfb30-18e4-455a-9e4d-ef83f944037b/Untitled.png)

---

## 🔸배열로 작업하기

**`배열 항목 접근하기`**

- **인덱스 첨자(index subsripting)**라 불리는 기술을 이용하여 배열 인덱스의 항목 위치를 참조하여 배열의 특정 항목에 접근하거나 수정할 수 있다.
- 배열의 첫번째 항목의 인덱스 위치는 0이다
- 다음의 코드는 배열의 인덱스 위치 2에 포함된 문자열 print 호출로 출력한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3c5042a2-f123-4571-8092-f37f035dd6ee/Untitled.png)

---

 

## 🔸배열 항목 섞기와 무작위로 가져오기

- 배열 객체의 **shuffled()** 메서드를 호출하면 항목의 순서가 무작위로 섞인 새로운 버전의 배열이 반환된다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/87020480-c4d1-4043-8a25-5f68d8c9218c/Untitled.png)

---

- 배열의 항목을 무작위로 선택하여 접근하려면 **randomElement()** 메서드를 호출하면 된다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/32061c4d-56fb-4112-a43f-99cd53ebb0a7/Untitled.png)

---

## 🔸배열로 작업하기

**`배열로 작업하기`**

- 배열의 항목은 append 메서드 또는 +나 +=연산자를 이용하여 배열에 추가할 수 있다.
- 다음의 예제는 배열에 항목을 추가할 수 있는 방법으로 유효한 기술이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3ca99cae-8170-48b7-8a67-21c65f5f29da/Untitled.png)

---

`**항목 삽입하기와 삭제하기**`

- 배열에 삽입될 새로운 항목은 insert(at:)메서드를 호출하여 특정 인덱스 위치에 삽입할 수 있다.
- 삽입은 배열 내에 있는 기존의 모든 항목을 보호하므로, 새롭게 삽입된 항목을 배열 내에 두기 위하여 새로운 항목이 삽입되는 인덱스 위치를 포함하여 그 뒤에 있던 기존 항목들은 오른족으로 한 칸씩 이동하게 된다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9ddaa526-d328-4165-adc8-baeb43fb5575/Untitled.png)

---

- 마찬가지로, 배열의 특정 인덱스 위치에 있는 항목은 **remove(at:)** 메서드를 호출하여 제거할 수 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4026c5e4-e7bb-4ee9-9d88-8459b1c17185/Untitled.png)

---

- 배열의 마지막 항목을 삭제하려면 다음과 같이 **removeLast()** 메서드를 호출하면 된다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f8a1f7a5-1ef5-4c33-993a-f42ab879abef/Untitled.png)

---

## 🔸배열 반복하기

- 배열의 항목을 반복하는 가장 쉬운 방법은 for - in 반복문을 이용하는 것이다.
- Ex), 다음의 코드는 String 배열에 있는 모든 항목을 반복하여 각각의 콘솔에 출력하는 것이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/62445d6b-aab9-4dd0-b334-4cf8bede743f/Untitled.png)

---

## 🔸타입이 혼합된 배열 생성하기

- 타입이 혼합된 배열은 서로 다른 클래스 타입의 항목들을 담을 수 있는 배열이다.
- 물론, String 타입을 받도록 선언된 배열이라면 String 클래스 객체가 아닌 인스턴스를 담을 수는 없다.
- 하지만, Swift에서는 **Any 타입**이 있기 때문에 흥미로운 방법이 생긴다.
- Swift의 Any 타입은 특별한 타입으로, 지정된 클래스 타입이 아닌 객체를 참조하는데 사용된다.
- 따라서 Any 객체 타입을 포함하도록 선언된 배열은 여러 타입의 항목을 담을 수 있게 된다.
- EX), 다음의 코드는 배열을 생성하고 String & Int & Double형의 항목들을 폼함하도록 초기화하고 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b106d7ed-8d6e-4fd4-a001-1e9dee7af495/Untitled.png)

---

- Any 타입은 주의해서 사용해야 한다.
- 왜냐하면 Any를 사용할 경우 swift는 올바른 타입의 요소들이 배열에 포함되었다고 간주하게 되므로 코드상에서의 프로그래머 실수로 인한 오류가 발생할 수 있기 때문이다.
- Any 배열을 사용하게 된다면 배열에 있는 요소를 가지고 코드에서 사용하기 전에 각 요소에 대한 올바른 타입으로의 형변환을 직접해야 하는 경우가 종종 생길 것이다.
- 배열에 있는 어떤 요소에 대해 올바르지 않은 타입으로 형 변환을 할 경우, 컴파일 오류는 발생하지 않겠지만 런타임에서 충돌이 발생할 것이다.

---

![67.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e599e595-6800-43ad-8c25-069ea2d94326/67.png)

- 위와 같이 배열을 초기화한 다음, 배열의 정수형 오소에 10을 곱하는 반복문을 해야 한다면 다음과 같은 코드를 생각할 수 있다.

![68.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fab8cdc9-fd0b-4142-a37a-84b3f5bafcde/68.png)

- 하지만 이 코드를 Xcode에 입력하면 Any 타입과 Int 타입의 곱셈 연산이 불가능하다는 구문 오류가 발생할 것이다.
- 이 오류를 없애려면 배열의 요소를 Int 타입으로 **다운캐스팅** 해야한다.
- 아래 코드는 아무런 오류없이 컴파일되며, 기대한 것처럼 동작하다가 배열의 마지막인 String 요소에 다다랐을 때 에러 메세지와 함께 충돌이 발생하게 된다.
- 따라서 이 코드는 배열에 있는 각 항목의 특정 타입을 식별하도록 수정되어야 한다.
- 분명한 것은 Swift에서 Any 배열을 이용할 때는 장점과 단점이 모두 존재한다는 점이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e1eae694-98e5-40e6-8ee9-15b90c8ccef7/Untitled.png)

---

## 🔸`딕셔너리 컬렉션`

- 딕셔너리는 **키-값(key-value)**쌍의 형태로 데이터를 저장하고 관리할 수 있게 해준다.
- 딕셔너리는 배열과 비슷한 목적의 작업을 실시하지만, 딕셔너리에 저장된 각 항목은 연관도니 값을 참조하고 접근하는데 사용되는 유일한 키(정확하게 말하자면, 키는 특정 딕셔너리 객체에서 유맇하다)와 연결되어 있다는 점이 다르다.
- 현재는 String, Int, Double, 그리고 Bool 데이터 타입만 Swift 딕셔너리에 키로 사용할 수 있다.

- 딕셔너리는 순서가 없는 단일 컬렉션에 여러 값을 담기 위해 설계된 특별한 타입이다.
- 딕셔너리에 있는 각 항목은  **키(key)**와 그와 연관도니 **값(value)**으로 구성된다.
- 키의 데이터 타입과 값 항목은 **타입 어노테이션(type annotation)**을 이용하여 구체적으로 지정되거나, **타입 추론(type inference)**을 이용하여 컴파일러가 식별하게 한다.
- 새로운 딕셔너리는 다음의 구문을 이용하여 생성 시에 값들의 컬렉션으로 초기화할 수 있다.
    - 이것을 **딕셔너리 리터럴(dictionary literal)**이라고 한다.
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cf5c68be-f9ba-403a-9083-22664987d581/Untitled.png)
    
    ---
    
    ## 🔸딕셔너리 초기화
    
- 다음 코드는 ISBN 번호와 그에 해당하는 책 제목의 형태로 네 개의 키-값 쌍으로 초기화된 변수에 할당된 새로운 딕셔너리를 생성한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/00fc1a7b-a506-4469-918e-44ce552bb32b/Untitled.png)

- 위 인스턴스에서 Swift 컴파일러는 딕셔너리의 키,값 항목이 String 타입임을 결정하고 다른 타입의 키 또는 값이 삽입되지 않도록 막기 위해 타입 추론을 이용할 것이다.

---

- 배열처럼 빈 딕셔너리를 생성할 수도 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/47e7f10d-2571-4dcd-9097-43c9e6c4c40b/Untitled.png)

---

- 다음의 코드는 정수형 키와 문자열 값을 저장하기 위하여 설계된 빈 딕셔너리를 생성한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e2e6fd76-cabd-4729-b920-fd70a166e6bc/Untitled.png)

---

## 🔸시퀀스 기반의 딕셔너리 초기화

- 딕셔너리는 키들과 값들을 나타내는 시퀀스를 이용하여 초기화될 수 도 있다.
- 이것은 키들과 값들을 Swift의 zip()함수에 전달하면 된다.
- 다음의 예제는 두 개의 배열을 이용하여 딕셔너리를 생성한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b8fcb8bc-6558-400b-98db-71b1f79786df/Untitled.png)

---

- 이 방법은 키,값들을 프로그램적으로 생성되게 해준다.
- 다음 예제는 미리 정의된 키들의 배열을 이용하는 것이 아니라 1~ 시작하는 숫자로 키로 지정한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c792fc82-df03-4f65-956e-701272aea53e/Untitled.png)

---

- 다음의 코드는 앞의 코드와 동일한 작업을 수행하지만, 훨씬 깔끔하게 정리되었다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/410f8d47-931b-44fb-bf5f-f72eeec516f1/Untitled.png)

---

## 🔸딕셔너리 항목

- 딕셔너리의 항목 개수는 count 프로퍼티에 접근하여 얻을 수 있다.
- 특정 값은 해당 키를 참조하기 위하여 키 첨자 구문을 이용하면 접근되거나 수정될 수 있다.
- 이와 같이 딕셔너리 항목에 접근할 대도 지정된 키에 해당하는 값이 없는 경우에 사용될 디폴트 값을 선언할 수 있따.
- 우리가 만든 딕셔너리에는 지정된 키에 대한 항목이 없기 때문에 아래 코드는 DEFAULT 텍스트를 출력할 것이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dd92da2b-1c5c-460c-8b5d-01379b15112e/Untitled.png)

---

## 🔸딕셔너리 항목접근하기와 갱신하기

![80.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/69efc1cf-53e0-4f89-963d-734148a473bc/80.png)

- 변경될 값과 해당 키를 전달하여 updateValue(forKey:) 메서드를 호출해도 같은 동작을 한다.

![81.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5d4267df-2dbe-4e0c-8a37-b13c304ef833/81.png)

---

## 🔸딕셔너리 항목 추가하기 & 제거하기

- 다음의 키 첨자 구문을 이용하면 딕셔너리에 항목을 추가 할 수 있다.

![83.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fd8f0f35-c0e7-4356-be76-632b5be70edc/83.png)

- EX), 다음과 같이 책 딕셔너리에 새로운 키-값 쌍을 추가 수 있다.

![84.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e2fd9501-6796-4c61-8a2e-70f3f6302501/84.png)

- 어떤 키-값 쌍을 딕셔너리에서 제거할 때는 해당 항목에 nil 값을 할당하거나 딕셔너리 인스턴스의 **removeValue(forKey:)** 메서드를 호출하면 된다.
- 다음의 두 줄은 모두 책 딕셔너리에서 특정 항목을 삭제하는 결과를 만든다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d9be5420-3004-405a-bd52-044b6650182c/Untitled.png)

---

## 🔸딕셔너리 반복

- 배열과 마찬가지로 for-in 반복문을 이용하면 딕셔너리의 항목들을 반복할 수 있다.
- Ex), 다음 코드는 책 딕셔너리에 있는 모든 항목을 가져다가 각각의 키 값을 출력한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a173902d-f6e0-44b5-b82b-7d1693e88977/Untitled.png)

## 🔸요약

- Swift의 컬렉션은 딕셔너리, 세트, 배열의 형태를 취한다.
- 이들 모두 하나의객체에 여러 항목을 담을 수 있는 방법을 제공한다.
- 배열은 항목들을 순서대로 담을 수 있는 방법을 제공하여 배열에 담긴 항목 위치에 해당하는 인덱스 값으로 항목에 접근할 수 있도록 한다.
- 딕셔너리는 키-값 쌍으로 저장하는 플랫폼을 제공하며, 키는 저장된 값에 접근하는데 사용된다.
- Swift 컬렉션의 항목들은 for-in 반복문을 이용하여 반복할 수 있다.

---

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/74fb681b-1143-48ee-b67f-a39282144eab/Untitled.png)

```swift
import Foundation

//1
let teamNameArray10 = [String]([
    "SeungJun",
    "Yewon",
    "JinHyung",
    "Wonhyeong",
    "Hyunggu",
    "Hyesung",
    "SeokJun",
    "Ted"
])
for name in teamNameArray10 {
    print("\(name)")
}
print("-----------------------------------------------------\n")
//2
let teamNameArray11 = [String]([
    "eunno",
    "jeonghoon",
    "minkyoung",
    "yeseul",
    "junho",
    "keunsub",
    "jonghyeon",
])
let together = teamNameArray10 + teamNameArray11
for name in together {
    print("\(name)")
}
print("-----------------------------------------------------\n")
//3
var teamFavoriteArtists10 : [String:String] = [
    "SeungJun": "joji",
    "Yewon": "Day 6",
    "JinHyung": "Jay Park",
    "Wonhyeong": "Post Malone",
    "Hyunggu": "IU",
    "Hyesung": "Crush",
    "SeokJun": "The Weekend",
    "Ted" :"J.Cole",
    
]
for (name,artist) in teamFavoriteArtists10 {
    print("name :\(name), artist : \(artist) ")
}
print("-----------------------------------------------------\n")
    

//4
var teamFavoriteArtists11 : [String:String] = [
    "eunno":"Rihnna",
    "jeonghoon":"Post Malone",
    "minkyoung":"10cm",
    "yeseul":"None",
    "junho":"AKMU",
    "keunsub":"jannabi",
    "jonghyeon":"neroconnection",
]

let mergeteam = teamFavoriteArtists10.merging(teamFavoriteArtists11){(_, new) in new}
print(mergeteam)
print("-----------------------------------------------------\n")

//5
var i = 0
var NewDic = [Int : String]()
for j in teamFavoriteArtists10.values{
    NewDic[i] = j
    i += 1
}
for (key,value) in NewDic{
    print(key,value)
}
print("-----------------------------------------------------\n")

//5 etc..
var OhItsMyFaultArtist10 : [String] = [
    "joji",
    "Day 6",
    "Jay Park",
    "IU",
    "Crush",
    "The Weekend",
    "J.Cole",
]
var keyNumber = Dictionary(uniqueKeysWithValues: zip(1...,OhItsMyFaultArtist10))
for (key,value) in keyNumber {
    print(key,value)
}
```
