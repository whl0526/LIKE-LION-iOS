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