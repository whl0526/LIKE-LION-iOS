//
//  AddView.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var carStore : CarStore
    
    
    @State var addImageName: String = ""
    @State var addId: String = ""
    @State var addName: String = ""
    @State var addDescription: String = ""
    @State var addIsHybrid: String = ""
    
    @Binding var isPresent: Bool
    
    @State var carData: Car = Car(id: "", name: "", description: "", isHybrid: false, imageName: "")
    
    var body: some View {
        VStack{
            Spacer()
            Section {
                TextField("imageName", text: $carData.imageName)
                //TextField("id", text: $carData.id)
                TextField("name", text: $carData.name)
                TextField("description", text: $carData.description)
                //TextField("isHybrid", text: carData.isHybrid)
                
            }
     
            Button {
                carStore.addData(carData: carData)
                isPresent.toggle()
                carStore.observeCars()
            } label: {
                Text("추가하기")
            }
            Spacer()

        }
        .padding()
    }
    
    
    
}
//
//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView(carStore:  CarStore())
//    }
//}

//Car
//var id: String
//var name: String
//
//var description: String
//var isHybrid: Bool
//
//var imageName: String
