//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Penpitcha Natisupalak on 1/26/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName:String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp:Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = "city NIL !!!!!"
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = "date NIL !!!!!"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = "weather NIL !!!!!"
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                    
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        let KelvinToCelsiusPreDivision = (currentTemperature - 273.15)
                        let KelvinToCelsius = Double(round(10 * KelvinToCelsiusPreDivision/10))
                        self._currentTemp = KelvinToCelsius
                        print(self._currentTemp)
                    }
                }
            }
            completed()
        }
    }
}
