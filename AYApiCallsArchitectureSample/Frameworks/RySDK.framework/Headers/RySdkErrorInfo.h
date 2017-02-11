//
//  ErrorInfo.h
//  RydeSdk
//
//  Created by Ashwani Hundwani on 08/12/2014.
//  Copyright (c) 2014 Ashwani Hundwani. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents the detailed information of an error (e.g human readable error string.)
 */

@interface RySdkErrorInfo : NSObject

/**
 Error identifier.
 */
@property(nonatomic, strong, readonly)NSString *errorId;

/**
 Human readable error string
 */
@property(nonatomic, strong, readonly)NSString *errorString;

#pragma mark 
#pragma mark Initializer Methods

/**
 This intialization method is used to instantiate an error info object with given id and error string.
 
 @param errorId Error identifier.
 @param errorString  Human readable error string
 @return An instantiated error info object.
 */
-(id)initWithErrorId:(NSString *)errorId
         errorString:(NSString *)errorString;

@end
