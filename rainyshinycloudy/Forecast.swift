//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Penpitcha Natisupalak on 1/26/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let minTemp = temp["min"] as? Double {
                let KelvinToCelsiusPreDivision = (minTemp - 273.15)
                let KelvinToCelsius = Double(round(10 * KelvinToCelsiusPreDivision/10))
                self._lowTemp = "\(KelvinToCelsius)°"
            }
            if let maxTemp = temp["min"] as? Double {
                let KelvinToCelsiusPreDivision = (maxTemp - 273.15)
                let KelvinToCelsius = Double(round(10 * KelvinToCelsiusPreDivision/10))
                self._highTemp = "\(KelvinToCelsius)°"
            }
        }
        if let main = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let weatherType = main[0]["main"] as? String {
                self._weatherType = weatherType.capitalized
            }
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
