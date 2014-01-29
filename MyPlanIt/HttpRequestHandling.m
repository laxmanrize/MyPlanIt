//
//  HttpRequestHandling.m
//  MyPlanIt
//
//  Created by Justin Wanajrat kumar on 28/01/14.
//  Copyright (c) 2014 MyPlanIt. All rights reserved.
//

#import "HttpRequestHandling.h"


@implementation HttpRequestHandling
-(Note *) getNoteData:(NSString *) title andText:(NSString *)text andType:(NSString *) type andDate:(NSString *) date
{
    NSError *inErr = nil;
    NSString *url=@"http://www.google.com";
    NSString *response;
    Note *noteData= [[Note alloc] init];
    CustomHttpClient *httpClient = [[CustomHttpClient alloc] init];
    NSData *returnData = [httpClient executeHttpGet:url error:inErr];
    response = [[NSString alloc] initWithData:returnData encoding:NSASCIIStringEncoding];
    //NSDictionary *ret = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&inErr];
    
    return noteData;
}
-(void) loginAuthentication:(NSString *) userName andPassword:(NSString *) password anddeviceID:(NSString *) deviceID andLocation:(CLLocation *) location andDate:(NSTimeInterval)date
{
    NSError *inErr = nil;
    NSString *url=@"http://www.google.com";
    NSString *response;
    CustomHttpClient *httpClient = [[CustomHttpClient alloc] init];
    NSData *returnData = [httpClient executeHttpGet:url error:inErr];
    response = [[NSString alloc] initWithData:returnData encoding:NSASCIIStringEncoding];
   // NSDictionary *ret = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&inErr];
    
    
    
    
    

}
@end
