//
//  AuthView.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//
import SwiftUI

struct AuthView: View {
    
    @State var email = ""
    @State var pw = ""
    @ObservedObject var viewModel: AuthViewModel
    @Binding var isPresent: Bool
    
    var body: some View {
        
        VStack {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
            SecureField("PW", text: $pw)
            
            HStack {
                Button {
                    viewModel.registerUser(email: email, password: pw)
                } label: {
                    Text("등록")
                }
                
                Button {
                    viewModel.login(email: email, password: pw)
                    isPresent.toggle()
                } label: {
                    Text("로그인")
                }
                
                Button {
                    viewModel.logout()
                } label: {
                    Text("로그아웃")
                }
            }
            
            Text(viewModel.currentUser?.uid ?? "비로그인")
                .padding()
        }
        .padding()
    }
}
