// 계좌 정보를 담는 클래스를 만들어라
class BankAccount {

  // 프로퍼티
  // 1. 은행 계좌 번호
  var accountNumber: Int = 0

  // 2. 계좌에 남은 잔고
  var accountBalance: Float = 0.0

  // 3. 수수료
  let fees: Float = 5.00

  // 4.현재의 잔액에서 수수료를 뺀 급액
  // 연산 프로퍼티 - 밖에서 보면 프로퍼티지만 안에서는 get과 set의 메서드(함수)들
  var balanceLessFees: Float {
    get {
      return accountBalance - fees
    }
    set {
      accountBalance = newValue + fees
    }
  }

  // 메서드 - method

  // 초기화 - 계좌 번호와 잔고를 받아서 시작
  init(number: Int, balance: Float) {
    accountNumber = number
    accountBalance = balance
  }

  deinit {
    print("인스턴스가 제거됩니다")
  }

  // 계좌 정보를 출력하기
  func displayBalance() {
    print("Number \(accountNumber)")
    print("Current balance is \(accountBalance)")
    print("Current balanceLessFees is \(balanceLessFees)")
  }

  // BankAccount가 최대로 받을 수 있는 금액
  class func getMaxBalance() -> Float {
    return 100000.00
  }
}

class SavingsAccount: BankAccount {
  // 이자율 프로퍼티 추가
  var interestRate: Float = 0.0254

  // 이자 구하는 메소드-함수 추가
  func calculateInterest() -> Float {
    return interestRate * accountBalance
  }
}




// 우리가 돈이 없지 XX가 없냐
let pocketMoney: Float = 124.0

// 우리가 입금할 금액이 어떤계좌가 만들어지든 입금 가능한 금액일 때에만...
if pocketMoney < SavingsAccount.getMaxBalance()  {

  // BankAccount 타입의 인스턴스(객체) 생성
  let account: SavingsAccount = SavingsAccount(number: 12312312345, balance: pocketMoney)

  print("이자: \(account.calculateInterest())")

  account.displayBalance()
} else {
  print("금액이 계좌의 한도를 초과했습니다")
}