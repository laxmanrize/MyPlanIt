//
//  Atom.h
//  MyPlanIt
//
//  Created by Justin wanajrat on 21/01/14.
//  Copyright (c) 2014 MyPlanIt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Atom : NSObject
{
    
}
@property(nonatomic,retain) NSString *id;
@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) NSString *label;
@property(nonatomic) double creationLat;
@property(nonatomic) double creationLong;
@property(nonatomic) double creationDate;

@property(nonatomic) double geoLocationLat;
@property(nonatomic) double geoLocationLong;
@property(nonatomic) double date;
@property(nonatomic,retain) NSString *image;
@property(nonatomic) double startDate;
@property(nonatomic) double endDate;
@property(nonatomic,retain) NSString *frequency;
@property(nonatomic,retain) NSString *person;
@property(nonatomic,retain) NSString *links;
@property(nonatomic,retain) NSString *addresses;
@property(nonatomic,retain) NSString *contacts;

@end
