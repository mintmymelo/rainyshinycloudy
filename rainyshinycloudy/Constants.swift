//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Penpitcha Natisupalak on 1/26/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "ed12d5d79a95062e3ae305eb70d26b17"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)13\(LONGITUDE)100\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=13&lon=100&cnt=10&mode=json&appid=ed12d5d79a95062e3ae305eb70d26b17"
