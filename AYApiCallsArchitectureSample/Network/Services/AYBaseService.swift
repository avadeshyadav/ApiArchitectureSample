//
//  AYBaseService.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYBaseService: NSObject, AYServiceProtocol {

    var apiType: APIType = .none
    
    var showLoader: Bool = true
    var shouldLogResponse: Bool = true
    
    var successCompletionBlock: ApiCompletionBlock?
    var failureCompletionBlock: ApiCompletionBlock?
    weak var loadingContainerView: UIView?
    
    var apiTimeOutIntervalInSeconds: Float = 60.0
    
    func urlTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?, methodType: HTTPMethodType) -> URLSessionDataTask {
        
        
        
        
        return URLSessionDataTask()
    }
    
    func getRequestHeaders() -> Dictionary<String, String> {
        return  Dictionary<String, String>()
    }
}
