//
//  AYBaseViewController.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYBaseViewController: UIViewController {

    let onGoingNetworkCalls =  NSHashTable<URLSessionDataTask>()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        cancelAllOnGoingApiCalls()
    }
    
    func addOnGoingNetworkCall(_ call: URLSessionDataTask?) {
        onGoingNetworkCalls.add(call)
    }
    
    func cancelAllOnGoingApiCalls() {
        
        for urlTask in onGoingNetworkCalls.objectEnumerator() {
            
            if let task = urlTask as? URLSessionDataTask {
                task.cancel()
            }
        }
    }
}
