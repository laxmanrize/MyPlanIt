//
//  Person.h
//  MyPlanIt
//
//  Created by Justin wanajrat on 21/01/14.
//  Copyright (c) 2014 MyPlanIt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic) double anniversary;
@property(nonatomic) double birthdayDate;
@property(nonatomic,retain) NSString * companyName;
@property(nonatomic) double department;
@property(nonatomic,retain) NSString *firstInitial;
@property(nonatomic,retain) NSString *firstName;
@property(nonatomic,retain) NSString *fullname;
@property(nonatomic,retain) NSString *image;
@property(nonatomic,retain) NSString *jobTitle;
@property(nonatomic,retain) NSString *lastInitial;
@property(nonatomic,retain) NSString *lastName;
@property(nonatomic,retain) NSString *middleName;
@property(nonatomic,retain) NSString *prefix;
@property(nonatomic,retain) NSString *suffix;
@property(nonatomic,retain) NSString *nick;
@property(nonatomic,retain) NSString *personDescription;
@end
