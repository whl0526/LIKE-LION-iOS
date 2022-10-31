//
//  ContentView.swift
//  ActivityGraph
//
//  Created by 이원형 on 2022/10/27.
//
import SwiftUI
import Charts

struct Bar1: Identifiable{
    let id = UUID()
    var name: String
    var day: String
    var value: Double
    var color: Color
    
    static var barGraph : [Bar1] {
        var newBars1 = [Bar1]()
        
        let color: Color = .red
        let dayNum = ["First","Second","Third","Fourth","Fifth"]
        
        for i in 1...5{
            let rand = Double.random(in: 0...100)
            
            let bar = Bar1(name: "\(i)", day: dayNum[i-1], value: rand, color: color)
            newBars1.append(bar)
            
        }//for
        return newBars1
    }//static
}

struct Bar2: Identifiable{
    let id = UUID()
    var name: String
    var day: String
    var value: Double
    var color: Color
    
    static var barGraph : [Bar2] {
        var newBars2 = [Bar2]()
        
        let color: Color = .green
        let dayNum = ["Mon","Tue","Wed","Thu","Friday"]
        
        for i in 1...5{
            let rand = Double.random(in: 0...100)
            
            let bar = Bar2(name: "\(i)", day: dayNum[i-1], value: rand, color: color)
            newBars2.append(bar)
            
        }//for
        return newBars2
    }//static
}

struct Bar3: Identifiable{
    let id = UUID()
    var name: String
    var day: String
    var value: Double
    var color: Color
    
    static var barGraph : [Bar3] {
        var newBars3 = [Bar3]()
        
        let color: Color = .blue
        let dayNum = ["One","Two","Three","Four","Five"]
        
        for i in 1...5{
            let rand = Double.random(in: 0...100)
            
            let bar = Bar3(name: "\(i)", day: dayNum[i-1], value: rand, color: color)
            newBars3.append(bar)
            
        }//for
        return newBars3
    }//static
}

struct ContentView: View {
    @State private var bars1 = Bar1.barGraph
    @State private var bars2 = Bar2.barGraph
    @State private var bars3 = Bar3.barGraph
    
    @State private var Id: UUID  = UUID()
    @State private var text = "배열 5개, 1~100사이 랜덤숫자 "
    
    var body: some View {
        VStack {
            Text(text)
                .bold()
                .padding()
            HStack(alignment: .bottom){
                ForEach(bars1) { bar in
                    VStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(bar.color)
                            
                                .frame(width:65,
                                       height:bar.value,
                                       alignment: .bottom)
                                .onTapGesture {
                                    self.Id = bar.id
                                    self.text = "값: \(Int(bar.value))"
                                }
                            Text("\(Int(bar.value))")
                                .foregroundColor(.white)
                        }//ZStack
                        Text(bar.day)
                        
                        
                        
                    }//VStack
                }//Foreach
            }//HStack
            HStack(alignment: .bottom){
                ForEach(bars2) { bar in
                    VStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(bar.color)
                            
                                .frame(width:65,
                                       height:bar.value,
                                       alignment: .bottom)
                                .onTapGesture {
                                    self.Id = bar.id
                                    self.text = "값: \(Int(bar.value))"
                                }
                            Text("\(Int(bar.value))")
                                .foregroundColor(.white)
                        }//ZStack
                        Text(bar.day)
                        
                        
                        
                    }//VStack
                }//Foreach
            }//HStack
            HStack(alignment: .bottom){
                ForEach(bars3) { bar in
                    VStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(bar.color)
                            
                                .frame(width:65,
                                       height:bar.value,
                                       alignment: .bottom)
                                .onTapGesture {
                                    self.Id = bar.id
                                    self.text = "값: \(Int(bar.value))"
                                }
                            Text("\(Int(bar.value))")
                                .foregroundColor(.white)
                        }//ZStack
                        Text(bar.day)
                        
                        
                        
                    }//VStack
                }//Foreach
            }//HStack
            HStack {
                Button("Reset1"){
                    withAnimation{
                        self.bars1 = Bar1.barGraph
                    }
                }
                Button("Reset2"){
                    withAnimation{
                        self.bars2 = Bar2.barGraph
                    }
                }
                Button("Reset3"){
                    withAnimation{
                        self.bars3 = Bar3.barGraph
                    }
                }
                
            }
            .padding()
            
            //Hstack
        }//VStack
        
    }//body
}//Content



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
