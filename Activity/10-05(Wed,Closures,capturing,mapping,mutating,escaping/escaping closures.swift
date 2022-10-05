var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosures(completionHandler: @escaping () -> Void ){
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoneEscapingClosures(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 0 
    func doSomething(){
        someFunctionWithEscapingClosures(completionHandler:{() -> Void in
            print("hello")
            self.x = 100
        })
        someFunctionWithNoneEscapingClosures{() -> Void in 
            print("world")
            x = 200
        }
    }
}
let instance = SomeClass()
instance.doSomething()
print("None x:\(instance.x)")

if let completionHandler = completionHandlers.first{
    completionHandler()
    print("x:\(instance.x)")
}