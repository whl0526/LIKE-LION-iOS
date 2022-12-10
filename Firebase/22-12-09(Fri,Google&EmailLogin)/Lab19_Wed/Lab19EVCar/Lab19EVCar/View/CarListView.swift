//
//  CarListView.swift
//  Lab19EVCar
//
//  Created by Park Jungwoo on 2022/12/08.
//

import SwiftUI

struct CarListView: View {
    @StateObject var carStore : CarStore
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            List {
                ForEach(carStore.cars, id: \.self) { car in
                    
                    ListCell(car: car)
                        .background(NavigationLink(destination: {
                            
                            DetailView(car: car, carStore: carStore)
                            
                        }, label: {
                            EmptyView()
                        }))
                    
                }
                .onDelete(perform: deleteItem)
                
            }
            .navigationBarTitle(Text("EV Cars"))
            .onAppear {
                carStore.observeCars()
            }
            .onDisappear {
                carStore.stopListening()
            }
            .toolbar {
                Button {
                    isShowing.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet){
        // 클릭된 Car() 를 찾는다.
        // speicial id  값을 찾는다.
        // 하드코딩으로 지정
        // 지운다.
        
        let index = offsets.first!
        let carName = carStore.cars[index].name
        print("delete: \(carName)")
        carStore.findData(carName: carName)
    }
}

struct CarListView_Previews: PreviewProvider {
    @State static var isShowing: Bool = false
    static var previews: some View {
        CarListView(carStore: CarStore(), isShowing: $isShowing)
    }
}
