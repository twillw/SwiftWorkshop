

internal class Weather {
    
    // MARK: instance properties
    
    internal let city: String
    internal let description: String?
    internal let temp: Int
    internal let maxTemp: Int
    internal let minTemp: Int
    
    
    // MARK: constructors
    
    init(city: String, description: String, temp: Int, maxTemp: Int, minTemp: Int) {
        
        self.city = city
        self.description = description
        self.temp = temp
        self.maxTemp = maxTemp
        self.minTemp = minTemp
    }
}
