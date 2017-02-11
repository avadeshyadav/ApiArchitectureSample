//
//  AYBaseParser.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYBaseParser: NSObject {
   
    var apiType: APIType = .none
    
    func parseJSON(_ json: Any?) -> Any?  {
        return json;
    }
    
    static func parseJSON(_ json: Any?, forAPIType apiType: APIType) -> Any? {
        
        let parser = AYParserFactory.getParserForAPIType(apiType)
        parser.apiType = apiType
        return parser.parseJSON(json)
    }

}

       
