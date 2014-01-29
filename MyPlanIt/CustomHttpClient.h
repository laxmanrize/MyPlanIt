//
//  CustomHttpClient.h
//  PTM Mobile
//
//  Created by Justin ; on 10/06/13.
//  Copyright (c) 2013 MyPlanIt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomHttpClient : NSObject
-(NSData *)executeHttpGet:(NSString *)url error:(NSError *)err;
-(NSData *)executeHttpPost:(NSString *)url andRequestString:(NSMutableDictionary *)requestStr error:(NSError *)err;
-(NSData *)executeHttpPost:(NSString *)url requestString:(NSString *)requestStr error:(NSError *)err
;
-(NSData *)executeHttpPost:(NSString *)url andJSONRequestString:(NSMutableDictionary *)jsonDisctionary error:(NSError *)err;
-(BOOL)checkInternetConnection;
@end
