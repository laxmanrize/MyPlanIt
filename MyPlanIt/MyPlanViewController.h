//
//  MyPlanViewController.h
//  MyPlanIt
//
//  Created by Justin wanajrat on 20/01/14.
//  Copyright (c) 2014 MyPlanIt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "HttpRequestHandling.h"
#import <CoreLocation/CoreLocation.h>
#import <AdSupport/AdSupport.h>
@interface MyPlanViewController : UIViewController<CLLocationManagerDelegate,UITextFieldDelegate>
{
    IBOutlet UITextField *userNameTF;
    IBOutlet UITextField *passwordTF;
    CLLocationManager *locManager;
    CLLocation *currentLocation;
    UIActivityIndicatorView *m_ctrlActivity;
}
-(IBAction)login:(id)sender;
@end
