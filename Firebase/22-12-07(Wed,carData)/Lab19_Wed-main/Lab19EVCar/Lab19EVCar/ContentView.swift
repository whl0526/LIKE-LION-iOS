//
//  ContentView.swift
//  Lab19EVCar
//
//  Created by 이원형 on 2022/12/07.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var carStore : CarStore = CarStore()
    
    @State private var isShowing: Bool = false
    
    @State private var isPresent: Bool = true
    
    
    var body: some View {
        NavigationStack {
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
            
            //            List(carStore.cars){ cars in
            //
            //                ForEach(carStore.cars, id: \.self) { car in
            //
            //                    NavigationLink(car.name) {
            //                        DetailView(carStore: carStore)
            //                    }
            //                }
            //                .onDelete(perform: deleteItem)
            //            }
            
            //            List {
            //                ForEach(carStore.cars, id: \.self) { car in
            //
            //                    ListCell(car: car)
            //                        .background(NavigationLink(destination: {
            //
            //
            //
            //                        }, label: {
            //                            EmptyView()
            //                        }))
            //
            //                }
            //                .onDelete(perform: deleteItem)
            //
            //            }
            .navigationBarTitle(Text("EV Cars"))
            
            .onAppear {
                //carStore.listentoRealtimeDatabase()
                carStore.observeCars()
            }
            //            .onDisappear {
            //                carStore.stopListening()
            //            }
            .toolbar {
                Button {
                    isShowing.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            
        }
        .fullScreenCover(isPresented: $isPresent) {
            AuthView( viewModel: AuthViewModel(), isPresent: $isPresent)
        }

        .sheet(isPresented: $isShowing) {
            AddView(carStore: carStore, isPresent: $isShowing)
        }

    
     
        
        Button {
            print(carStore.cars.count)
            print(carStore.cars)
            isPresent.toggle()
        } label: {
            Text("회원 정보")
        }
        
        
        
    }
    
    
    func deleteItem(at offsets: IndexSet){
        // 클릭된 Car() 를 찾는다.
        // speicial id  값을 찾는다.
        // 하드코딩으로 지정
        // 지운다.
        
        //carStore.cars.remove(atOffsets: offsets)
        //carStore.deleteData(car: car)
        
        //let car = carStore.cars[index]
        
        //print(car)
        
        //carStore.deleteData(id: id)
        
        
        let index = offsets.first!
        let carName = carStore.cars[index].name
        print("delete: \(carName)")
        carStore.findData(carName: carName)
    }
    
}





struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            //            Image(car.imageName)
            //                .resizable()
            //                .aspectRatio(contentMode: .fit)
            //                .frame(width: 100, height: 60)
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
