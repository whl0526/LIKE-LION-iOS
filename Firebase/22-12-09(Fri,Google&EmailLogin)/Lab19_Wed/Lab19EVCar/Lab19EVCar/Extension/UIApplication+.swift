//
//  LoginViewModel.swift
//  Lab19EVCar
//
//  Created by Yooj on 2022/12/08.
//

import Foundation
import UIKit

extension UIApplication{
    func closeKeyboard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func rootController()-> UIViewController{
        guard let window = connectedScenes.first as? UIWindowScene else{return .init()}
        guard let viewcontroller = window.windows.last?.rootViewController else {return .init()}
        
        return viewcontroller
    }

}


