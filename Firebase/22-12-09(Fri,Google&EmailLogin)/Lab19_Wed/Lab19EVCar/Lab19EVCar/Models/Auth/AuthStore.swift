//
//  AuthViewModel.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//
import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

class AuthStore: ObservableObject {
    
    @Published var currentUser: Firebase.User?
    @Published var logStatus: Bool
    
    init() {
        currentUser = Auth.auth().currentUser
        logStatus = false
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            self.logStatus = true
            self.currentUser = result?.user
        }
    }
    
    func logout() {
        currentUser = nil
        try? Auth.auth().signOut()
    }
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
             if let error = error {
                 print("Error : \(error.localizedDescription)")
                 return
             }
             
             guard let user = result?.user else { return }
             
             print(user.uid)
         }
    }
    
    func logGoogleUser(user: GIDGoogleUser){
        Task{
            do{
                guard let idToken = user.authentication.idToken else{return}
                let accessToken = user.authentication.accessToken
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
                
                try await Auth.auth().signIn(with: credential)
                
                print("구글 로그인 성공!")
                await MainActor.run(body: {
                    withAnimation(.easeInOut){ logStatus = true }
                })
            } catch{
                print("error")
            }
            
        }
    }
}
