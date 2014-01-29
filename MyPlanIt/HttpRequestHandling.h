//
//  HttpRequestHandling.h
//  MyPlanIt
//
//  Created by Justin Wanajrat kumar on 28/01/14.
//  Copyright (c) 2014 MyPlanIt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomHttpClient.h"
#import <CoreLocation/CoreLocation.h>
#import "Note.h"
@interface HttpRequestHandling : NSObject
-(void) loginAuthentication:(NSString *) userName andPassword:(NSString *) password anddeviceID:(NSString *) deviceID andLocation:(CLLocation *) location andDate:(NSTimeInterval) date;
-(Note *) getNoteData:(NSString *) title andText:(NSString *)text andType:(NSString *) type andDate:(NSString *) date;
@end
