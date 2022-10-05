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