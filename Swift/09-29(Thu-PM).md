## 🔸오후 수업

![Untitled](https://user-images.githubusercontent.com/67450169/193072482-fb4d8511-b5bb-46f3-ae67-43c31930c00c.png)

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

![Untitled (1)](https://user-images.githubusercontent.com/67450169/193072528-1c51bd8d-1144-47f0-aa15-5faad8bcffc2.png)

---

- 다음의 코드는 세 개의 문자열 값으로 초기화되어 생성된 새로운 배열을 변수에 할당한다.
- 이 인스턴스에서 Swift 컴파일러는 타입 추론을 이용하여 배열 String 타입의 값을 담고 있다고 판단하며, 앱 코드 어디에서든 다른 타입의 값이 배열에 추가되지 않도록 막을 것이다.

![Untitled (2)](https://user-images.githubusercontent.com/67450169/193072550-91482e4c-e8d7-47fe-b00e-9bc7b82d70ee.png)
---

- 다른 방법으로, 동일한 배열을 가지고 타입 어노테이션을 이용하여 선언할 수 있다.

![Untitled (3)](https://user-images.githubusercontent.com/67450169/193072570-7260f323-5063-4356-8b5d-1b9f4470de0b.png)
---

- 배열을 생성할 때 반드시 값을 할당해야 할 필요는 없다. 다음 구문은 빈 배열을 생성할 때 사용되는 것이다.

![Untitled (4)](https://user-images.githubusercontent.com/67450169/193072582-f848c2d9-27e0-4131-8cc5-177384a80df4.png)
---

- 예를 들어, 다음의 코드는 부동소수점 값을 저장하도록 설계한 빈 배열을 생성하고 priceArray라는 이름의 변수에 할당한다.

![Untitled (5)](https://user-images.githubusercontent.com/67450169/193072603-1bf02e5f-87e0-4a0c-81b7-3626e1d2363e.png)

---

- 또 다른 유용한 초기화 기술로는 배열의 각 항목마다 지정된 디폴트 값으로 미리 설정하여 배열이 특정 크기로 초기화 되도록 할 수 있다.

![Untitled (6)](https://user-images.githubusercontent.com/67450169/193072623-e56f5d54-c320-4efe-8531-ba1582bf9cc5.png)

- 앞의 코드를 컴파일하고 실행하면 “My String”이라는 문자열로 배열의 각 항목이 초기화되어 10개의 항목을 가진 배열이 생성된다.

---

- 마지막으로, 기존의 배열 두 개를 합하여(배열 모두가 동일한 타입의 값을 포함하고 있다고 가정) 새로운 배열을 생성 할 수도 있다.
- 
![Untitled (7)](https://user-images.githubusercontent.com/67450169/193072636-27100501-7ca8-447b-a90b-7403954c2754.png)

---

## 🔸배열로 작업하기

**`배열 항목 개수`**

- 하나의 배열에 들어 있는 항목들의 개수는 배열의 count **프로퍼티**에 접근하여 얻을 수 있다.

![Untitled (8)](https://user-images.githubusercontent.com/67450169/193072693-fc8d8c50-6bee-4c3e-b07a-513683355f87.png)

---

- 다음과 같이 불리언 타입인 **isEmpty 프로퍼티**를 이용하면 배열이 비었는지 알 수 있다.
![Untitled (9)](https://user-images.githubusercontent.com/67450169/193072718-9e69cbb1-a6ab-4e5e-a601-261435e7e7f5.png)
---

## 🔸배열로 작업하기

**`배열 항목 접근하기`**

- **인덱스 첨자(index subsripting)**라 불리는 기술을 이용하여 배열 인덱스의 항목 위치를 참조하여 배열의 특정 항목에 접근하거나 수정할 수 있다.
- 배열의 첫번째 항목의 인덱스 위치는 0이다
- 다음의 코드는 배열의 인덱스 위치 2에 포함된 문자열 print 호출로 출력한다.

![Untitled (10)](https://user-images.githubusercontent.com/67450169/193072737-68762714-b4b8-4c35-8045-b3a15bd7fdd8.png)

---

 

## 🔸배열 항목 섞기와 무작위로 가져오기

- 배열 객체의 **shuffled()** 메서드를 호출하면 항목의 순서가 무작위로 섞인 새로운 버전의 배열이 반환된다.
- 
![Untitled (11)](https://user-images.githubusercontent.com/67450169/193072758-79f179ba-65f1-491e-a9ed-e51f4d7b8ef0.png)

---

- 배열의 항목을 무작위로 선택하여 접근하려면 **randomElement()** 메서드를 호출하면 된다.

![Untitled (12)](https://user-images.githubusercontent.com/67450169/193072802-3a68f1bf-c577-45a3-b54b-a86de538e0bc.png)

---

## 🔸배열로 작업하기

**`배열로 작업하기`**

- 배열의 항목은 append 메서드 또는 +나 +=연산자를 이용하여 배열에 추가할 수 있다.
- 다음의 예제는 배열에 항목을 추가할 수 있는 방법으로 유효한 기술이다.

![Untitled (13)](https://user-images.githubusercontent.com/67450169/193072821-8a831a11-d185-48dc-89ff-674f0fdf6a57.png)

---

`**항목 삽입하기와 삭제하기**`

- 배열에 삽입될 새로운 항목은 insert(at:)메서드를 호출하여 특정 인덱스 위치에 삽입할 수 있다.
- 삽입은 배열 내에 있는 기존의 모든 항목을 보호하므로, 새롭게 삽입된 항목을 배열 내에 두기 위하여 새로운 항목이 삽입되는 인덱스 위치를 포함하여 그 뒤에 있던 기존 항목들은 오른족으로 한 칸씩 이동하게 된다.

![Untitled (14)](https://user-images.githubusercontent.com/67450169/193072833-7942821e-a9bb-414d-a787-3fa22ef09f68.png)

---

- 마찬가지로, 배열의 특정 인덱스 위치에 있는 항목은 **remove(at:)** 메서드를 호출하여 제거할 수 있다.
- 
![Untitled (15)](https://user-images.githubusercontent.com/67450169/193072861-377707d3-d9b4-4a77-a49f-bfe9543f333e.png)

---

- 배열의 마지막 항목을 삭제하려면 다음과 같이 **removeLast()** 메서드를 호출하면 된다.

![Untitled (16)](https://user-images.githubusercontent.com/67450169/193072874-93b444ca-a3a8-4df8-a0b5-af431f08da07.png)

---

## 🔸배열 반복하기

- 배열의 항목을 반복하는 가장 쉬운 방법은 for - in 반복문을 이용하는 것이다.
- Ex), 다음의 코드는 String 배열에 있는 모든 항목을 반복하여 각각의 콘솔에 출력하는 것이다.
- 
![Untitled (17)](https://user-images.githubusercontent.com/67450169/193072906-d083bc22-00f0-467f-b79f-2759054d3196.png)

---

## 🔸타입이 혼합된 배열 생성하기

- 타입이 혼합된 배열은 서로 다른 클래스 타입의 항목들을 담을 수 있는 배열이다.
- 물론, String 타입을 받도록 선언된 배열이라면 String 클래스 객체가 아닌 인스턴스를 담을 수는 없다.
- 하지만, Swift에서는 **Any 타입**이 있기 때문에 흥미로운 방법이 생긴다.
- Swift의 Any 타입은 특별한 타입으로, 지정된 클래스 타입이 아닌 객체를 참조하는데 사용된다.
- 따라서 Any 객체 타입을 포함하도록 선언된 배열은 여러 타입의 항목을 담을 수 있게 된다.
- EX), 다음의 코드는 배열을 생성하고 String & Int & Double형의 항목들을 폼함하도록 초기화하고 있다.

![Untitled (18)](https://user-images.githubusercontent.com/67450169/193072930-bccba3e8-82ee-483e-86f7-05085c5d44ae.png)

---

- Any 타입은 주의해서 사용해야 한다.
- 왜냐하면 Any를 사용할 경우 swift는 올바른 타입의 요소들이 배열에 포함되었다고 간주하게 되므로 코드상에서의 프로그래머 실수로 인한 오류가 발생할 수 있기 때문이다.
- Any 배열을 사용하게 된다면 배열에 있는 요소를 가지고 코드에서 사용하기 전에 각 요소에 대한 올바른 타입으로의 형변환을 직접해야 하는 경우가 종종 생길 것이다.
- 배열에 있는 어떤 요소에 대해 올바르지 않은 타입으로 형 변환을 할 경우, 컴파일 오류는 발생하지 않겠지만 런타임에서 충돌이 발생할 것이다.

---

![67](https://user-images.githubusercontent.com/67450169/193072947-9a6c1131-a43a-48c2-8158-ff20867b6ce1.png)

- 위와 같이 배열을 초기화한 다음, 배열의 정수형 오소에 10을 곱하는 반복문을 해야 한다면 다음과 같은 코드를 생각할 수 있다.
- 
![68](https://user-images.githubusercontent.com/67450169/193072966-b7a82d1b-e3aa-4d7b-a99e-a9323845a809.png)

- 하지만 이 코드를 Xcode에 입력하면 Any 타입과 Int 타입의 곱셈 연산이 불가능하다는 구문 오류가 발생할 것이다.
- 이 오류를 없애려면 배열의 요소를 Int 타입으로 **다운캐스팅** 해야한다.
- 아래 코드는 아무런 오류없이 컴파일되며, 기대한 것처럼 동작하다가 배열의 마지막인 String 요소에 다다랐을 때 에러 메세지와 함께 충돌이 발생하게 된다.
- 따라서 이 코드는 배열에 있는 각 항목의 특정 타입을 식별하도록 수정되어야 한다.
- 분명한 것은 Swift에서 Any 배열을 이용할 때는 장점과 단점이 모두 존재한다는 점이다.

![Untitled (19)](https://user-images.githubusercontent.com/67450169/193073033-9b90c6c0-b7e1-47d1-81b0-7a82f0d49272.png)

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
    
   ![Untitled (20)](https://user-images.githubusercontent.com/67450169/193073059-20e89299-b306-4091-9445-7593675e65ea.png)
    
    ---
    
    ## 🔸딕셔너리 초기화
    
- 다음 코드는 ISBN 번호와 그에 해당하는 책 제목의 형태로 네 개의 키-값 쌍으로 초기화된 변수에 할당된 새로운 딕셔너리를 생성한다.
- 
![Untitled (21)](https://user-images.githubusercontent.com/67450169/193073074-da129c1a-5ae9-4642-a744-3d64d1db2cd1.png)

- 위 인스턴스에서 Swift 컴파일러는 딕셔너리의 키,값 항목이 String 타입임을 결정하고 다른 타입의 키 또는 값이 삽입되지 않도록 막기 위해 타입 추론을 이용할 것이다.

---

- 배열처럼 빈 딕셔너리를 생성할 수도 있다.

![Untitled (22)](https://user-images.githubusercontent.com/67450169/193073102-e7d148be-88fb-43d8-9e71-655447f9a58d.png)

---

- 다음의 코드는 정수형 키와 문자열 값을 저장하기 위하여 설계된 빈 딕셔너리를 생성한다.
![Untitled (23)](https://user-images.githubusercontent.com/67450169/193073123-567d39fb-59a2-4e43-87a0-24dbd2634df4.png)

---

## 🔸시퀀스 기반의 딕셔너리 초기화

- 딕셔너리는 키들과 값들을 나타내는 시퀀스를 이용하여 초기화될 수 도 있다.
- 이것은 키들과 값들을 Swift의 zip()함수에 전달하면 된다.
- 다음의 예제는 두 개의 배열을 이용하여 딕셔너리를 생성한다.

![Untitled (24)](https://user-images.githubusercontent.com/67450169/193073153-78ee445f-c926-44ba-b2f1-330720083d01.png)

---

- 이 방법은 키,값들을 프로그램적으로 생성되게 해준다.
- 다음 예제는 미리 정의된 키들의 배열을 이용하는 것이 아니라 1~ 시작하는 숫자로 키로 지정한다.

![Untitled (25)](https://user-images.githubusercontent.com/67450169/193073163-0ed4e317-4951-46e4-9494-7c74943139a0.png)

---

- 다음의 코드는 앞의 코드와 동일한 작업을 수행하지만, 훨씬 깔끔하게 정리되었다.
- 
![Untitled (26)](https://user-images.githubusercontent.com/67450169/193073178-c882903e-f054-4905-9aea-6d0cabd7360e.png)

---

## 🔸딕셔너리 항목

- 딕셔너리의 항목 개수는 count 프로퍼티에 접근하여 얻을 수 있다.
- 특정 값은 해당 키를 참조하기 위하여 키 첨자 구문을 이용하면 접근되거나 수정될 수 있다.
- 이와 같이 딕셔너리 항목에 접근할 대도 지정된 키에 해당하는 값이 없는 경우에 사용될 디폴트 값을 선언할 수 있따.
- 우리가 만든 딕셔너리에는 지정된 키에 대한 항목이 없기 때문에 아래 코드는 DEFAULT 텍스트를 출력할 것이다.

![Untitled (27)](https://user-images.githubusercontent.com/67450169/193073213-717bad4b-8a76-4669-a22f-91210336c428.png)

---

## 🔸딕셔너리 항목접근하기와 갱신하기

![80](https://user-images.githubusercontent.com/67450169/193073228-54a39d78-0734-4fcd-91ce-a543ea2632e1.png)

- 변경될 값과 해당 키를 전달하여 updateValue(forKey:) 메서드를 호출해도 같은 동작을 한다.

![81](https://user-images.githubusercontent.com/67450169/193073238-b60543cb-5502-40a4-91b3-843c0946beef.png)

---

## 🔸딕셔너리 항목 추가하기 & 제거하기

- 다음의 키 첨자 구문을 이용하면 딕셔너리에 항목을 추가 할 수 있다.

![83](https://user-images.githubusercontent.com/67450169/193073263-575da24e-3346-4fb2-88d8-6811a8eb4925.png)

- EX), 다음과 같이 책 딕셔너리에 새로운 키-값 쌍을 추가 수 있다.

![84](https://user-images.githubusercontent.com/67450169/193073300-df27ce6f-ab1e-4ddd-8e58-4c36e5f6e8d2.png)

- 어떤 키-값 쌍을 딕셔너리에서 제거할 때는 해당 항목에 nil 값을 할당하거나 딕셔너리 인스턴스의 **removeValue(forKey:)** 메서드를 호출하면 된다.
- 다음의 두 줄은 모두 책 딕셔너리에서 특정 항목을 삭제하는 결과를 만든다.
- 
![Untitled (28)](https://user-images.githubusercontent.com/67450169/193073317-36b2fc27-35e1-4e54-adab-e2270055a55f.png)

---

## 🔸딕셔너리 반복

- 배열과 마찬가지로 for-in 반복문을 이용하면 딕셔너리의 항목들을 반복할 수 있다.
- Ex), 다음 코드는 책 딕셔너리에 있는 모든 항목을 가져다가 각각의 키 값을 출력한다.

![Untitled (29)](https://user-images.githubusercontent.com/67450169/193073342-ffadc7f5-fa75-4422-912f-690c0714b521.png)

## 🔸요약

- Swift의 컬렉션은 딕셔너리, 세트, 배열의 형태를 취한다.
- 이들 모두 하나의객체에 여러 항목을 담을 수 있는 방법을 제공한다.
- 배열은 항목들을 순서대로 담을 수 있는 방법을 제공하여 배열에 담긴 항목 위치에 해당하는 인덱스 값으로 항목에 접근할 수 있도록 한다.
- 딕셔너리는 키-값 쌍으로 저장하는 플랫폼을 제공하며, 키는 저장된 값에 접근하는데 사용된다.
- Swift 컬렉션의 항목들은 for-in 반복문을 이용하여 반복할 수 있다.

---

![Untitled (30)](https://user-images.githubusercontent.com/67450169/193073354-c05ec196-df35-491f-9707-ac79dff0a265.png)

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
