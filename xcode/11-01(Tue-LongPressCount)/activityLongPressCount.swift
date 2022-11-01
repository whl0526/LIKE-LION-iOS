//
//  ContentView.swift
//  ActivityTapCounter
//
//  Created by 이원형 on 2022/11/01.
//

import SwiftUI

struct ContentView: View {
    @State private var counter: Double = 0.0
    @State private var timer: Timer?
    @State var isLongPressingPlus = false
    @State var isLongPressingMinus = false
    

    
    var body: some View {
        
        var formattedFloat = String(format: "%.1f", counter)
      
        VStack(alignment: .center, spacing: 110 ) {
      
                Text("\(formattedFloat)")
                    .font(Font.system(size:70))
                    .foregroundColor(.black)
                
            
            HStack(alignment: .center, spacing: 20)
            {
                CounterMinus(counter: $counter, timer: $timer
                ,isLongPressingMinus: $isLongPressingMinus)
                
                CounterReset(counter: $counter, timer: $timer)
                
                CounterPlus(counter: $counter, timer: $timer
                ,isLongPressingPlus: $isLongPressingPlus)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CounterPlus: View {
    
    @Binding var counter:Double
    @Binding var timer: Timer?
    @Binding var isLongPressingPlus: Bool
    
    var body: some View {
        Button(action: {
            if(self.isLongPressingPlus){
                self.isLongPressingPlus.toggle()
                self.timer?.invalidate()
                
            } else {
                self.counter += 1
                
            }
        }, label: {
            Image(systemName: self.isLongPressingPlus ? "chevron.right.2": "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
        })
        .simultaneousGesture(LongPressGesture(minimumDuration: 1).onEnded { _ in
            self.isLongPressingPlus = true
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                self.counter += 0.1
            })
        })
    }
}

struct CounterMinus: View {
    
    @Binding var counter:Double
    @Binding var timer: Timer?
    @Binding var isLongPressingMinus: Bool
    
    var body: some View {
        Button(action: {
            if(self.isLongPressingMinus){
                self.isLongPressingMinus.toggle()
                self.timer?.invalidate()
                
            } else {
                self.counter -= 1
                
            }
        }, label: {
            Image(systemName: self.isLongPressingMinus ? "chevron.left.2": "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
        })
        .simultaneousGesture(LongPressGesture(minimumDuration: 1).onEnded { _ in
            self.isLongPressingMinus = true
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                self.counter -= 0.1
            })
        })
    }
}

struct CounterReset: View {
    
    @Binding var counter:Double
    @Binding var timer: Timer?
//    @Binding var isLongPressing: Bool
    
    var body: some View {
        Button(action: {
//            if(self.isLongPressing){
//                self.isLongPressing.toggle()
//                self.timer?.invalidate()
//
//            } else {
                self.counter = 0
                
          //  }
        }, label: {
           Text("Reset")
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
            
        })
//        .simultaneousGesture(LongPressGesture(minimumDuration: 1).onEnded { _ in
//            self.isLongPressing = true
//            self.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { _ in
//                self.counter = 0
//            })
//        })
    }
}
