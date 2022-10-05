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