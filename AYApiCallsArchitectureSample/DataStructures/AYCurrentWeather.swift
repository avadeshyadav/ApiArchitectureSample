//
//  AYCurrentWeather.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 14/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit


class AYCurrentWeather: NSObject {
    var weather: AYWeather?
    var location: AYLocation?
}

class AYWeather: NSObject {
    
    var temperature: String?
    var condition: AYConditionItem?
    var lastUpdated: String?
    var windSpeed: String?
}

class AYConditionItem: NSObject {
    var code: Int?
    var icon: String?
    var text: String?
}

class AYLocation: NSObject {
    var name: String?
    var country: String?
    var latitude: String?
    var longitude: String?
    var localTime: String?
}
