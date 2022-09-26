enum City: String {
    case sanFrancisco, paris, seoul, newYork, london
        
    func getHello() -> String {
        switch self {
        case .sanFrancisco:
            return "Hello from \(self.rawValue), whatsup"
        case .london:
            return "Hello from \(self.rawValue), Hello"
        case .newYork:
            return "Hello from \(self.rawValue), Hi"
        case .seoul:
            return "Hello from \(self.rawValue), 안녕"
        case .paris:
            return "Hello from \(self.rawValue), Bonjour"
        }
    }
}

var seoul = City.seoul
print(seoul.getHello())