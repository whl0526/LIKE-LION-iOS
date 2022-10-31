//
//  ContentView.swift
//  ActivityGraph
//
//  Created by 이원형 on 2022/10/27.
//
import SwiftUI
import Charts

struct Bar: Identifiable{
    let id = UUID()
    var name: String
    var day: String
    var value: Double
    var color: Color
    
    static var barGraph : [Bar] {
        var newBars = [Bar]()
        let color: Color = .blue
        let num = ["first","second","third","fourth","fifth"]
        
        for i in 1...5{
            let rand = Double.random(in: 0...100)
            
            let bar = Bar(name: "\(i)", day: num[i-1], value: rand, color: color)
            newBars.append(bar)
        }
        return newBars
    }
}

struct ContentView: View {
    @State private var bars = Bar.barGraph
    @State private var SelectedId: UUID  = UUID()
    @State private var text = "배열 5개, 1~100사이 랜덤숫자 "
    
    var body: some View {
        VStack {
            Text(text)
                .bold()
                .padding()
            HStack(alignment: .bottom){
                ForEach(bars) { bar in
                    VStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(bar.color)
                            
                                .frame(width:40,
                                       height:bar.value,
                                       alignment: .bottom)
                                .onTapGesture {
                                    self.SelectedId = bar.id
                                    self.text = "값: \(Int(bar.value))"
                                }
                            Text("\(Int(bar.value))")
                                .foregroundColor(.white)
                        }//ZStack
                        Text(bar.day)
                        
                        
                        
                    }//VStack
                }//Foreach
            }//HStack
            VStack{
                Chart {
                    ForEach(bars) { bar in
                        LineMark(x: .value("day", bar.day),
                                 y: .value("value", bar.value))
                        
                    }
                }//Chart
                
            }//VStack
            Button("Reset"){
                withAnimation{
                    self.bars = Bar.barGraph
                }
                
            }//Hstack
        }//VStack
        
    }//body
}//Content



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}