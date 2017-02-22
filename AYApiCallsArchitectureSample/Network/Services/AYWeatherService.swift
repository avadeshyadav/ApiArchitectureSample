//
//  AYWeatherService.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 12/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYWeatherService: AYBaseService {
   
    let apiKey: String = "902614939b0649c7bd844800171202"
    
    @discardableResult func getCurrentWeatherFor(controller : AYBaseViewController?, city: String, onError: ApiCompletionBlock?, onSuccess: ApiCompletionBlock?) -> URLSessionDataTask {
        
        self.apiType = .currentWeather
        self.showLoader = true
        self.assignSuccessBlock(onSuccess, onError: onError, activityContainerView: controller?.view)
    
        let parameters: Dictionary <String, String> = ["key": apiKey, "q": city]
        let task = self.getTaskWithURL(AYUrlBuilder.getCurrentWeatherURL(), parameters: parameters)
        controller?.addOnGoingNetworkCall(task)
        
        return task;
    }
    
    @discardableResult func getForecastWeatherFor(controller : AYBaseViewController?, city: String, onError: ApiCompletionBlock?, onSuccess: ApiCompletionBlock?) -> URLSessionDataTask {
        
        self.apiType = .forecastWeather
        self.showLoader = true
        self.assignSuccessBlock(onSuccess, onError: onError, activityContainerView: controller?.view)
       
        
        let parameters: Dictionary <String, Any> = ["key": apiKey, "q": city, "days": 5, "dt": "2017-02-20"]
        let task = self.getTaskWithURL(AYUrlBuilder.getForecastWeatherURL(), parameters: parameters)
        controller?.addOnGoingNetworkCall(task)
        
        return task;
    }


}
