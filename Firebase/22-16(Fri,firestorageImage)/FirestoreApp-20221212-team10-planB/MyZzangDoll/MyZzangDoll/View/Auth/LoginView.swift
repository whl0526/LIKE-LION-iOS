//
//  LoginView.swift
//  MyZzangDoll
//
//  Created by Martin on 2022/12/13.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var pw: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var authSheetState: AuthSheetState
    
    var body: some View {
            NavigationStack {
                VStack {
                    Spacer()
                    
                    HStack {
                        Image("MZdoll")
                            .resizable()
                            .scaledToFit()
                        .frame(width: 120)
                        
                        TitleText()
                            .offset(x: -10, y: 5)
                    }
                    
                    
                        
                    
                    Spacer()
                        .frame(height: 60)
                    
                    TextField("이메일", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .borderedTextField()
                        
                    
                    SecureField("비밀번호", text: $pw)
                        .borderedTextField()
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Button{
                        authViewModel.login(email: email, password: pw)
                    } label: {
                        Text("로그인하기")
                            .frame(width:339, height: 40)
                    }
                    .buttonStyle(.borderedProminent)
                    .accentColor(Color("MZBrown"))
                   
                    
                  /*  Button("로그인") {
                        presentLoginView.toggle()
                    }
                    .sheet(isPresented: $presentLoginView) {
                        LoginView(authViewModel: authViewModel)
                    }*/
                    Button{
                        self.authSheetState.presentSignUpView = true
                    } label: {
                        Text("회원가입 하러가기")
                            .foregroundColor(Color("MZPink2"))
                            .frame(width:339, height: 40)
                            
                    }
                    .sheet(isPresented: $authSheetState.presentSignUpView) {
                        SignUpView(authSheetState: authSheetState)
                            .environmentObject(authViewModel)
                    }
                    .buttonStyle(.plain)
                    .accentColor(Color("MZPink1"))
                    
                    Spacer()
                }
                .padding()
                .background(Color("MZPink1"))
            }
            .accentColor(Color("MZPink2"))
 
    }
}



struct BorderedTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.plain)
            .padding()
            .background (
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color("MZBrown"))
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                    )
                    .frame(height: 50)
            )
    }
}

extension View {
    func borderedTextField() -> some View {
        modifier(BorderedTextField())
    }
}

/* struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(presentLoginView: .constant(false))
    }
} */

struct TitleText: View {
    var body: some View {
        VStack(alignment: .leading, spacing: -8) {
            HStack(alignment: .bottom, spacing: 2) {
                Text("내")
                    .font(.title.weight(.black))
                    .foregroundColor(Color("MZBrown"))
                Text("가")
                    .font(.subheadline.weight(.black))
                    .foregroundColor(Color("MZBrown"))
                    .offset(y: -3)
            }
            HStack(alignment: .bottom, spacing: 2) {
                Text("짱")
                    .font(.title.weight(.black))
                    .foregroundColor(Color("MZBrown"))
                Text("귀여워하는")
                    .font(.subheadline.weight(.black))
                    .foregroundColor(Color("MZBrown"))
                    .offset(y: -3)
            }
            .padding(.leading, 10)
            HStack(alignment: .bottom, spacing: 2) {
                Text("돌")
                    .font(.title.weight(.black))
                    .foregroundColor(Color("MZBrown"))
                Text("Doll")
                    .font(.subheadline.weight(.bold))
                    .foregroundColor(Color("MZBrown"))
                    .offset(y: -3)
            }
        }
    }
}
