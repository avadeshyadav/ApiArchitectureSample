//
//  RySdkError.h
//  RydeSdk
//
//  Created by Ashwani Hundwani on 08/12/2014.
//  Copyright (c) 2014 Ashwani Hundwani. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RySdkErrorInfo;

/**
 This class is responsible for all error handling, majorly errors from network calls, preferences/disk related.
 */
@interface RySdkError : NSObject

@property(nonatomic, strong, readonly)NSString *errorId;
@property(nonatomic, strong, readonly)RySdkErrorInfo *errorInfo;

#pragma mark
#pragma mark Initializer Methods

/**
 This intialization method is used to instantiate an error object with given id.
 
 @param errorId Error identifier.
 @return An instantiated error object.
 */
-(id)initWithErrorId:(NSString *)errorId;

@end
