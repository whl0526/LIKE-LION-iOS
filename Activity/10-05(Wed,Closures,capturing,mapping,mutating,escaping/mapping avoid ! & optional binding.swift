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