//
//  ContentView.swift
//  Lab19EVCar
//
//  Created by Yooj on 2022/12/07.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    @StateObject var carStore : CarStore = CarStore()
    @State private var isShowing: Bool = false
    @State private var isPresent: Bool = false
    
    @ObservedObject var authStore: AuthStore = AuthStore()
    
    @AppStorage("log_status") var logStatus: Bool = false
    
    var body: some View {
        NavigationStack {
            
            if authStore.logStatus {
                CarListView(carStore: carStore,isShowing: $isShowing)
            } else{
                LoginView(authStore: authStore)
            }
        }
        .fullScreenCover(isPresented: $isPresent) {
            EmailLoginView( authStore: AuthStore())
        }
        .sheet(isPresented: $isShowing) {
            AddView(carStore: carStore, isPresent: $isShowing)
        }
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Text(car.name)
            Text(car.id)
            Text(car.description)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
