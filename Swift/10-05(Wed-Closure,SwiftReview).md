
- 
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6f39e63c-2535-472c-ba07-014d8c3a345f/Untitled.png)
    
    ## 🔸Swift 5.7 신기능
    
    ```swift
    // 옵셔널이 되면 nil 값이 될 수도 있고 아닐 수도 있다
    var name: String?
    
    if let myName = name {
        print("\(myName)")
    } else {
        print("nil입니다")
    }
    
    name = "ned"
    
    if let name = name {
        print("\(name)")
    } else {
        print("nil입니다")
    }
    
    // Swift 5.7의 신기능!
    if let name {
        print("\(name)")
    } else {
        print("nil입니다")
    }
    ```
    
    ```swift
    //guard Swift 5.7 신기능!
    func sayHello(name: String?) {
        guard let name else {
            return print("nil입니다")
        }
        
        print("Hello World!")
    }
    
    sayHello(name: "ned")
    sayHello(name: nil)
    ```
    
    ```swift
    //guard Swift 5.7 신기능!
    func sayHello(name: String?) {
        guard let _ = name else {
            return print("nil입니다")
        }
        
        print("Hello World!")
    }
    
    sayHello(name: "ned")
    sayHello(name: nil)
    ```
    
    ## 🔸Swift의 클로저
    
    - 컴퓨터 공학 용어에서의 **클로저**는 함수나 클로저 표현식고 ㅏ같은 독립적인 코드블록과 코드블록 주변에 있는 하나 이상의 변수가 결합된 것을 말한다.
    - 오른쪽 코드에서 **functionA**는 **functionB**라는 이름의 함수를 반홚나다.
    - 사실 **functionB**는 **functionB** 내부 영역 밖에 선언된 counter 변수에 의존하기 때문에 **functionA**는 클로저를 반환하고 있다.
    - 다시 말해, **functionB**는 counter 변수를 잡고있다 또는 가두고 있다 라고 말할수 있으므로 전통적인 컴퓨터 공학 용어인 클로저로 간주한다.
    - Swift에서는 **클로저**와 **클로저 표현식**용어가 혼용되기 시작했지만, 어쨌든 둘 다 지원한다.
    
    ```swift
    func functionA() -> Int {
        
        var counter = 5
        
        // functionA 함수 안에 functionB 함수 선언 - 중첩된 함수
        func functionB() -> Int {
            // functionB 밖의 counter를 사용한 계산값을 반환한다
            return counter + 30
        }
        
        let result = functionB()
        print("\(result)")
        
        
        return 10
    }
    
    let result = functionA()
    print("\(result)")
    ```
    
    ```swift
    // 간단한 클로저 예제
    
    func functionA() -> () -> Int {
        
        var counter = 5
        
        // functionA 함수 안에 functionB 함수 선언 - 중첩된 함수
        func functionB() -> Int {
            // functionB 밖의 counter를 사용한 계산값을 반환한다
            return counter + 30
        }
        
        let result = functionB()
        print("\(result)")
        
        // functionB() 이것은 functionB를 호출하는 문구
        // functionB   이것은 functionB 함수 그 자체를 지칭함
        return functionB
    }
    
    // functionA() 호출의 결과는 functionB 함수이고
    // functionB 함수 안에는 counter값이 계속 붙잡혀 활용이 된다
    // myClosure가 곧 functionB이기 때문에 myClosure가 존재하는 동안 counter도 붙잡혀 존재한다
    let myClosure = functionA()
    let result = myClosure()
    print("\(result)")
    ```
    
    ---
    
    ```swift
    // 배열 정렬 예제
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    var defaultNames = names.sorted()
    print(defaultNames)
    
    // 정렬 기준을 만들어주는 함수 만들기
    func backward(_ s1: String, _ s2: String) -> Bool {
        print("\(s1)과 \(s2)를 비교합니다")
        return s1 > s2
    }
    
    var reverseNames = names.sorted(by: backward)
    print(reverseNames)
    /*
     Alex과 Chris를 비교합니다
     Ewa과 Alex를 비교합니다
     Ewa과 Chris를 비교합니다
     Barry과 Alex를 비교합니다
     Barry과 Chris를 비교합니다
     Daniella과 Alex를 비교합니다
     Daniella과 Barry를 비교합니다
     Daniella과 Chris를 비교합니다
     Daniella과 Ewa를 비교합니다
     ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
     */
    ```
    
    ---
    
    ```swift
    // 배열 정렬 예제
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    var defaultNames = names.sorted()
    print(defaultNames)
    
    // 정렬 기준을 만들어주는 함수 만들기
    func backward(_ s1: String, _ s2: String) -> Bool {
    //    print("\(s1)과 \(s2)를 비교합니다")
        return s1 > s2
    }
    
    var reverseNames = names.sorted(by: backward)
    print(reverseNames)
    
    // 전역함수 backward와 똑같이 작동하는 클로저 표현식을 만들어
    // sorted의 by: 매개변수로 인라인 클로저라는 구현법으로 바로 써서 보낸다
    reverseNames = names.sorted(by: { (_ s1: String, _ s2: String) -> Bool in
        return s1 > s2
    })
    print(reverseNames)
    
    // 한줄로도 가능
    reverseNames = names.sorted(by: { (_ s1: String, _ s2: String) -> Bool in return s1 > s2 })
    print(reverseNames)
    
    // 더 짧게
    // 배열이 String 문자열들로 채워진 걸 아니까
    reverseNames = names.sorted(by: { (_ s1, _ s2) -> Bool in return s1 > s2 })
    print(reverseNames)
    
    // 더 짧게
    reverseNames = names.sorted(by: { s1, s2 in return s1 > s2 })
    print(reverseNames)
    
    // 더 짧게
    reverseNames = names.sorted(by: { s1, s2 in s1 > s2 })
    print(reverseNames)
    
    // 짧은 인자이름으로 대체하는 방법도 있음
    reverseNames = names.sorted(by: { $0 > $1 })
    print(reverseNames)
    
    // 연산자 메서드
    reverseNames = names.sorted(by: >)
    print(reverseNames)
    ```
    
    ## 출력값
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b71c6b12-6517-48e3-b59e-c2cb055a0a58/Untitled.png)
    
    ---
    
    ## 🔸오후 수업
    
    ---
    
    ```swift
    // Array의 map 매소드 예제
    
    let digitNames: [Int: String] = [
        0: "Zero",
        1: "One",
        2: "Two",
        3: "Three",
        4: "Four",
        5: "Five",
        6: "Six",
        7: "Seven",
        8: "Eight",
        9: "Nine"
    ]
    
    let numbers: [Int] = [16, 58, 510]
    
    // ["OneSix", "FiveEight", "FiveOneZero"] 배열 만들기
    let strings: [String] = numbers.map { (number: Int) -> String in
        // 매개변수로 가져온 number는 상수이기 때문에, 변수로 다시 만들어줘야 변경 가능하다 - 쉐도우 변수
        var number: Int = number
        var output: String = ""
        
        repeat {
            // print("\(number % 10)")
            
            // number % 10 문구는 number를 10으로 나눈 나머지, 그러니까 소숫점 앞 맨 아랫자리수 한자리
            // 앞자리에 해당하는 문자열을 계속 앞에 더해주는 문자열 결합
            output = digitNames[number % 10]! + output
            
            // number는 Int이기 때문에, 10으로 나누면 소숫점 이하의 값은 내림처리한다.
            number /= 10
        } while number > 0
        
        return output
    }
    
    print("\(strings)")
    ```
    
    ---
    
    ## 🔸!처리 피하기 & 옵셔널 바인딩 다른 방법
    
    ```swift
    // Array의 map 매소드 예제
    
    let digitNames: [Int: String] = [
        0: "Zero",
        1: "One",
        2: "Two",
        3: "Three",
        4: "Four",
        5: "Five",
        6: "Six",
        7: "Seven",
        8: "Eight",
        9: "Nine"
    ]
    
    let numbers: [Int] = [16, 58, 510]
    
    // ["OneSix", "FiveEight", "FiveOneZero"] 배열 만들기
    let strings: [String] = numbers.map { (number: Int) -> String in
        // 매개변수로 가져온 number는 상수이기 때문에, 변수로 다시 만들어줘야 변경 가능하다 - 쉐도우 변수
        var number: Int = number
        var output: String = ""
        
        repeat {
            // print("\(number % 10)")
            
            // number % 10 문구는 number를 10으로 나눈 나머지, 그러니까 소숫점 앞 맨 아랫자리수 한자리
            // 앞자리에 해당하는 문자열을 계속 앞에 더해주는 문자열 결합
            // output = digitNames[number % 10]! + output
            
            // !처리는 피하고 싶어요
            /*
            if let name = digitNames[number % 10] {
                output = name + output
            } else {
                output = "?" + output
            }
            */
            
            // 짧게 쓰는 옵셔널 바인딩의 또 다른 방법
            let name = digitNames[number % 10] ?? "?"
            output = name + output
            
            // number는 Int이기 때문에, 10으로 나누면 소숫점 이하의 값은 내림처리한다.
            number /= 10
        } while number > 0
        
        return output
    }
    
    print("\(strings)")
    ```
    
    ---
    
    ## 🔸캡쳐값
    
    ---
    
    ```swift
    // 캡처값 예제
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal: Int = 0
        
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        
        return incrementer
    }
    
    let increFunc = makeIncrementer(forIncrement: 10)
    
    print("\(increFunc())") // 10
    print("\(increFunc())") // 10 + 10 = 20
    print("\(increFunc())") // 20 + 10 = 30
    ```
    
    ---
    
    ```swift
    // 캡처값 & 참조 타입 예제
    
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal: Int = 0
        
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        
        return incrementer
    }
    
    // 생성된 반환되는 함수는 runningTotal = 0,amount = 10으로 캡쳐되어 작동
    let increFuncTen = makeIncrementer(forIncrement: 10)
    
    // 생성된 반환되는 함수는 runningTotal = 0,amount = 7로 캡쳐되어 작동
    let increFuncSeven = makeIncrementer(forIncrement: 7)
    
    print("\(increFuncTen())") // 0 + 10 = 10
    print("\(increFuncSeven())") // 0 + 7 = 7
    
    print("\(increFuncTen())") // 10 + 10 = 20
    print("\(increFuncSeven())") // 7 + 7 = 14
    
    print("\(increFuncTen())") // 20 + 10 = 30
    print("\(increFuncSeven())") // 14 + 7 = 21
    
    // 두 함수의 관계는 참조 타입이라는 걸 알아보려 한다.
    // 동일한 runningTotal 값을 공유하고 있다.
    let alsoIncreFuncTen = increFuncTen
    
    print("\(increFuncTen())") // 30 + 10 = 40
    print("\(alsoIncreFuncTen())") // 0 + 10 = 10 ? -> 실제로는 50
    print("\(increFuncTen())") // 40 + 10 = 50 ? -> 실제로는 60
    
    // 필요하면 새로 만들어야...
    let myIncreFuncTen = makeIncrementer(forIncrement: 10)
    print("\(myIncreFuncTen())") // 0 + 10 = 1
    ```
    
    ---
    
    ## 🔸이스케이프 클로저
    
    ---
    
    ```swift
    var completionHandlers: [() -> Void] = []
    
    func someFunctionWithEscapingClosures(completionHandler: @escaping () -> Void ){
        completionHandlers.append(completionHandler)
    }
    
    func someFunctionWithNoneEscapingClosures(closure: () -> Void){
        closure()
    }
    
    class SomeClass{
        var x = 0 
        func doSomething(){
            someFunctionWithEscapingClosures(completionHandler:{() -> Void in
                print("hello")
                self.x = 100
            })
            someFunctionWithNoneEscapingClosures{() -> Void in 
                print("world")
                x = 200
            }
        }
    }
    let instance = SomeClass()
    instance.doSomething()
    print("None x:\(instance.x)")
    
    if let completionHandler = completionHandlers.first{
        completionHandler()
        print("x:\(instance.x)")
    }
    ```
    
    ## closer 가지고 매개변수를 사용할때 escaping 사용!!
    
    ---
    
    ## 🔸mutating을 알아보자!!
    
    ```swift
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
    ```
    
    ---
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b15b41b4-fede-47d3-9151-b0de4ae7c1de/Untitled.png)
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/74d1b9fb-5455-44b5-b042-14226c1b1589/Untitled.png)
    
    ---
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ef9b3ee3-4de7-4d8d-ae0a-75867312cbcd/Untitled.png)
    
    ---
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f3d80a5c-86af-46a6-9847-acc2a82cef91/Untitled.png)
    
    ---
    
    ## 🔸@escaping closure 개념
    
    클로저가 함수로부터 escape 한다는 것은 해당 함수의 인자로 클로저가 전달되지만, **함수가 반환된후 실행** 되는것을 의미한다. 함수의 인자가 함수의 영역을 탈출하여 함수 밖에서 사용할 수 있는 개념은 기존에 우리가 알고 있던 변수의 `scope` 개념을 무시한다. 
    
    왜? 함수에 선언된 로컬 변수가 로컬 변수의 영역을 뛰어넘어 **함수 밖**에서도 유효하기 때문이다.
    
    ---
    
    ```swift
    // 함수 외부에 클로저를 저장하는 예시
    // 클로저를 저장하는 배열
    var completionHandlers: [() -> Void] = []
    
    func withEscaping(completion: @escaping () -> Void) {
        // 함수 밖에 있는 completionHandlers 배열에 해당 클로저를 저장
        completionHandlers.append(completion)
    }
    
    func withoutEscaping(completion: () -> Void) {
        completion()
    }
    
    class MyClass {
        var x = 10
        func callFunc() {
            withEscaping { self.x = 100 }
            withoutEscaping { x = 200 }
        }
    }
    let mc = MyClass()
    mc.callFunc()
    print(mc.x)
    completionHandlers.first?()
    print(mc.x)
    
    // 결과
    // 200
    // 100
    ```
    
    위의 예시에서는 MyClass의 함수 `callFunc()`는 클로저를 인자를 가는 `withEscaping(completion:)`
    과 `withoutEscaping(completion:)`을 각각 호출한다. 이 때 `withEscaping(completion:)`
    은 `completion`의 파라미터가 `Escaping Closure`형태로 구현되어 있다.
    
     `completionHandlers.append(completion)`코드를 통해 `withEscaping(completion:)`
    외부에 클로저를 저장한다. 
    
    즉, 클로저가 함수에서 빠져나갔다. 이렇게 함수를 호출하는 도중에 해당 함수 외부에 클로저를 저장하기 위해서는 클로저는 `Escaping Closure`이어야 한다.
    
    **이 때, 클로저가 탈출한다는 의미는 해당 함수의 실행을 중간에 끊고, 탈출(escape)하는 의미가 아니다. 여기서의 탈출(escape)은 클로저를 외부로 보낼 수 있다는 의미이다.**
    
    ---
    
    ## 🔸@escaping 언제 사용하는가
    
    ```swift
    func ex1(completion:() -> ()) {
    	completion()
    }
    ```
    
    ### completion == 매개변수 X , return  X 인 () → () 함수 타입
    
    ### Swift closures 는 1급 객체이기에 파라미터로 closures를 받을 수 있다!
    
    - 1급객체
        1. 변수에 저장할수 있다.
        2. 매개변수로 전달할 수 있다.
        3. return 값으로 사용할 수 있다.
    - 파라미터 인자값 가능
    - 변수 & 상수 대입 가능
    
    ---
    
    ```swift
    ex1{
    		print("closures study")                          //closures study
    }
    ```
    
     
    
    ### 매개변수로 함수를 넘겨줄 수 있고
    
    **매개변수로 넘겨준 함수가 ex1 함수 내부에서 completion이란 매개 상수로 저장되어 사용된다.**
    
    ```swift
    func ex1(completion: () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { //비동기 3초 딜레이
            completion()
        }
    }
    ```
    
    매개변수로 받은 completion에 저장된 클로저를 3초후에 실행 시키고 싶다? 
    
    이렇게 코딩할 경우 —> **Error 발생**
    
    일반적으로 **아무런 키워드 없이 파라미터로 받는 클로저**는 모두 **non-escaping closure**이다.
    
    이름 그대로 탈출이 불가능한 클로저
    
    함수의 흐름을 탈출하지 않는 클로저란 뜻으로, 함수가 종료되고 나서 클로저가 실행될 수 없다는 말이다. 함수가 종료될때 클로저의 사용도 같이 종료되어서 같이 끝나야 되는것이다.
    
    -근데 위 함수 같은 경우는 **asnyc로 3초뒤에 클로저를 실행**되게끔 해버렸다. 
    
    ```swift
    func ex1(completion: () -> ()) {
    	print("start")
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) { //비동기 3초 딜레이
    	print("when???")
    }
    print("the end")
    }
    
    ex1{}
    print("really the end")
    
    ```
    
    - 결과
        
        ```swift
        //start
        //the end
        //really the end
        //when???
        ```
        
    
    함수 내부에서 **3초 뒤에 실행되는 async task**를 줘버렸기 때문에 이론상 **함수의 생애주기가 완전히 끝나버렸지만, 그 이후에 해당 작업이 실행**되게 된다.
    
    이것이 **함수의 흐름을 탈출한 상황**인데, 
    
    3초뒤에 실행되는 async task를 completion으로 다시 바꾼다 생각해보면 **completion은 함수가 끝나기 전에 실행이 모두 종료되어야 하는데,** **함수의 흐름을 벗어나 호출되어야 하기 때문에 이는 non-escaping parameter 아니기 때문에** 에러가 생긴다.
    
                                                        **따라서  non-escaping의 경우**
    
    1. 함수 내부에서 직접 실행하기 위해서만 사용한다.
    2. 파라미터로 받은 클로저는 변수 & 상수에 대입 할 수 없고
    3. 중첩 함수 내부에서 클로저를 사용할 경우, 중첩함수를 리턴할 수 없다.
    4. 함수의 실행 흐름을 탈출하지 않아, 함수가 종료되기 전에 무조건 실행되어야한다.
    
    이 4가지 특징을 가지고 있다.
    
    그렇다면 parameter로 받은 closure는 **비동기로 사용못하나?** **함수 흐름 탈출 못하나?** 할때 사용하는 키워드가  **@escaping** 이다.
    
    ```swift
    func ex1(completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion()
        }
    }
    ```
    
    이런 식으로 함수의 타입 선언하기 전에 @escaping이란 키워드를 붙여주면, 
    
    이 클로저는 함수의 실행 흐름에 상관없이 실행되는 클로저다 라고 알려주는 것이다.
    
    ```swift
    func ex1(completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion()
        }
    }
    
    ex1{
    	print("running now")
    }
    print("func the end")
    ```
    
    실행해보면 에러 없이 `completion`이 잘 실행된다.
    
    `func the end`가 먼저 실행되고, 3초 뒤에 `running now`가 실행될 것이다. 
    
    이것이 **@escaping** 이다.
    
    ---
    
    ## 🔸Closure?, Closure capture?
    
    Closure란 내부 함수와 내부 함수에 영향을 미치는 주변 환경을 모두 포함한 객체이다.
    
    ```swift
    funcd doSomething(){
    	var message = "hi i'm wonhyeong"
    //클로저 범위 시작
    
    var num = 10  //closure 기준 외부 변수(num)
    let closure = { print(num)}
    
    //클로저 범위 끝
    
    print(message)
    }
    ```
    
    closure는 내부에서 **외부 변수인 num이라는 Value 타입의 변수를 사용**하기 때문에 n**um의 값을 내부적으로 저장**하고 있는데 이것을 **num의 값이 capture 되었다** 라고 표현한다.
    
    message란 변수는 closure 내부에서 사용하지 않기 때문에 따로 저장(캡쳐)하지 않았다.
    
    ## 🔸Closure의 캡쳐 방식
    
    ### closure는 값을 캡쳐할때 Value/Reference 타입에 관계없이 Reference Capture 한다.
    
    ```swift
    func doSomething(){
    	var num: Int = 0
    	print("1 = \(num)")
    
    	let closure = {
    		print("3 = \(num)")
    }
    
    num = 100
    print("2 = \(num)")
    closure()
    }
    ```
    
    closure는 같은 Scope의 지역변수인 num을 사용하므로 closure는 num값을 캡쳐할 것이다.
    
    근데 num이 Int형, Value Type이여도 **Reference Caputure**를 한다!!
    
    ---
    
    따라서  closure를 실행하기 전에 num의 값을 바꾸면, closure는 num을 참조하고 있기 때문에 closure에서 실행하는 num의 값도 바뀐다.
    
    ### closure의 변수가 사용되는 시점의 변수의 값을 평가한다.
    
    - 프로그램 결과
