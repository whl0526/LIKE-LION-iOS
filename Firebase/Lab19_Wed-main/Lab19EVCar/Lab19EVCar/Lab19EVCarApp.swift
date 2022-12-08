//
//  Lab19EVCarApp.swift
//  Lab19EVCar
//
//  Created by Yooj on 2022/12/07.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Lab19EVCarApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
  
    
    var body: some Scene {
        WindowGroup {
            ContentView()
           
        }
     
    }
}
