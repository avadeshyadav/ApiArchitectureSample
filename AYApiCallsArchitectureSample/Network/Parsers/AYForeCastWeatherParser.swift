//
//  AYForeCastWeatherParser.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 14/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYForeCastWeatherParser: AYBaseParser {

    override func parseJSON(_ json: Any?) -> Any?  {
        
        guard let details = json as? Dictionary<String, Any> else {
            return nil
        }
        
        let forecastWeather = AYForecastWeather()
        
        if let locationDetails = details["location"] as? Dictionary<String, Any> {
            forecastWeather.location = getLocationObject(from: locationDetails)
        }
        
        forecastWeather.weather = getWeatherObject(from: details["current"] as? Dictionary<String, Any>)

        if let forecastDetail = details["forecast"] as? Dictionary<String, Any>, let daysDetail = forecastDetail[""] as? Array<Dictionary<String, Any>> {
        
            var dayObjects = Array<AYWeatherDay>()
            
            for dayDetail in daysDetail {
            
                if let dayObject = getForecastWeatherDay(from: dayDetail) {
                    dayObjects.append(dayObject)
                }
            }
            
            forecastWeather.forecastDays = dayObjects
        }
        
        return forecastWeather;
    }
    
    func getAstroObjectFrom(_ rawDetails: Dictionary<String, String>?) -> AYAstro? {
    
        guard let details = rawDetails else {
            return nil
        }

        let astro = AYAstro()
        
        astro.moonrise = details["moonrise"]
        astro.moonset = details["moonset"]
        astro.sunrise = details["sunrise"]
        astro.sunset = details["sunset"]

        return astro
    }
    
    func getForecastWeatherDay(from details: Dictionary<String, Any>?) -> AYWeatherDay? {
    
        guard let rawDetails = details else {
            return nil
        }
        
        let day = AYWeatherDay()
        
        day.astro = getAstroObjectFrom(rawDetails["astro"] as?  Dictionary<String, String>)
        day.dateString = rawDetails["date"] as? String
        
        if let dayDetails = rawDetails["day"] as? Dictionary<String, Any> {
            
            day.condition = getConditionObject(from: dayDetails["condition"] as? Dictionary<String, Any>)
            day.windMaxSpeed = dayDetails["maxwind_kph"] as? String
            day.maxTemp = dayDetails["maxtemp_c"] as? String
            day.minTemp = dayDetails["mintemp_c"] as? String
        }
        
        return day
    }
}
