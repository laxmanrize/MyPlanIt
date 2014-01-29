//
//  MyPlanViewController.m
//  MyPlanIt
//
//  Created by Justin wanajrat on 20/01/14.
//  Copyright (c) 2014 MyPlanIt. All rights reserved.
//

#import "MyPlanViewController.h"

@interface MyPlanViewController ()

@end

@implementation MyPlanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)login:(id)sender
{
    if (![userNameTF.text isEqualToString:@""] && ![passwordTF.text isEqualToString:@""])
    {
        if ([passwordTF.text isEqualToString:@"12345"]) {
            [self startProgressBar];
            locManager = [[CLLocationManager alloc] init];
            locManager.delegate = self;
            [locManager startUpdatingLocation];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MyPlanIt" message:@"Invalid Password" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MyPlanIt" message:@" Please enter Username and Password " delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        
    }
    
    
    
}
/**
 * This method used to fetch the device id for unique functionality
 *
 *
 * @return String
 *
 */
-(NSString *)getDeviceID
{
    //getting the Device ID which is Unique for every device.
    //UIDevice *objDevice = [UIDevice currentDevice];
	NSUUID *udid = [[ASIdentifierManager sharedManager] advertisingIdentifier];
    //[[UIDevice currentDevice] identifierForVendor];
    
    return [udid.UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
     
    CLLocation *newLocation = [locations lastObject];
    if (newLocation) {
        NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
        if (locationAge > 5.0) {
            return;
        }
        if (newLocation.horizontalAccuracy < 0) {
            return;
        }
        if (currentLocation == nil || currentLocation.horizontalAccuracy >newLocation.horizontalAccuracy) {
            currentLocation = newLocation;
            [manager stopUpdatingLocation];
            if (currentLocation && currentLocation.coordinate.longitude && currentLocation.coordinate.longitude)
            {
               
                 NSTimeInterval currentDate = [[NSDate date] timeIntervalSince1970];
                HttpRequestHandling *http = [[HttpRequestHandling alloc] init];
                [http loginAuthentication:userNameTF.text andPassword:passwordTF.text anddeviceID:[self getDeviceID] andLocation:currentLocation andDate:currentDate];
                [self performSelector:@selector(displaySuccess) withObject:nil afterDelay:0.1];
                
                
            }
        }
        
    }
    
}
-(void) displaySuccess
{
    [locManager stopUpdatingLocation];
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 340, 200, 50)];
    label.text = @"Login Successful";
    [self.view addSubview:label];
     [self stopProgressBar];
    
}
-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MyPlanIt" message:@"Failed to get your location" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    [locManager stopUpdatingLocation];
}
#pragma mark - textfield delegate methods
-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationBeginsFromCurrentState:YES];
    if (textField == userNameTF)
    {
        [textField setReturnKeyType:UIReturnKeyNext];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-60, self.view.frame.size.width,  self.view.frame.size.height);
        
    }
    else if(textField == passwordTF)
    {
        [textField setReturnKeyType:UIReturnKeyDone];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-80, self.view.frame.size.width,  self.view.frame.size.height);
    }
    [UIView commitAnimations];
}
-(void) textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == userNameTF)
    {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+60, self.view.frame.size.width,  self.view.frame.size.height);
        
    }
    if(textField == passwordTF)
    {
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height);
        
    }
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
/**
 * This method used to stop progreassbar
 *
 * @return void
 */

-(void)stopProgressBar
{
    if (m_ctrlActivity != nil)
    {
        [m_ctrlActivity stopAnimating];
        m_ctrlActivity.hidden = YES;
        [self.view setUserInteractionEnabled:YES];
    }
}

/**
 * This method used to start progreassbar
 *
 * @return void
 */
-(void)startProgressBar
{
    m_ctrlActivity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    m_ctrlActivity.frame = CGRectMake(0.0, self.view.frame.size.height/2, 80.0, 80.0);
    m_ctrlActivity.center = self.view.center;
    [self.view addSubview:m_ctrlActivity];
    m_ctrlActivity.backgroundColor = [UIColor grayColor];
    [m_ctrlActivity layer].opacity = .8;
    [m_ctrlActivity layer].cornerRadius = 8.0;
    [m_ctrlActivity bringSubviewToFront:self.navigationController.view];
    m_ctrlActivity.hidden = NO;
    [m_ctrlActivity startAnimating];
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    [self.view setUserInteractionEnabled:NO];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
