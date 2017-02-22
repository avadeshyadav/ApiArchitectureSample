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
    var activityIndicator: AYLoaderView?
    
    var apiTimeOutIntervalInSeconds: Float = 60.0

    
    func getRequestHeaders() -> Dictionary<String, String> {
        
        var headers = Dictionary<String, String>()
        headers["Content-Type"] = "application/json"
        return headers
    }
    
    func getTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?)-> URLSessionDataTask {
        
        showActivityIndicatorIfRequired()
        
        return RySdkNetwork.get(urlString, params:parameters, headers: getRequestHeaders(), requestSerializer:eSERIALIZER_JSON, timeout: apiTimeOutIntervalInSeconds, successBlock: { (rawData) in
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5), execute: { 
                self.didReceiveResponseWithObject(rawData, urlString: urlString, params: parameters)
            })
            
        }) { (error) in
            self.didReceiveError(error as? NSError, urlString: urlString, parameters: parameters)
        }
    }
    
    func postTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask {
        
        showActivityIndicatorIfRequired()
        
        return RySdkNetwork.post(urlString, params: parameters, headers: getRequestHeaders(), requestSerializer:eSERIALIZER_JSON,  timeout: apiTimeOutIntervalInSeconds, successBlock: { (rawData) in
            
            self.didReceiveResponseWithObject(rawData, urlString: urlString, params: parameters)
            
        }) { (error) in
            self.didReceiveError(error as? NSError, urlString: urlString, parameters: parameters)
        }
    }
    
    func putTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask {
        
        showActivityIndicatorIfRequired()
        
        return RySdkNetwork.put(urlString, params: parameters, headers: getRequestHeaders(), requestSerializer:eSERIALIZER_JSON, timeout: apiTimeOutIntervalInSeconds, successBlock: { (rawData) in
            
            self.didReceiveResponseWithObject(rawData, urlString: urlString, params: parameters)
            
        }) { (error) in
            self.didReceiveError(error as? NSError, urlString: urlString, parameters: parameters)
        }
    }
    
    func deleteTaskWithURL(_ urlString: String, parameters: Dictionary<String, Any>?) -> URLSessionDataTask {
        
        showActivityIndicatorIfRequired()
        
        return RySdkNetwork.deleteCall(urlString, params: parameters, headers: getRequestHeaders(),requestSerializer:eSERIALIZER_JSON, timeout: apiTimeOutIntervalInSeconds, successBlock: { (rawData) in
            
            self.didReceiveResponseWithObject(rawData, urlString: urlString, params: parameters)
            
        }) { (error) in
            self.didReceiveError(error as? NSError, urlString: urlString, parameters: parameters)
        }
    }
    
    func assignSuccessBlock(_ onSuccess: ApiCompletionBlock?, onError: ApiCompletionBlock?, activityContainerView view: UIView?) {
        
        successCompletionBlock = onSuccess
        failureCompletionBlock  = onError
        loadingContainerView = view
    }
    
    fileprivate func hideActivityIndicatorIfShowing() {
        
        if let _ = self.activityIndicator {
            self.activityIndicator?.removeFromSuperview()
            self.activityIndicator = nil
        }
    }
    
    fileprivate func showActivityIndicatorIfRequired() {
        
        if (showLoader == true && loadingContainerView != nil) {
            
            self.activityIndicator = AYLoaderView.getLoaderView(with: "Loading...", frame: loadingContainerView!.bounds, owner: loadingContainerView!)
            
            loadingContainerView?.addSubview(self.activityIndicator!)
        }
    }
    
    fileprivate func didReceiveResponseWithObject(_ response: Any?,  urlString: String?, params: Dictionary<String, Any>?) {
        
        hideActivityIndicatorIfShowing()
        
        if shouldLogResponse  {
            
            print("\n\n Response received for URL: " +  (urlString != nil ? urlString! : "nil"))
            print("With Params: " +  (params != nil ? "\(params!)" : "nil"))
            print("With Response: " +  (response != nil ? "\(response)" : "nil") + "\n\n")
        }
        
        let result = AYBaseParser.parseJSON(response as Any?, forAPIType: self.apiType)
        
        if let _ = result {
            self.successCompletionBlock?(result as AnyObject?)
        }
        else {
            self.handleInvalidResponseWithDetails(response)
        }
    }
    
    fileprivate func didReceiveError(_ error: NSError?, urlString: String?, parameters: Dictionary<String, Any>?) {
        
        hideActivityIndicatorIfShowing()
        
        print("\n\nFailed URL: " +  (urlString != nil ? urlString! : "nil"))
        print("With Params: " +  (parameters != nil ? "\(parameters!)" : "nil"))
        print("With Error: " +  (error != nil ? "\(error!.userInfo)" : "nil") + "\n\n")
        
        guard let _ = error else {
            self.handleInvalidResponseWithDetails(nil)
            return
        }
        
        if error?.code == NSURLErrorCancelled {
            print("Call Cancelled")
            return
        }
        
        self.handleInvalidResponseWithDetails(error)
        
        //guard let responseData = error?.userInfo[kAFNetworkingErrorResponseDataKey] as? Data else {
            
//            let internetReachability = Reachability.forInternetConnection()
//            if internetReachability?.isReachable() == false {
//                let failureReason = "You appear to be offline. Please check your internet connection."
//                self.handleInvalidResponseWithDetails(failureReason)
//            }
//            else {
//                self.handleInvalidResponseWithDetails(error)
//            }
         //   return
        //}
        
        //if let responseObject = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? Dictionary<String, Any> {
            
         //       print("With Response Object: " +  "\(responseObject)")
            
         /*   var errorCode: String = ""
            
            if let code = responseObject?[kErrorCodeKeyName] {
                errorCode = "\(code)"
            }
            
            let errorMessage = responseObject?[kErrorKeyName] as? String
            
            let customError = GCCustomError.customErrorWithMessage(errorMessage ?? "Unable to connect to server. Please try again." , errorCode: errorCode, error: error)
 */
          //  self.failureCompletionBlock?(customError)
//        }
//        else {
//            self.handleInvalidResponseWithDetails(responseData)
//        }
    }
    
    fileprivate func handleInvalidResponseWithDetails(_ details: Any?) {
        
        var error: NSError?
        
        if let passedError = details as? NSError {
            error =  NSError(domain: passedError.domain, code: passedError.code, userInfo: [NSLocalizedFailureReasonErrorKey: passedError.localizedDescription])
        }
        else {
            let failureReason: String = details != nil ? "\(details!)" : "No response received from server"
            error =  NSError(domain: "API Error", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: failureReason])
        }
        
        failureCompletionBlock?(error)
    }
    

}
