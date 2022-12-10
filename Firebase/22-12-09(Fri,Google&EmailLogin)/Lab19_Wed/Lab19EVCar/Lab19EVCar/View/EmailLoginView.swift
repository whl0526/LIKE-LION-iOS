//
//  AuthView.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//
import SwiftUI

struct EmailLoginView: View {
    
    @State var email = ""
    @State var pw = ""
    @ObservedObject var authStore: AuthStore
    
    @AppStorage("log_status") var logStatus: Bool = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Sign in with Email")
                Spacer()
            }
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
            SecureField("PW", text: $pw)
            
            HStack {
                Button {
                    authStore.registerUser(email: email, password: pw)
                } label: {
                    Text("등록")
                }
                
                Button {
                    authStore.login(email: email, password: pw)
                    
                } label: {
                    Text("로그인")
                }
                
                Button {
                    authStore.logout()
                } label: {
                    Text("로그아웃")
                }
            }
            
            Text(authStore.currentUser?.uid ?? "비로그인")
                .padding()
        }
        .padding()
    }
}

struct EmailLoginView_Previews: PreviewProvider {
    @State static var isPresent = false
    static var previews: some View {
        EmailLoginView(authStore: AuthStore())
    }
}
