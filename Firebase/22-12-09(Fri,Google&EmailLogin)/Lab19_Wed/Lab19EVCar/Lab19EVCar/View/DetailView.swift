//
//  DetailView.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//

import SwiftUI

struct DetailView: View {
    
    var car: Car
    
    @State var carData: Car = Car(id: "", name: "", description: "", isHybrid: false, imageName: "")
    @ObservedObject var carStore : CarStore
    
    
    var body: some View {
        VStack {
            Text(car.name)
            Text(car.id)
            Text(car.description)
            
            TextField("imageName", text: $carData.imageName)
            TextField("description", text: $carData.description)
        }
        
        Button {
            carStore.updateData(carName: car.name, carData: carData)
            print("clicked")
        } label: {
            Text("수정하기")
        }
        Spacer()
    }

}

//@Binding var car: Car
//
//TextField("imageName", text: car.imageName)
//TextField("name", text: $carStore.cars.name)
//TextField("description", text: $carStore.cars.description)

//TextField("imageName", text: $carStore.cars.imageName)
//TextField("name", text: $carStore.cars.name)
//TextField("description", text: $carStore.cars.description)

//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}


//
//
//struct DetailView: View {
//
//    @ObservedObject var carStore : CarStore
//
//    @State var addImageName: String = ""
//    @State var addId: String = ""
//    @State var addName: String = ""
//    @State var addDescription: String = ""
//    @State var addIsHybrid: String = ""
//
//
//    var body: some View {
//
//        VStack{
//            TextField("imageName", text: car.imageName)
//            TextField("name", text: $carStore.cars.name)
//            TextField("description", text: $carStore.cars.description)
//        }
//
//    }
//}
