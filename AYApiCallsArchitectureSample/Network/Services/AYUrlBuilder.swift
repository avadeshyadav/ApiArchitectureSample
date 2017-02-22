//
//  AYUrlBuilder.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 12/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYUrlBuilder: NSObject {

    static let baseServerUrl = "https://api.apixu.com/"
    static let apiVersionV1 = "v1/"
    
    static func getCurrentWeatherURL() -> String {
        return baseServerUrl + apiVersionV1 + "current.json"
    }
    
    static func getForecastWeatherURL() -> String {
        return baseServerUrl + apiVersionV1 + "forecast.json"
    }
    
}
