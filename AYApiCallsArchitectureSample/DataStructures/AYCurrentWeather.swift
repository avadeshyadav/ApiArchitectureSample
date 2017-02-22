//
//  AYCurrentWeather.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 14/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYWeather: NSObject {
  
    var temperature: String?
    var condition: AYConditionItem?
    var lastUpdated: String?
}

class AYConditionItem: NSObject {
    var code: Int?
    var icon: String?
    var text: String?
}


class AYCurrentWeather: NSObject {
    var condition: AYWeather?
    var location: AYLocation?
}
