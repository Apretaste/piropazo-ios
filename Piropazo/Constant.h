//
//  Constant.h
//  ibeacon stores
//
//  Created by One Click IT Consultancy  on 5/14/14.
//  Copyright (c) 2014 One Click IT Consultancy . All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Constant <NSObject>

typedef enum ScrollDirection {
    ScrollDirectionNone,
    ScrollDirectionRight,
    ScrollDirectionLeft,
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionCrazy,
} ScrollDirection;


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define IS_IPHONE_6plus (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)

#define IS_IPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


#define DEVICE_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define DEVICE_WIDTH [[UIScreen mainScreen] bounds].size.width


#define iPhone6_Ratio 1.17
#define iPhone6_Plus_Ratio 1.29

#define customErrorCodeForMessage 123456

#define kEmptyString @""


//#define Alert_Animation_Type URBAlertAnimationTumble
#define Alert_Animation_Type URBAlertAnimationTopToBottom

#define APP_DELEGATE (AppDelegate*)[[UIApplication sharedApplication]delegate]


//#define WEB_SERVICE_URL @"https://apretaste.com/"
#define WEB_SERVICE_URL @"http://piropazo.net/"
// http://piropazo.net/run/api

#define ALERT_TITLE @"Piropazo"

#define OK_BTN @"OK"
#define ALERT_CANCEL  [TSLanguageManager localizedString:@"Cancel"]
#define ALERT_DELETE  @"Delete"
#define ALERT_EDIT  @"Edit"
#define ALERT_PUSH_TO_ACCOUNT  @"Push to Accounts"
#define ACTION_TAKE_PHOTO      [TSLanguageManager localizedString:@"Take Picture"]
#define ACTION_LIBRARY_PHOTO   @"Photo From Library"


#define CONNECTION_FAILED      @"Please check internet connection"

#define IPhone4BackgroundImage @"SplashScreen4.png"
#define IPhone5BackgroundImage @"SplashScreen5.png"
#define IPhone6BackgroundImage @"SplashScreen6.png"
#define IPhone6PlusBackgroundImage @"SplashScreen6+@1242x2208.png"
#define Navigationlogo @"naviagtionlogo.png"


#pragma mark User Credential-----------------------------------------

#define CURRENT_USER_LANGUAGE [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_LANGUAGE"]

#define CURRENT_USER_FCM_TOKEN [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_FCM_TOKEN"]


#define CURRENT_USER_ID [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_ID"]
#define CURRENT_USER_ACCESS_TOKEN [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_ACCESS_TOKEN"]

#define CURRENT_USER_EMAIL [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_EMAIL"]
#define CURRENT_USER_FIRST_NAME [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_FIRST_NAME"]
#define CURRENT_USER_LAST_NAME [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_LAST_NAME"]
#define CURRENT_USER_IMAGE [[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENT_USER_IMAGE"]
#define NEW_USER_STATUS [[NSUserDefaults standardUserDefaults] valueForKey:@"NEW_USER_STATUS"]
#define GENDER_STATUS [[NSUserDefaults standardUserDefaults] valueForKey:@"GENDER_STATUS"]
#define USER_IMAGE [[NSUserDefaults standardUserDefaults] valueForKey:@"USER_IMAGE"]
#define LAST_MESSAGE_ID [[NSUserDefaults standardUserDefaults] valueForKey:@"LAST_MESSAGE_ID"]


#pragma mark - Color Codes------------------------------
#define dark_gray_color @"4d4d4d"
#define light_gray_bg_color @"d3d3d3"

#define dark_red_color @"ae0125"
#define dark_blue_color @"175181"
#define dark_green_color @"3C905A"
#define light_green_color @"2dce28"
#define viewTransperentColor @"20EN33"
//#define borderLineRegistration @"636f70"


#define App_Background_color @"d3d3d3"
#define App_Header_Color @"FFFFFF"
#define header_font_color @"3C905A"
#define light_red_color @"f26522"

#define color_search_bar_textfield_bg @"FFFFFF"

#define lightGayColor [UIColor colorWithRed:104/255.0 green:111/255.0 blue:103/255.0 alpha:1.0]
#define violetgreenColor [UIColor colorWithRed:106/255.0 green:148/255.0 blue:84/255.0 alpha:1.0]
#define darkGayColor [UIColor colorWithRed:141/255.0 green:146/255.0 blue:142/255.0 alpha:1.0]

#define navigationBackgroundcolor [UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0]

#define borderLineRegistration [UIColor colorWithRed:99/255.0 green:111/255.0 blue:253/112.0 alpha:1.0]
#define merunRed [UIColor colorWithRed:78/255.0 green:23/255.0 blue:24/112.0 alpha:1.0]
#define infoButtonColor [UIColor colorWithRed:185/255.0 green:185/255.0 blue:185/255.0 alpha:1.0]
#define SwipeRedColor [UIColor colorWithRed:243/255.0 green:123/255.0 blue:97/255.0 alpha:1.0]
#define SwipeGreenColor [UIColor colorWithRed:106/255.0 green:148/255.0 blue:84/255.0 alpha:1.0]
#define TextBoxColor [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0]
#define RatingButtonColor [UIColor colorWithRed:4/255.0 green:152/255.0 blue:137/255.0 alpha:1.0]


 //4/152/137
#pragma mark - Images------------------------------------
#define Image_App_Background @""
#define Icon_Stats @"icon_stats.png"
#define Icon_Back_Button @"back-btn.png"
#define Icon_Close_Button @"icon_close.png"
#define Icon_Search @"search_icon.png"
#define PlaceHolderImage @"profile_thumb.png"


#pragma mark - All Keywords of the App

@end
