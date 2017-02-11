//
//  AYParserFactory.swift
//  AYApiCallsArchitectureSample
//
//  Created by Avadesh Kumar on 11/02/17.
//  Copyright © 2017 Avadesh Kumar. All rights reserved.
//

import UIKit

class AYParserFactory: NSObject {

    static func getParserForAPIType(_ apiType: APIType) -> AYBaseParser {
        
        var parser = AYBaseParser()
        
        switch apiType {
            
        case .homeAvailability:
            parser = AYBaseParser()
            
        case .googlePlaces:
            parser = AYBaseParser()
            

            
        case .none:
            break
        }
        
        return parser
    }
}
