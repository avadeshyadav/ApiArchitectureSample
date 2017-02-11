//
//  AYServiceProtocol.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

enum APIType : Int {
    case homeAvailability
    case googlePlaces
    case none
}

enum HTTPMethodType {
    case get
    case post
    case put
    case delete
}

typealias ApiCompletionBlock = (AnyObject?) -> Void


protocol AYServiceProtocol: class {
    
    func getRequestHeaders() -> Dictionary<String, String> 
    func urlTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?, methodType: HTTPMethodType) -> URLSessionDataTask
}
