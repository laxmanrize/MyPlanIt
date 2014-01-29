//
//  Address.h
//  MyPlanIt
//
//  Created by Justin wanajrat on 21/01/14.
//  Copyright (c) 2014 MyPlanIt. All rights reserved.
//

#import <Foundation/Foundation.h>
//address
@interface Address : NSObject
@property(nonatomic,retain) NSString *city;
@property(nonatomic,retain) NSString *country;
@property(nonatomic,retain) NSString *countryCode;
@property(nonatomic,retain) NSString *crossStreet;
@property(nonatomic,retain) NSString *state;
@property(nonatomic,retain) NSString *street;
@property(nonatomic,retain) NSString *zip;
@property(nonatomic,retain) NSString *label;
@property(nonatomic,retain) NSString *source;
@end
