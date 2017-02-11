//
//  RySdkConstants.h
//  RydeSdk
//
//  Created by Ashwani Hundwani on 07/12/2014.
//  Copyright (c) 2014 Ashwani Hundwani. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum TagEnviroment{
    
    eENV_INVALID_ENVIROMENT = -1,
    eENV_PP,
    eENV_PROD,
    eENV_DEV,
    
}EEnviroment;

/**
 This class intializes all constants based on the enviroment. 
 By default, production constants will be initialized.
 */
@interface RySdkConstants : NSObject

/**
 This function sets the enviroment.
 Possible values are production, pre-prduction and dev.
 
 @param env - Enviroment to set.
 */
+(void)setENV:(EEnviroment)env;

/**
 This function returns the value of enviroment.
 
 @return enviroment
 */
+(EEnviroment)env;

/**
 This function returns the constant value for a given key.
 
 @param key - Constant key
 @return the value for key.
 */
+(id)getConstantForKey:(NSString *)key;

@end
