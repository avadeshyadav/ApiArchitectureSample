//
//  RySdkNetwork.h
//  RydeSdk
//
//  Created by Ashwani Hundwani on 07/12/2014.
//  Copyright (c) 2014 Ashwani Hundwani. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class has all the functionality related to making network calls, parsing success & error.
 */
typedef enum TagRequestSerializer{
    eSERIALIZER_JSON,
    eSERIALIZER_HTTP,
    eSERIALIZER_PROPERTYLIST
    
}ERequestSerailizer;

@interface RySdkNetwork : NSObject

#pragma mark
#pragma mark Public Static Methods

/**
 This methods performs Http Get on the passed url, also returns the success/error result in the designated blocks.
 
 @param url url for the network call.
 @param params get parameters
 @param headers optional header for http request.
 @param requestSerailizer type of serailizer
 @param successBlock if response received successfully then this block gets executed.
 @param errorBlock if error is received in response then this block gets executed.
 
 */
+(NSURLSessionDataTask *)get:(NSString *)url
                      params:(NSDictionary *)params
                     headers:(NSDictionary *)headers
           requestSerializer:(ERequestSerailizer)requestSerailizer
                     timeout:(float)timeout
                successBlock:(void (^)(id data))successBlock
                  errorBlock:(void (^)(NSError *error))errorBlock;

/**
 This methods performs Http Post on the passed url, also returns the success/error result in the designated blocks.
 
 @param url url for the network call.
 @param params post parameters
 @param headers optional header for http request.
 @param requestSerailizer type of serailizer
 @param successBlock if response received successfully then this block gets executed.
 @param errorBlock if error is received in response then this block gets executed.
 
 */
+(NSURLSessionDataTask *)post:(NSString *)url
                       params:(NSDictionary *)params
                      headers:(NSDictionary *)headers
            requestSerializer:(ERequestSerailizer)requestSerailizer
                      timeout:(float)timeout
                 successBlock:(void (^)(id data))successBlock
                   errorBlock:(void (^)(NSError *error))errorBlock;

/**
 This methods performs Http Put on the passed url, also returns the success/error result in the designated blocks.
 
 @param url url for the network call.
 @param params put parameters
 @param headers optional header for http request.
 @param requestSerailizer type of serailizer
 @param successBlock if response received successfully then this block gets executed.
 @param errorBlock if error is received in response then this block gets executed.
 
 */
+(NSURLSessionDataTask *)put:(NSString *)url
                      params:(NSDictionary *)params
                     headers:(NSDictionary *)headers
           requestSerializer:(ERequestSerailizer)requestSerailizer
                     timeout:(float)timeout
                successBlock:(void (^)(id data))successBlock
                  errorBlock:(void (^)(NSError *error))errorBlock;


/**
 This methods performs Http Delete on the passed url, also returns the success/error result in the designated blocks.
 
 @param url url for the network call.
 @param params delete parameters
 @param headers optional header for http request.
 @param requestSerailizer type of serailizer
 @param successBlock if response received successfully then this block gets executed.
 @param errorBlock if error is received in response then this block gets executed.
 */
+(NSURLSessionDataTask *)deleteCall:(NSString *)url
                             params:(NSDictionary *)params
                            headers:(NSDictionary *)headers
                  requestSerializer:(ERequestSerailizer)requestSerailizer
                            timeout:(float)timeout
                       successBlock:(void (^)(id data))successBlock
                         errorBlock:(void (^)(NSError *error))errorBlock;


/**
 This methods performs Http Patch on the passed url, also returns the success/error result in the designated blocks.
 
 @param url url for the network call.
 @param params patch parameters
 @param headers optional header for http request.
 @param requestSerailizer type of serailizer
 @param successBlock if response received successfully then this block gets executed.
 @param errorBlock if error is received in response then this block gets executed.
 */
+(NSURLSessionDataTask *)patch:(NSString *)url
                        params:(NSDictionary *)params
                       headers:(NSDictionary *)headers
             requestSerializer:(ERequestSerailizer)requestSerailizer
                       timeout:(float)timeout
                  successBlock:(void (^)(id data))successBlock
                    errorBlock:(void (^)(NSError *error))errorBlock;


/**
 This methods performs Http Head on the passed url, also returns the success/error result in the designated blocks.
 
 @param url url for the network call.
 @param params delete parameters
 @param headers optional header for http request.
 @param requestSerailizer type of serailizer
 @param successBlock if callback received successfully then this block gets executed.
 Note: As we don't receive any response object in HEAD call so, data passed in success block will be always nil
 @param errorBlock if error is received in response then this block gets executed.
 */
+(NSURLSessionDataTask *)head:(NSString *)url
                       params:(NSDictionary *)params
                      headers:(NSDictionary *)headers
            requestSerializer:(ERequestSerailizer)requestSerailizer
                      timeout:(float)timeout
                 successBlock:(void (^)(id data))successBlock
                   errorBlock:(void (^)(NSError *error))errorBlock;

@end
