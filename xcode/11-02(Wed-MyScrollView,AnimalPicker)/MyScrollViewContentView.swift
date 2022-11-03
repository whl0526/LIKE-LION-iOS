//
//  ContentView.swift
//  UIViewDemo
//
//  Created by 이원형 on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyScrollView(text: "fukin UIView in SwiftUi")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}