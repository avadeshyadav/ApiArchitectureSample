//
//  AYLoaderView.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 12/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYLoaderView: UIView {

    @IBOutlet weak var loadingLabel: UILabel!
    
    static func getLoaderView(with text: String?, frame: CGRect, owner: AnyObject) -> AYLoaderView? {
        
        let loaderView = Bundle.main.loadNibNamed("AYLoaderView", owner: owner, options: nil)?.last as? AYLoaderView
        loaderView?.loadingLabel.text = text
        
        return loaderView
        
    }

}
