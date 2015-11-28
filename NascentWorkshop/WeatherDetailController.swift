
import UIKit

internal class WeatherDetailController: UIViewController {

    // MARK: instance properties
    
    internal var weather: Weather!
    
    // MARK: outlets
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    override func viewDidLoad() {
        
        cityLabel.text = weather.city
        descriptionLabel.text = weather.description
        tempLabel.text = String(weather.temp)
        maxTempLabel.text = String(weather.maxTemp)
        lowTempLabel.text = String(weather.minTemp)
    }
    
}
