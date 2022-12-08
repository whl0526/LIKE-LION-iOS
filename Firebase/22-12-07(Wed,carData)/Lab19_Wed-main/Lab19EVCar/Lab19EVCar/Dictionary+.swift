//
//  Dictionary+.swift
//  Lab19EVCar
//
//  Created by greenthings on 2022/12/07.
//

import Foundation

extension Dictionary {

    func containsKey(_ key: Key) -> Bool {
        index(forKey: key) != nil
    }

}


extension Dictionary where Value: Equatable {
    /// Returns all keys mapped to the specified value.
    /// “`
    /// let dict = ["A": 1, "B": 2, "C": 3]
    /// let keys = dict.keysForValue(2)
    /// assert(keys == ["B"])
    /// assert(dict["B"] == 2)
    /// “`
    func keysForValue(value: Value) -> [Key] {
        return compactMap { (key: Key, val: Value) -> Key? in
            value == val ? key : nil
        }
    }
    
//    func valueForKey(nameKey: Key) -> Value {
//        return compactMap { (key: Key, val: Value) -> Value? in
//            nameKey == key ? val : nil
//        }
//    }
}
