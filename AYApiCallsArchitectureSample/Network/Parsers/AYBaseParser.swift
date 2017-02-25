//
//  AYBaseParser.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYBaseParser: NSObject {
   
    var apiType: APIType = .none
    
    func parseJSON(_ json: Any?) -> Any?  {
        return json;
    }
    
    static func parseJSON(_ json: Any?, forAPIType apiType: APIType) -> Any? {
        
        let parser = AYParserFactory.getParserForAPIType(apiType)
        parser.apiType = apiType
        return parser.parseJSON(json)
    }

    func getLocationObject(from details: Dictionary<String, Any>) -> AYLocation {
    
        let locationObject = AYLocation()
        
        locationObject.name = details["name"] as? String
        locationObject.country = details["country"] as? String
        locationObject.latitude = details["lat"] as? String
        locationObject.longitude = details["lon"] as? String
        locationObject.localTime = details["localtime"] as? String

        return locationObject
    }
    
    func getConditionObject(from details: Dictionary<String, Any>?) -> AYConditionItem? {
    
        guard let rawDetails = details else {
            return nil
        }
        
        let conditionObject = AYConditionItem()
        
        conditionObject.code = rawDetails["code"] as? Int
        conditionObject.icon = rawDetails["icon"] as? String
        conditionObject.text = rawDetails["text"] as? String
        
        return conditionObject
    }
    
    func getWeatherObject(from details: Dictionary<String, Any>?) -> AYWeather? {
        
        guard let rawDetails = details else {
            return nil
        }
        let weather = AYWeather()
        
        weather.condition = getConditionObject(from: rawDetails["condition"] as? Dictionary<String, Any>)
        weather.temperature = rawDetails["temp_c"] as? String
        weather.lastUpdated = rawDetails["last_updated"] as? String
        weather.windSpeed = rawDetails["wind_kph"] as? String
        
        return weather
    }
}

