
- 10-14(금-**xcode-Swift-Team10 calculator**)
    
    ## 🔸Team10 Calculator App
    
<img width="457" alt="Untitled" src="https://user-images.githubusercontent.com/67450169/195961418-7996277c-dcfd-4492-af0e-f1230e447c4f.png">    
    ```swift
    //
    //  ViewController.swift
    //  Clac
    //
    //  Created by team10 on 2022/10/14.
    //
    
    import UIKit
    
    class ViewController: UIViewController {
    
        enum Operators {
            case plus       // 75
            case minus      // 77
            case multiply   // 74
            case divide     // 79
            case end        // 93
            case cancel     // 99
            case allCancel  // 100
            case normal
        }
        // Operators 초기화(normal)
        var currentOperator: Operators = .normal
        
        // 결과를 보여주는 label 변수
        @IBOutlet weak var resultLabel: UILabel!
        
        //계산결과를 담는 변수
        var result: Float = 0.0
        
        // 숫자 데이터 저장
        var userInputArray = ["",""]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
    
        @IBAction func pressNumberBtn(_ sender: UIButton) {
            // 현재 선택된 번호를 받아옴
            let getNumber = sender.titleLabel?.text; // = currentTitle  ?? ""
            print("누른 번호 :\(getNumber)")
            
            switch currentOperator {
            case .normal:
                userInputArray[0] += getNumber!
                printLabel(result: userInputArray[0])
                
            default:
                userInputArray[1] += getNumber!
                printLabel(result: userInputArray[1])
            }
            print(userInputArray)
        }
        
        @IBAction func pressOperator(_ sender: UIButton) {
            //commend+shift+l : switch 검색하면 바로 추가 가능
            switch sender.tag {
            case 75:
                currentOperator = .plus
            case 77:
                currentOperator = .minus
            case 74:
                currentOperator = .multiply
            case 79:
                currentOperator = .divide
            case 93:// 결과 계산
                calculate(userInputArray:userInputArray,calculator:currentOperator)
                currentOperator = .end
                calculate(userInputArray:userInputArray,calculator:currentOperator)
            case 99:
                cancel()
            case 100:
                allCancel()
            default:
                print()
                break
            }
        }
        // MARK: 연산 수행 함수
        ///userInputArray : 입력받은 배열, calculator : 수행할 연산자
        func calculate(userInputArray:[String],calculator: Operators){
            
            switch calculator {
            case .plus:
                result = Float(userInputArray[0])! + Float(userInputArray[1])!
                print(result)
            case .minus:
                print(userInputArray)
                result = Float(userInputArray[0])! - Float(userInputArray[1])!
               
            case .multiply:
                print(userInputArray)
                result = Float(userInputArray[0])! * Float(userInputArray[1])!
                
            case .divide:
                print(userInputArray)
                result = Float(userInputArray[0])! / Float(userInputArray[1])!
                
            case .end:
                self.userInputArray[0] = String(result)
                self.userInputArray[1] = ""
                print(userInputArray)
                
            default:
                print(result)
            }
            printLabel(result: String(result))
        }
        // MARK: C 버튼 수행 함수
        func cancel(){
            switch currentOperator {
            case .normal:
                userInputArray[0] = ""
            default:
                userInputArray[1] = ""
            }
            printLabel(result: "0")
        }
        // MARK: AC 버튼 수행 함수
        func allCancel(){
            print(userInputArray)
            userInputArray = ["",""]
            currentOperator = .normal
            printLabel(result: "0")
            print(userInputArray)
        }
        // MARK: Label에 데이터 출력 함수
        func printLabel(result: String){
            resultLabel.text = result
            
           
        }
    }
    ```
    

## 🔸if문으로 작성한 calculator

<img width="437" alt="Untitled (1)" src="https://user-images.githubusercontent.com/67450169/195961426-f321b02f-e0d5-4f6b-98da-e6bf09903d17.png">
```swift
//
//  ViewController.swift
//  iosCalcultaor
//
//  Created by 이원형 on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    
    
    var num : Int = 0
    var sum : Int = 0
    var typing : Bool = false
    
    var plus : Bool = false
    var minus : Bool = false
    var cross : Bool = false
    var divide : Bool = false
 
    @IBAction func numbers(_ sender: UIButton) {
        let num = sender.currentTitle ?? ""
        
        if typing{
            let currentDisplay = display.text ?? ""
            display.text = currentDisplay + num
        }else {
            display.text = num
        }
        typing = true
    }
    @IBAction func clear(_ sender: Any) {
        display.text = ""
        print("\(sum),\(num)")
        sum = 0
        num = 0
        
    
    }
    @IBAction func plusBtn(_ sender: Any) {
        if(plus==false){
            num = Int(display.text ?? "") ?? 0
            display.text = "+"
            sum = num + sum
            typing = false
            plus = true
        }
    }
    @IBAction func minusBtn(_ sender: Any) {
        if(minus==false){
            num = Int(display.text ?? "") ?? 0
            display.text = "-"
            sum = num + sum
            typing = false
            minus = true
        }
    }
    
    @IBAction func crossBtn(_ sender: Any) {
        if(cross==false){
            num = Int(display.text ?? "" ) ?? 0
            display.text = "*"
            sum = num + sum
            typing = false
            cross = true
        }
        
    }
    @IBAction func divideBtn(_ sender: Any) {
        if(divide==false){
            num = Int(display.text ?? "") ?? 0
            display.text = "/"
            sum = num + sum
            typing = false
            divide = true
        }
    }
    
    @IBAction func calcResult(_ sender: Any) {
        if plus{
            sum = sum + Int(display.text!)!
            plus = false
            display.text = String(sum)
        }
        if minus {
            sum = sum - Int(display.text!)!
            minus = false
            display.text = String(sum)
        }
        if cross{
            sum = sum * Int(display.text!)!
            cross = false
            display.text = String(sum)
        }
        if divide{
            sum = sum / Int(display.text!)!
            divide = false
            display.text = String(sum)
    }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.}
    }
    
    
}
```
