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