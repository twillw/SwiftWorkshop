
import UIKit

internal class CityListController: UITableViewController {

    // MARK: instance properties
    
    let cities: [String] = ["Toronto", "Ottawa", "Yellowknife", "Montreal", "Vancouver", "Windsor"]
    
    
    // MARK: tableview delegate methods
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return number of cities in our datasource
        return cities.count
    }
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cityCell") as! CityCell
        
        cell.cityLabel.text = cities[indexPath.row]
        
        return cell
    }
    
    internal override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let city = cities[indexPath.row]
        
        WeatherService.sharedInstance.getWeatherForCity(city, completion: {
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
}
