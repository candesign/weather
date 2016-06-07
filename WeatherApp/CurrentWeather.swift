//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Jan Giemza on 05.06.2016.
//  Copyright © 2016 Can Design. All rights reserved.
//

import Foundation


struct CurrentWeather {
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    init(weatherDictionary: [String: AnyObject]) {
        if let temperatureFahrenheit = weatherDictionary["temperature"] as? Int {
            temperature = (temperatureFahrenheit - 32) * 5/9
        } else { temperature = nil }
        if let humidityFloat = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityFloat * 100)
        } else { humidity = nil }
        if let precipProbabilityFloat = weatherDictionary["precipProbability"] as? Double {
            precipProbability = Int(precipProbabilityFloat * 100)
        } else { precipProbability = nil }
        summary = weatherDictionary["summary"] as? String
    }
}


