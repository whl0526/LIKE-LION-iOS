
- 10-13(목-**xcode(Obj-C & Swift-Calc app** )
    
    ## 🔸xcode Obj-C  Hello World 출력
    
    ```objectivec
    //
    //  AppDelegate.m
    //  helloworldMacOS
    //
    //  Created by 이원형 on 2022/10/13.
    //
    
    #import "AppDelegate.h"
    
    @interface AppDelegate ()
    
    @property (strong) IBOutlet NSWindow *window;
    @property (weak) IBOutlet NSTextFieldCell *helloTextFieldCell;
    - (IBAction)preesButton:(id)sender;
    @property (weak) IBOutlet NSTextField *myTextField;
    
    @end
    
    @implementation AppDelegate
    
    - (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
        // Insert code here to initialize your application
    }
    
    - (void)applicationWillTerminate:(NSNotification *)aNotification {
        // Insert code here to tear down your application
    }
    
    - (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
        return YES;
    }
    
    - (IBAction)preesButton:(id)sender {
        
        NSLog(@"%@", _myTextField);
        NSString *string = @"Hello World";
        
        NSLog(@"%@", string);
        
        self.helloTextFieldCell.title = string;
        
        // NSSpeechSynthesizer 음성합성기를 이용해서 Hello World를 읽어보자!
        NSSpeechSynthesizer *synthesizer = [[NSSpeechSynthesizer alloc] init];
        [synthesizer startSpeakingString:string];
        
    }
    @end
    ```
    
    ## 🔸xcode Swift 제곱근 구하기
    
    ```swift
    //
    //  ViewController.swift
    //  Calc
    //
    //  Created by 이원형 on 2022/10/13.
    //
    
    import UIKit
    import AVFoundation
    
    class ViewController: UIViewController {
    
        let synthesizer : AVSpeechSynthesizer = AVSpeechSynthesizer()
        @IBOutlet weak var myLabel: UILabel!
        @IBOutlet weak var myTextField: UITextField!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    
        @IBAction func myCalcButton(_ sender: Any) {
            let myString : String = myTextField.text ?? ""
            let myNumber : Int = Int(myString) ?? 0
            
            print("\(myNumber)")
            
            let myResultNumber = String(myNumber * myNumber)
            print("\(myResultNumber)")
            
            myLabel.text = "결과 :\(myResultNumber)"
            
            let utterance: AVSpeechUtterance = AVSpeechUtterance(string:myResultNumber)
            synthesizer.speak(utterance)
        }
        
        
        
        
        
    }
    ```
    
    ## 🔸xcode Swift  두 수 사칙연산 계산기
    
    ```objectivec
    //
    //  ViewController.swift
    //  team10Calculator
    //
    //  Created by Martin on 2022/10/13.
    //
    
    import UIKit
    import AVFoundation
    
    class ViewController: UIViewController {
    
        @IBOutlet weak var myFirstNumber: UITextField!
        @IBOutlet weak var mySecondNumber: UITextField!
        @IBOutlet weak var myResult: UILabel!
        
        let synthesizer = AVSpeechSynthesizer()
        
        let eun: [Int] = [1, 3, 6, 7, 8, 0]
        var eunNeun: String = "는"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
    
        }
        
       
    
        @IBAction func divide(_ sender: Any) {
            let firstText: String = myFirstNumber.text ?? ""
            let secondText: String = mySecondNumber.text ?? ""
            
            let firstNum: Float = Float(firstText) ?? 0
            let secondNum: Float = Float(secondText) ?? 0
            
            let resultText: String = "\(firstNum) 나누기 \(secondNum) 은(는) \(firstNum / secondNum)입니다. "
            myResult.text = resultText
            speechString(string: resultText)
        }
        
        @IBAction func multiply(_ sender: Any) {
            let firstText: String = myFirstNumber.text ?? ""
            let secondText: String = mySecondNumber.text ?? ""
            
            let firstNum: Int = Int(firstText) ?? 0
            let secondNum: Int = Int(secondText) ?? 0
            
            myResult.text = "\(firstNum * secondNum)"
            
            let resultText: String = "\(firstNum) 곱하기 \(secondNum) 은(는) \(firstNum * secondNum)입니다. "
            myResult.text = resultText
            speechString(string: resultText)
        }
        
        @IBAction func minus(_ sender: Any) {
            let firstText: String = myFirstNumber.text ?? ""
            let secondText: String = mySecondNumber.text ?? ""
            
            let firstNum: Int = Int(firstText) ?? 0
            let secondNum: Int = Int(secondText) ?? 0
            
            
            
            let resultText: String = "\(firstNum) 빼기 \(secondNum) 은(는) \(firstNum - secondNum)입니다. "
            myResult.text = resultText
            speechString(string: resultText)
        }
        
        @IBAction func plus(_ sender: Any) {
            //입력값 가져오기
            let firstText: String = myFirstNumber.text ?? ""
            let secondText: String = mySecondNumber.text ?? ""
            
            
            //입력값 숫자로 바꾸기
            let firstNum: Int = Int(firstText) ?? 0
            let secondNum: Int = Int(secondText) ?? 0
            
            //결과 텍스트 만들기
            let resultText: String = "\(firstNum) 더하기 \(secondNum) 은(는) \(firstNum + secondNum)입니다. "
            
            //라벨에 결과 텍스트 띄우기
            myResult.text = resultText
            
            //말하기 함수에 전달
            speechString(string: resultText)
            
        }
        
        
        //말하기 함수
        func speechString(string: String) {
            let utterance = AVSpeechUtterance(string: string)
            synthesizer.speak(utterance)
        }
        
    
    }
    ```
