
import UIKit


class ViewController: UIViewController {

    // MARK: properties
    
    private let randomWords = ["Pizza", "Cats", "Dog", "Tom"]
    private var counter = 0
    
    // MARK: outlets
    
    @IBOutlet weak var randomTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: actions
    @IBAction func testWeatherAPI(sender: AnyObject) {
        
        WeatherService.sharedInstance.getWeatherForCity("toronto", completion: {
            [weak self = self]
            weather in
            
            print(weather)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let weatherDetailController = storyboard.instantiateViewControllerWithIdentifier("weatherDetailController")
                as! WeatherDetailController
            weatherDetailController.weather = weather
            
            self?.navigationController?.pushViewController(weatherDetailController, animated: true)
        })
    }

    @IBAction func changeText(sender: AnyObject) {
        
        if counter == randomWords.count {
            counter = 0
        }
        
        randomTextLabel.text = randomWords[counter]
        
        counter++
    }
}
