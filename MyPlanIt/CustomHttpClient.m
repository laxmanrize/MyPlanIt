//
//  CustomHttpClient.m
//  PTM Mobile
//
//  Created by Justin Wanajrat on 10/06/13.
//  Copyright (c) 2013 MyPlanIt. All rights reserved.
//

#import "CustomHttpClient.h"
#import "Reachability.h"

NSInteger const HTTP_TIMEOUT = 30*1000;//milliseconds
@implementation CustomHttpClient

/**
 * This method performs the HTTP GET request
 *
 * @param NSString url
 * @param NSError err
 *
 * @return NSData
 */
-(NSData *)executeHttpGet:(NSString *)url error:(NSError *)err
{
    NSError *inErr = nil;
    NSURL *requesturl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requesturl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:HTTP_TIMEOUT];
    [request setHTTPMethod:@"GET"];
    
    NSURLResponse *resp = [[NSURLResponse alloc] init];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&err];
    if(inErr != nil || returnData == nil)
        return nil;
    
    return returnData;
}

/**
 * This method performs the HTTP POST request
 *
  *
 * @return NSData
 */
-(NSData *)executeHttpPost:(NSString *)url andRequestString:(NSMutableDictionary *)requestStr error:(NSError *)err
{
    NSError *error;
    NSData *myRequestData = [NSJSONSerialization dataWithJSONObject:requestStr options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        return nil;
    }
    NSURL *requesturl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requesturl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:HTTP_TIMEOUT];
    [ request setHTTPMethod: @"POST" ];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [ request setHTTPBody: myRequestData ];
    NSURLResponse *response;
    NSError *inErr;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&inErr];
    if(inErr != nil || returnData == nil)
        return nil;
    
    return returnData;
}

/**
 * This method performs the HTTP POST request
 *
 *
 * @return NSData
 */
-(NSData *)executeHttpPost:(NSString *)url requestString:(NSString *)requestStr error:(NSError *)err
{
    NSError *error;
    NSData *postData = [requestStr dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    
    if (error)
    {
        return nil;
    }
    NSURL *requesturl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requesturl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:HTTP_TIMEOUT];
    [ request setHTTPMethod: @"POST" ];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [ request setHTTPBody: postData ];
    NSURLResponse *response;
    NSError *inErr;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&inErr];
    if(inErr != nil || returnData == nil)
        return nil;
    
    return returnData;
}

/**
 * This method performs the HTTP POST request
 *
 *
 * @return NSData
 */
-(NSData *)executeHttpPost:(NSString *)url andJSONRequestString:(NSMutableDictionary *)jsonDisctionary error:(NSError *)err
{
    NSError *error;
    NSData *myRequestData = [NSJSONSerialization dataWithJSONObject:jsonDisctionary options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        return nil;
    }
    NSURL *requesturl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requesturl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:HTTP_TIMEOUT];
    [ request setHTTPMethod: @"POST" ];
    [ request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [ request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [request setTimeoutInterval:3600];
    [ request setHTTPBody: myRequestData];
    NSURLResponse *response;
    NSError *inErr;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&inErr];
    if(inErr != nil || returnData == nil)
        return nil;
    
    return returnData;
}


/**
 * This method used for checking the weather Internet service available on the device or not
 * returns true if service exists.
 * returns false if service not-exists
 *
 * @param
 *
 * @return BOOL
 */
-(BOOL)checkInternetConnection
{
    Reachability *r = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [r currentReachabilityStatus];
    if(internetStatus == NotReachable)
    {
        return NO;
    }
	return YES;
}
@end
