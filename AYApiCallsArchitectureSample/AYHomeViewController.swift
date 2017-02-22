//
//  AYHomeViewController.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYHomeViewController: AYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let service = AYWeatherService()
        service.getCurrentWeatherFor(controller: self, city: "New Delhi", onError: { (error) in
            
        }) {[weak self] (result) in
            self?.doSomeThing()
        }
    }
    
    func doSomeThing() {
    
    }

}

