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
    
    func getConditionObject(from details: Dictionary<String, Any>) -> AYConditionItem {
    
        let conditionObject = AYConditionItem()
        
        conditionObject.code = details["code"] as? Int
        conditionObject.icon = details["icon"] as? String
        conditionObject.text = details["text"] as? String
        
        return conditionObject
    }
}
/*
cloud = 0;
condition =         {
    code = 1009;
    icon = "//cdn.apixu.com/weather/64x64/night/122.png";
    text = Overcast;
};
"feelslike_c" = 16;
"feelslike_f" = "60.8";
humidity = 68;
"is_day" = 0;
"last_updated" = "2017-02-14 23:25";
"last_updated_epoch" = 1487114755;
"precip_in" = 0;
"precip_mm" = 0;
"pressure_in" = "30.6";
"pressure_mb" = 1021;
"temp_c" = 16;
"temp_f" = "60.8";
"wind_degree" = 0;
"wind_dir" = N;
"wind_kph" = 0;
"wind_mph" =

  */     
