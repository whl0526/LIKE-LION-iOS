//
//  LoginUI.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//

import SwiftUI
import AuthenticationServices
import Firebase
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    @ObservedObject var authStore: AuthStore

    @State var isLogin: Bool = false
    
    var body: some View {
       
        ScrollView(.vertical, showsIndicators: false){
            
            VStack {
                Image(systemName: "sun.min.fill")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading){
                    Text("Welcome Lab19EvCar App")
                }
                .font(.title)
                .fontWeight(.semibold)
                .lineSpacing(10)
                .padding(.top, 20)
                .padding(.trailing,16)
            }
            .padding(.vertical)
            
            // 구글 버튼
            GoogleSignInButton(style: .wide){
                if let clientID = FirebaseApp.app()?.options.clientID{
                    GIDSignIn.sharedInstance.signIn(with: .init(clientID: clientID), presenting: UIApplication.shared.rootController()){ user, error in
                        if let error = error{
                            print(error.localizedDescription)
                            return
                        }
                        
                        if let user{
                            authStore.logGoogleUser(user: user)
                        }
                    }
                }
            }.padding()
            // 이메일 로그인
            EmailLoginView(authStore: authStore)
        }
    }
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authStore: AuthStore())
    }
}
