import Foundation

protocol Account{
    var ownerName: String {
        get set
    }
    func displayOwnerName() 
}


//은행 계좌에 대한 클래스 만들자
class BankAccount : Account {
    
    
    //프로퍼티
    //0. 프로토콜이 시켜서 만듦
    var ownerName: String = ""
    //1.은행 계좌 번호
    var accountNumber:Int  = 0
    //2.남은 잔고 데이터
    var accountBalance: Float = 0.0
    //3.수수료
    let fees:Float = 25.0
    //초기화
    init(number: Int, balance:Float){
        accountNumber = number
        accountBalance = balance
    }
    
    //프로토콜이 시켜서 만듦
    func displayOwnerName() {
        print("Owner name is \(ownerName)")
    }
    
    //현재 잔액에서 수수료를 빼는 값을 주고 받을때 새로 계산해두는 연산 프로퍼티 
    var balanceLessFees: Float {
        get{
            return accountBalance - fees
        }
        
        set{
            accountBalance = newValue - fees //newValue는 새로 입력되는 값
        }
        
    }
    
    //계좌 정보와 잔고를 출력하는 메소드
    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
    
    //최대로 담을 수 있는 금액을 알려주는 클래스 메소드 
    //인스턴스를 따로 만들어 초기화하지 않아도 실행해서 확인하게 해줘야 한다.
    class func getMaxBalance() -> Float{
        return 100000.00
    }
}
print("max balance $ is \(BankAccount.getMaxBalance())")

//let expert = Expert()처럼   

//var account = BankAccount()
//account.accountNumber = 12345
//account.accountBalance = 4.0
//account.displayBalance()

var account2 = BankAccount(number:1010101010, balance: 205.3)
account2.displayBalance()
account2.accountBalance = 500.0

print("balance less fees: \(account2.balanceLessFees)")

account2.balanceLessFees = 850.4
account2.displayBalance()
print("balance less fees: \(account2.balanceLessFees)")

account2.ownerName = "wonhyeong"
account2.displayOwnerName()