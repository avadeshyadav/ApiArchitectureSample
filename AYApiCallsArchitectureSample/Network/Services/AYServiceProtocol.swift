//
//  AYServiceProtocol.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

enum APIType : Int {
    case currentWeather
    case forecastWeather
    case none
}

typealias ApiCompletionBlock = (AnyObject?) -> Void


protocol AYServiceProtocol: class {
    
    func getRequestHeaders() -> Dictionary<String, String>
    
    func getTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?)-> URLSessionDataTask
    func postTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask
    func putTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask
    func deleteTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask
    
}
