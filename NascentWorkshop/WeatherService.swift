

import Alamofire

internal class WeatherService {
    
    // singleton
    internal static let sharedInstance = WeatherService()
    
    private let ApiKey = "0c39f4269454ad6bfacb57342c7baf98"
    private let BaseUrl = "http://api.openweathermap.org/data/2.5/weather"
    
    internal func getWeatherForCity(city: String, completion: (weather: Weather?) -> Void) {
        
        Alamofire.request(.GET, BaseUrl, parameters: ["q": city, "appid": ApiKey, "units": "metric"])
            .responseJSON(completionHandler: {
                response in
                
                if response.result.error != nil {
                    
                    print(response.result.error?.description)
                    completion(weather: nil)
                }
                else {
                
                    let json: AnyObject = response.result.value!
                    let mainData = json.objectForKey("main")!
                    let weatherData = json.objectForKey("weather") as! [AnyObject]
                    
                    let weather = Weather(
                        city: json.objectForKey("name") as! String,
                        description: weatherData[0].objectForKey("description") as! String,
                        temp: mainData.objectForKey("temp") as! Int,
                        maxTemp: mainData.objectForKey("temp_max") as! Int,
                        minTemp: mainData.objectForKey("temp_min") as! Int
                    )
                    
                    completion(weather: weather)
                }
            })
    }
}
