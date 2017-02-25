//
//  AYForecastWeather.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 25/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYForecastWeather: AYCurrentWeather {
    var forecastDays: Array<AYWeatherDay>?
}

class AYWeatherDay: NSObject {
    var astro: AYAstro?
    var dateString: String?
    var condition: AYConditionItem?
    var maxTemp: String?
    var minTemp: String?
    var windMaxSpeed: String?
}

class AYAstro: NSObject {
    
    var sunrise: String?
    var sunset: String?
    var moonrise: String?
    var moonset: String?
}
