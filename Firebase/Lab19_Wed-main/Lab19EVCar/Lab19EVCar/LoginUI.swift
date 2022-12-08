//
//  LoginUI.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//

import SwiftUI
import AuthenticationServices



struct LoginUI: View {
    var body: some View {
       
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .leading, spacing: 5){
                
                Image(systemName: "sun.min.fill")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading){
                    Text("Welcome")
                    Text("\n Login to Continue")
                        .foregroundColor(.gray)
                }
                .font(.title)
                .padding(.top, 20)
                .padding(.trailing,16)
                
            
            }
        }
    }
}

struct LoginUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginUI()
    }
}
