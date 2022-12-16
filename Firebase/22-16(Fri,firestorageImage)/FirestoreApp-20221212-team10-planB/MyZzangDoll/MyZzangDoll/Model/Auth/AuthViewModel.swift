//
//  AuthViewModel.swift
//  MyZzangDoll
//
//  Created by 김예원 on 2022/12/13.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

enum AuthenticationState {
    case unauthenticated
    case authenticated
}


class AuthViewModel: ObservableObject{
    
    
    @Published var authenticationState: AuthenticationState
    @Published var currentUser: Firebase.User? //현재 사용자
    @Published var errorMessage: String = "" //에러 메시지
   // @Published var isLogined: Bool = false //로그인 상태
    //  @AppStorage var currentUser: Firebase.User?
    
    let database = Firestore.firestore()
    
    init() {
        self.currentUser = Auth.auth().currentUser // 현재사용자 (기억/등록)
        
        if Auth.auth().currentUser != nil {
            self.authenticationState = .authenticated
        } else {
            self.authenticationState = .unauthenticated
        }
    }
    
    func login(email:String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            self.currentUser = result?.user
            self.authenticationState = .authenticated
            print("로그인 한 유저 : \(String(describing: self.currentUser?.uid))")
        }
    }
    
    func logout(){
        currentUser = nil
        try? Auth.auth().signOut()
        self.authenticationState = .unauthenticated
    }
    
    @MainActor
    func registerUser(email: String, password: String, nickName: String) async throws -> User {
        
        do{
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = authDataResult.user
            
            print("registeruser \(user.uid), with email: \(user.email ?? "")")
        
            let userData = User(uid: user.uid, nickname: nickName)
           
            return userData
            //await setUserData(userData)
        }
        catch{
            print("54번 줄 : \(error.localizedDescription)")
            
            switch error._code {
            case 17007: self.errorMessage = "이미 가입한 이메일 주소입니다."
            case 17008: self.errorMessage = "잘못된 이메일 형식입니다."
            case 17026: self.errorMessage = "6자리 이상의 비밀번호를 입력해주세요."
            default: self.errorMessage = "\(error._code) : \(error.localizedDescription)"
            }
            
            throw(error)
            
        }
    }
    
    @MainActor
    func setUserData(_ user: User) async {
        do{
            if try await database.collection("User").whereField("nickname", isEqualTo: user.nickname).getDocuments().isEmpty {
                try await database.collection("User")
                    .document(user.uid)
                    .setData(["uid": user.uid,
                              "nickname":user.nickname])
//                self.authenticationState = .authenticated
            } else {
                self.errorMessage = "이미 사용중인 닉네임입니다.\n 다른 닉네임을 사용해주세요."
                print("이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.")
            }
        
         
        }
        catch{
            print("\(error.localizedDescription)")
        }
    }
    
}
