//
//  AppDelegate.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValidateEmailVC.h"
#import "HomeVC.h"
#import "MyMatchesVC.h"
#import "EditProfileVC.h"
#import "SplashVC.h"
#import "MBProgressHUD.h"
#import "BackGrounVC.h"
#import "Reachability.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
NSString * deviceTokenStr;
NSString * appLatitude;
NSString * appLongitude;

NSString *Custom_Regular;
SplashVC * splashScreen;

BOOL changeLanguage;


@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    UIView * viewNetworkConnectionPopUp;
    NSTimer * timerNetworkConnectionPopUp;
    
    
    NSTimer * timerSplash;
    
    MBProgressHUD * HUD;
    
    BOOL isFirstTimePOPUp;


}

@property (strong, nonatomic) UIWindow *window;

#pragma mark - Helper Methods
-(UIColor *) colorWithHexString:(NSString *)stringToConvert;
-(BOOL)validateEmail:(NSString*)email;
- (UIImage *)imageFromColor:(UIColor *)color;
-(void)setUpTabBarController:(NSString*)isFirstTime;
-(void)startHudProcess:(NSString *)text;
-(void)endHudProcess;
- (void) addTextFieldBottomColorr:(UITextField *)textField;
- (void) addRegisterTextFieldBottomColorr:(UITextField *)textField;
- (void) hideTabBar:(UITabBarController *) tabbarcontroller;
- (void) showTabBar:(UITabBarController *) tabbarcontroller;
-(CGSize)getSizeForText:(NSString*)givenText andWidth:(CGFloat)givenWidth andFontWeight:(CGFloat)fontWeight andFontSize:(CGFloat)fontSize;

#pragma mark - Internet status

-(BOOL)getInternetStatus;
@end

