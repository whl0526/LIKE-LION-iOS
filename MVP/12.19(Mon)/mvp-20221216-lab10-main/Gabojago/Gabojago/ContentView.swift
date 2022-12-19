//
//  ContentView.swift
//  Gabojago
//
//  Created by 전혜성 on 2022/12/19.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var placeStore: PlaceStore = PlaceStore()
    
    var body: some View {
        VStack {
            ForEach(placeStore.imgArr, id: \.self) { img in
                
                Image(uiImage: img)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                    
            }
            
        }
        .padding()
        .onAppear {
            print("contentView Appear")
            placeStore.fetchPlace()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
