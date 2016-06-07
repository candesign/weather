//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jan Giemza on 05.06.2016.
//  Copyright © 2016 Can Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    @IBOutlet weak var rainLabel: UILabel?
    @IBOutlet weak var summaryLabel: UILabel?
    
    private let forecastAPIKey = "17d955b1770741c9a8fecd78d9966d35"
    let coordinate: (lat: Double, long: Double) = (52.206196, 21.042662)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Get location of CurrentWather.plist
//        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
//        let weatherDictionary = NSDictionary(contentsOfFile: plistPath),
//        let currentWeatherDictionary = weatherDictionary["currently"] as? [String: AnyObject] {
//            let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
//            currentTemperatureLabel?.text = "\(currentWeather.temperature)°C"
//            humidityLabel?.text = "\(currentWeather.humidity)%"
//            rainLabel?.text = "\(currentWeather.precipProbability)%"
//        }
        
        // Construct Forecast.io URL
//        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
//        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)
//        
//        // Fetch data via NSURLSession to fetch data
//        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//        let session = NSURLSession(configuration: configuration)
//        
//        let request = NSURLRequest(URL: forecastURL!)
//        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in })
//        
//        dataTask.resume()
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) {
            (let currently) in
            if let currentWeather = currently {
             
                // Update UI
                dispatch_async(dispatch_get_main_queue()) {
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)°C"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.humidityLabel?.text = "\(humidity)%"
                    }
                    
                    if let rain = currentWeather.precipProbability {
                        self.rainLabel?.text = "\(rain)%"
                    }
                    
                    if let summary = currentWeather.summary {
                        self.summaryLabel?.text = "\(summary)"
                    }
                    
                }
                
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}