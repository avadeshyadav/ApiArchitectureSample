//
//  RySdkUtility.h
//  RySdk
//
//  Created by Ashwani Hundwani on 12/12/2014.
//  Copyright (c) 2014 Ashwani Hundwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RySdkUtility : NSObject

+(BOOL)isNetworkReachable;

+(void)addTapGestureToView:(UIView *)view
                    target:(id)target
                  selector:(SEL)selector;


+(void)addPanGestureToView:(UIView *)view
                    target:(id)target
                  selector:(SEL)selector;

+(id<UIApplicationDelegate>)appDelegate;

+(NSUserDefaults *)userDefaults;

+(UIStoryboard *)mainStoryboard;

@end
