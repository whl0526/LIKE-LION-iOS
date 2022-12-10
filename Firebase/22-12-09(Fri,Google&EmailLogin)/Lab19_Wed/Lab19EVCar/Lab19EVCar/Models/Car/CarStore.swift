//
//  CarStore.swift
//  ListNavDemo
//
//  Created by Neil Smyth on 10/15/19.
//  Copyright © 2019 eBookFrenzy. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class CarStore : ObservableObject {
    
    @Published var cars: [Car] = []
    
    @Published var specialIds: [DatabaseReference] = []
    
    @Published var specialDic: [String:DatabaseReference] = [:]
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("cars")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func observeCars(){
        
        guard let databasePath = databasePath else { return }
        
        databasePath.observe(.value) { parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            self.cars = children.compactMap({ snapshot in
                return try? snapshot.data(as: Car.self)
            })
        }
        
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
    
    func addData(carData: Car){
        
        let uuid = databasePath?.childByAutoId()
        
        specialIds.append(uuid!)
        
        uuid?.setValue(["description":carData.description,"id": carData.id,"imageName": carData.imageName,"isHybrid": carData.isHybrid,"name": carData.name])

        
        specialDic.updateValue(uuid!, forKey: carData.name)
        
 
        //Optional(Optional(https://lab19-3340a-default-rtdb.firebaseio.com/cars/-NIexslkmNspsLK5glh6))
        
    }
    
    func findData(carName: String){
        
        if specialDic.containsKey(carName){
            specialDic[carName]?.removeValue()
        }
    }
    
    func updateData(carName: String, carData: Car){
        if specialDic.containsKey(carName){
            specialDic[carName]?.updateChildValues(["description": carData.description ])
        }
    }
    
//    if specialDic.containsKey(carName){
//        print(carName)
//
//        specialDic[carName]?.updateChildValues(["description" , carData.description] as! [AnyHashable : Any]
//            , withCompletionBlock: { error, ref in
//                print(error)
//                print(ref)
//            })
//    }
    
//        if specialDic.containsKey(carName){
//            print(carName)
//            specialDic[carName]?.updateChildValues(["description":carData.description,"id": carData.id,"imageName": carData.imageName,"isHybrid": carData.isHybrid,"name": carData.name])
//        }
        //
        //    //print(specialDic.valueForKey(nameKey: carName))
        //    specialDic.compactMap { (key: Key, val: value) in
        //        key
        //    }
        //
        //    func valueForKey(nameKey: Key) -> Value {
        //        return compactMap { (key: Key, val: Value) -> Value? in
        //            nameKey == key ? val : nil
        //        }
        //    }
        //
        //    func deleteData(car: Car){
        //
        //        //databasePath?.child("specialIds.first").removeValue()
        //        specialIds.first?.removeValue()
        //        specialIds.removeAll()
        //    }
        
  
    
    
    
    
    
    //    Can't
    //    func readObject(){
    //        guard let databasePath = databasePath else {
    //            return
    //        }
    //
    //        databasePath.observe(.value){ snapshot in
    //            do{
    //                self.cars.append(try snapshot.data(as: Car.self))
    //            }catch{
    //                print("Cant")
    //            }
    //
    //        }
    //    }
    
    
    //        databasePath
    //            .observe(.childAdded) { [weak self] snapshot in
    //                guard
    //                    let self = self,
    //                    var json = snapshot.value as? [String: Any]
    //                else {
    //                    return
    //                }
    //                json["id"] = snapshot.key
    //                do {
    //                    let carData = try JSONSerialization.data(withJSONObject: json)
    //                    let car = try self.decoder.decode(Car.self, from: carData)
    //                    self.cars.append(car)
    //                } catch {
    //                    print("an error occurred", error)
    //                }
    //            }
    
    //func listentoRealtimeDatabase() {
    //        guard let databasePath = databasePath else {
    //            return
    //        }
    //        databasePath
    //            .observe(.childAdded) { [weak self] snapshot in
    //                guard
    //                    let self = self,
    //                    var json = snapshot.value as? [String: Any]
    //                else {
    //                    return
    //                }
    //
    //                json["id"] = snapshot.key
    //
    //                do {
    //                    let carData = try JSONSerialization.data(withJSONObject: json)
    //                    let car = try self.decoder.decode(Car.self, from: carData)
    //                    self.cars.append(car)
    //                } catch {
    //                    print("an error occurred", error)
    //                }
    //            }
    //    }
}
