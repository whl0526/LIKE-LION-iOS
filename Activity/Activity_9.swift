import Foundation
for count in 0...1{
    for index in 0...4{
        for _ in 0...index {
            print("*", terminator: "")
            
        }
        
        print()
    }
    for index in 0...4{
        for _ in 0...4-index {
            print("*", terminator: "")
            
        }
        print()
    }
    
}