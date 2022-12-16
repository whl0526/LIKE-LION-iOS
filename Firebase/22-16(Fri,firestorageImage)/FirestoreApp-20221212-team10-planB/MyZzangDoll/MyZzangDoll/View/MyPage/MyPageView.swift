//
//  MyPageView.swift
//  MyZzangDoll
//
//  Created by 김예원 on 2022/12/14.
//

import SwiftUI

class AuthSheetState: ObservableObject {
    @Published var presentLoginView: Bool = false
    @Published  var presentSignUpView: Bool = false
}


struct MyPageView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var authSheetState: AuthSheetState = AuthSheetState()
    
    var body: some View {
        let _ = dump(authViewModel.currentUser?.email)
        
        
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("\(authViewModel.currentUser?.email ?? "사용자 정보 없음")")
            
            
            switch authViewModel.authenticationState {
            case .authenticated:
                Button("로그아웃") {
                    authViewModel.logout()
                }
            case .unauthenticated:
                Button("로그인") {
                    self.authSheetState.presentLoginView = true
                }.sheet(isPresented: $authSheetState.presentLoginView) {
                    LoginView(authSheetState: self.authSheetState)
                        .environmentObject(authViewModel)
                }
            }
        } // VStack
        
    }
}

/*struct MyPageView_Previews: PreviewProvider {
    @ObservedObject var authViewModel: AuthViewModel = AuthViewModel()
    @StateObject var authSheetState: AuthSheetState = AuthSheetState()
    
    static var previews: some View {
        MyPageView(authViewModel: authViewModel,authSheetState: authSheetState)
    }
}*/
