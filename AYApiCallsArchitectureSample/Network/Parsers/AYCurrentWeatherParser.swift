//
//  AYCurrentWeatherParser.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 14/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYCurrentWeatherParser: AYBaseParser {

    override func parseJSON(_ json: Any?) -> Any?  {
        
        guard let details = json as? Dictionary<String, Any> else {
            return nil
        }
        
        let currentWeather = AYCurrentWeather()
        
        if let locationDetails = details["location"] as? Dictionary<String, Any> {
            currentWeather.location = getLocationObject(from: locationDetails)
        }
        
        currentWeather.weather = getWeatherObject(from: details["current"] as? Dictionary<String, Any>)
        
        return currentWeather;
    }
}


