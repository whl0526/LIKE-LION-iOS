//
//  SignUpView.swift
//  MyZzangDoll
//
//  Created by Martin on 2022/12/13.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    @State var pw = ""
    @State var pwCheck = ""
    @State var nickName = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var authSheetState: AuthSheetState

    
    var body: some View {
    
            VStack{
                TextField("이메일", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .borderedTextField()
                
                SecureField("비밀번호", text: $pw)
                    .borderedTextField()
                SecureField("비밀번호 확인", text: $pwCheck)
                    .borderedTextField()
              
                if pw != "" {
                    if pw != pwCheck{
                        Text("비밀번호가 일치하지 않습니다.")
                    } else {
                        if pw.count < 6 {
                            Text("비밀번호는 6자리 이상입니다.")
                        } else {
                            Text("비밀번호가 일치합니다.")
                        }
                    }
                } else {
                    Text("비밀번호를 입력해주세요.")
                }
                
                TextField("닉네임",text: $nickName)
                    .borderedTextField()
                
                Button{
                    Task{
                        do{
                            let userdata = try await authViewModel.registerUser(email: email, password: pw, nickName: nickName)
                            await authViewModel.setUserData(userdata)
//                            self.authSheetState.presentLoginView = false
                            self.authSheetState.presentSignUpView = false
                        }
                        catch{print(error)}
                        
                      //  if let userdata = try await authViewModel.registerUser(email: email, password: pw, nickName: nickName){
                       //     await authViewModel.setUserData(userdata)}
                       
                    }
                }label: {
                    Text("등록")
                        .frame(width:339, height: 40)
                }
                .disabled(pw != pwCheck)
                .disabled(pw.count < 6)
                .buttonStyle(.borderedProminent)
                .accentColor(Color("MZPink2"))
                
                Text(authViewModel.errorMessage)

            }
            .padding()

     
    
    }
}




/* struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignUpView(authViewModel: AuthViewModel(), presentSignUpView: .constant(false), presentLoginView: .constant(false))
    }
} */
