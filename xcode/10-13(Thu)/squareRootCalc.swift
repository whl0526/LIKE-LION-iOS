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