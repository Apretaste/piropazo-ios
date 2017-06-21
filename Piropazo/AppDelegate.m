//
//  AppDelegate.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <BuddyBuildSDK/BuddyBuildSDK.h>


@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Life Cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [BuddyBuildSDK setup];
    
    //Test for commit new
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    changeLanguage = NO;
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:@"twoWay" forKey:@"wayToSwipe"];
    [userDefault synchronize];
    
    NSLog(@"%s",__FUNCTION__);
    _window.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor blackColor];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
//=========================== Fabric ================================//
    [Fabric with:@[[Crashlytics class]]];
//==================================================================//
//    [Fabric with:@[[Crashlytics class]]];

    //Test for Push
    
    appLatitude = @"0";
    appLongitude = @"0";
    
    deviceTokenStr = @"1234";
    
    /*-----------Push Notitications----------*/
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        // Register for Push Notitications, if running iOS 8
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }
    else
    {
        // Register for Push Notifications before iOS 8
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
        [application enabledRemoteNotificationTypes];
    }
    /*-------------------------------------------*/
 
    [self splashOn];
   
    self.window.frame = [[UIScreen mainScreen] bounds];
    [_window makeKeyAndVisible];
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //changeLanguage = NO;
   /* self.window.rootViewController = nil;
    
    BackGrounVC * splash = [[BackGrounVC alloc] init];
    UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:splash];
    navControl.navigationBarHidden=YES;
    
    self.window.rootViewController = navControl;*/
    


    //    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"backGroundimage"];
//    [[NSUserDefaults standardUserDefaults] synchronize];

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
   // NSString *languageSyatem = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
   
//    
//    if (changeLanguage == YES) {
//        
//        NSLog(@"languageChange==>%@",languageSyatem);
//        
//        if([CURRENT_USER_LANGUAGE isEqual:[NSNull null]] || [CURRENT_USER_LANGUAGE isEqualToString:@""] || CURRENT_USER_LANGUAGE == nil || [CURRENT_USER_LANGUAGE isEqualToString:@"(null)"])
//        {
//            if ([languageSyatem isEqualToString:@"es"]) {
//                [TSLanguageManager setSelectedLanguage:kLMSpanish];
//            }
//            else{
//                [TSLanguageManager setSelectedLanguage:kLMEnglish];
//            }
//        }
//        else{
//            
//            if ([CURRENT_USER_LANGUAGE isEqualToString:languageSyatem]) {
//                
//            }
//            else{
//                [APP_DELEGATE setUpTabBarController:@"NO"];
//            }
//        }
//    }
//    
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    //[self splashOn];

    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - SetUp Tabbar
-(void)setUpTabBarController:(NSString*)isFirsttime
{
   /* HomeVC * firstViewController = [[HomeVC alloc] init];
    firstViewController.title=@"People";
    firstViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"People" image:[[UIImage imageNamed:@"icon_home.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"icon_home_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    UINavigationController * firstNavigation = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    
    MyMatchesVC * secondViewController = [[MyMatchesVC alloc] init];
    secondViewController.title=@"Matches";
    secondViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"Matches" image:[[UIImage imageNamed:@"icon_campaign.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"icon_campaign_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    UINavigationController * secondNavigation = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    
    
    EditProfileVC * thirdViewController = [[EditProfileVC alloc] init];
    thirdViewController.title = @"Profile";
    thirdViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"Profile" image:[[UIImage imageNamed:@"icon_contacts.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"icon_contact_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    UINavigationController * thirdNavigation = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
    
    
    UITabBarController * mainTabBarController = [[UITabBarController alloc] init];
    mainTabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavigation, secondNavigation, thirdNavigation, nil];
    mainTabBarController.tabBar.tintColor = [UIColor whiteColor];
    mainTabBarController.delegate = self;
//    mainTabBarController.tabBar.barTintColor = [self colorWithHexString:header_font_color];
    _window.rootViewController = mainTabBarController;
    
    
//    UIImage* tabBarBackground = [self imageFromColor:[self colorWithHexString:App_Header_Color]];
//    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setTintColor:[self colorWithHexString:header_font_color]];*/

//    [[UIBarButtonItem appearance] setTintColor:[self colorWithHexString:header_font_color]];

//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
//    [[UINavigationBar appearance] setTintColor:[self colorWithHexString:header_font_color]];
////    [[UINavigationBar appearance] setBackgroundColor:[self colorWithHexString:App_Header_Color]];
//    [[UINavigationBar appearance] setBackgroundImage:[self imageFromColor:[APP_DELEGATE colorWithHexString:App_Header_Color]] forBarMetrics:UIBarMetricsDefault];
    
    
    HomeVC * firstViewController = [[HomeVC alloc]init];
   // firstViewController.title=@"New";
    if ([isFirsttime isEqualToString:@"YES"]) {
        firstViewController.strFirst = @"isFromFirstTime";
    }
    firstViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"people.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"active_people.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    
    UINavigationController *firstNavigation = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    [firstNavigation.navigationBar setBarTintColor:[UIColor whiteColor]];
    firstNavigation.navigationBarHidden=YES;

    MyMatchesVC * secondViewController = [[MyMatchesVC alloc]init];
    //secondViewController.title=@"Current";
    secondViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"heart.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"active_heart.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
     UINavigationController *secondNavigation = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    secondNavigation.navigationBarHidden=YES;

    
    EditProfileVC * thirdViewController = [[EditProfileVC alloc]init];
    //thirdViewController.title = @"Completed";
    thirdViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"user.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"active_user.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    UINavigationController *thirdNavigation = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
    thirdNavigation.navigationBarHidden=YES;

    
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavigation, secondNavigation, thirdNavigation,nil];
    //tabBarController.tabBar.tintColor = globalAppColor;
    tabBarController.delegate = self;
    //tabBarController.tabBar.barTintColor = globalAppColor;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.0f],
                                                        NSForegroundColorAttributeName : [UIColor whiteColor]
                                                        } forState:UIControlStateSelected];
    
    
    // doing this results in an easier to read unselected state then the default iOS 7 one
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:175.0/225.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0]
                                                        } forState:UIControlStateNormal];
//    for(UITabBarItem * tabBarItem in tabBarController){
//        tabBarItem.title = @"";
//        tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
//    }
    [self.window makeKeyAndVisible];
    _window.rootViewController = tabBarController;

}

#pragma mark Location manager delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil)
    {
        appLatitude =[NSString stringWithFormat:@"%f",currentLocation.coordinate.latitude];
        appLongitude =[NSString stringWithFormat:@"%f",currentLocation.coordinate.longitude];
    }
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error===%@",error);
    NSLog(@"%s",__FUNCTION__);
}

#pragma mark - Orientation
-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark Remote notification

#ifdef __IPHONE_8_0
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:   (UIUserNotificationSettings *)notificationSettings
{
    //register to receive notifications
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString   *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    //handle the actions
    if ([identifier isEqualToString:@"declineAction"]){
    }
    else if ([identifier isEqualToString:@"answerAction"]){
    }
}

#endif

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    deviceTokenStr = [[[[deviceToken description]
                        stringByReplacingOccurrencesOfString: @"<" withString: @""]
                       stringByReplacingOccurrencesOfString: @">" withString: @""]
                      stringByReplacingOccurrencesOfString: @" " withString: @""] ;
    NSLog(@"My device token ============================>>>>>>>>>>>%@",deviceTokenStr);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

#pragma mark - SplashScreen
#pragma mark splashscreen Method
-(void)splashOn
{
    splashScreen = [[SplashVC alloc] init];
    [self.window addSubview:splashScreen.view];
    self.window.rootViewController = splashScreen;
    
}
#pragma mark  HIDE TAB BAR AT BOTTOM
- (void) hideTabBar:(UITabBarController *) tabbarcontroller
{
    tabbarcontroller.tabBar.hidden = YES;
    
}

#pragma mark  SHOW TAB BAR AT BOTTOM
- (void) showTabBar:(UITabBarController *) tabbarcontroller
{
    tabbarcontroller.tabBar.hidden = NO;
}
#pragma mark - Internet Status
-(BOOL)getInternetStatus
{
    BOOL iSNetAvaliable;
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        iSNetAvaliable=NO;
        
        NSLog(@"There IS NO internet connection");
        if (isFirstTimePOPUp == YES)
        {
            isFirstTimePOPUp=NO;
            
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[NSString stringWithFormat:@"Please check internet connection!"] cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView setMessageFont:[UIFont systemFontOfSize:14.0]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    isFirstTimePOPUp=YES;
                    
                    [alertView removeFromSuperview];
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
        
    }else
    {
        isFirstTimePOPUp=YES;
        iSNetAvaliable=YES;
    }
    
    
    return iSNetAvaliable;
}

#pragma mark - Error Message
-(void)ShowErrorPopUpWithErrorCode:(NSInteger)errorCode andMessage:(NSString*)errorMessage
{
    NSString * strErrorMessage;
    if (errorCode == -1004)
    {
        strErrorMessage = @"Could not connect to the server";
    }
    else if (errorCode == -1009)
    {
        strErrorMessage = @"No Network Connection";
    }
    else if (errorCode == -1005)
    {
        strErrorMessage = @"Network Connection Lost";
        //        strErrorMessage = @"";
    }
    else if (errorCode == -1001)
    {
        strErrorMessage = @"Request Timed Out";
    }
    else if (errorCode == customErrorCodeForMessage)//custom message
    {
        strErrorMessage = errorMessage;
    }
    
    [viewNetworkConnectionPopUp removeFromSuperview];
    [viewNetworkConnectionPopUp setAlpha:0.0];
    
    if (![strErrorMessage isEqualToString:@""])
    {
        viewNetworkConnectionPopUp = [[UIView alloc] initWithFrame:CGRectMake(0, -64, DEVICE_WIDTH, 64)];
        [viewNetworkConnectionPopUp setBackgroundColor:[UIColor clearColor]];
        [self.window addSubview:viewNetworkConnectionPopUp];
        
        UIView * viewTrans = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewNetworkConnectionPopUp.frame.size.width, viewNetworkConnectionPopUp.frame.size.height)];
        [viewTrans setBackgroundColor:[self colorWithHexString:dark_red_color]];
        [viewTrans setAlpha:0.9];
        [viewNetworkConnectionPopUp addSubview:viewTrans];
        
        UIImageView * imgProfile = [[UIImageView alloc] initWithFrame:CGRectMake(50, 24, 16, 16)];
        [imgProfile setImage:[UIImage imageNamed:@"cross.png"]];
        imgProfile.contentMode = UIViewContentModeScaleAspectFit;
        imgProfile.clipsToBounds = YES;
        //[viewNetworkConnectionPopUp addSubview:imgProfile];
        
        UILabel * lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, DEVICE_WIDTH-40, 44)];
        [lblMessage setBackgroundColor:[UIColor clearColor]];
        [lblMessage setTextColor:[UIColor whiteColor]];
        [lblMessage setTextAlignment:NSTextAlignmentCenter];
        [lblMessage setNumberOfLines:2];
        [lblMessage setText:[NSString stringWithFormat:@"%@",strErrorMessage]];
        [lblMessage setFont:[UIFont systemFontOfSize:14]];
        [viewNetworkConnectionPopUp addSubview:lblMessage];
        
        
        [UIView transitionWithView:viewNetworkConnectionPopUp duration:0.3
                           options:UIViewAnimationOptionCurveEaseIn
                        animations:^{
                            [viewNetworkConnectionPopUp setFrame:CGRectMake(0, 0, DEVICE_WIDTH, 64)];
                        }
                        completion:^(BOOL finished) {
                        }];
    }
    
    [timerNetworkConnectionPopUp invalidate];
    timerNetworkConnectionPopUp = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(removeNetworkConnectionPopUp:) userInfo:nil repeats:NO];
}

-(void)removeNetworkConnectionPopUp:(NSTimer*)timer
{
    [UIView transitionWithView:viewNetworkConnectionPopUp duration:0.3
                       options:UIViewAnimationOptionCurveEaseIn
                    animations:^{
                        [viewNetworkConnectionPopUp setFrame:CGRectMake(0, -64, DEVICE_WIDTH, 64)];
                    }
                    completion:^(BOOL finished)
     {
         [viewNetworkConnectionPopUp removeFromSuperview];
     }];
}

#pragma mark - Global Helper Functions
-(BOOL)validateEmail:(NSString*)email
{
    if( (0 != [email rangeOfString:@"@"].length) &&  (0 != [email rangeOfString:@"."].length) )
    {
        NSMutableCharacterSet *invalidCharSet = [[[NSCharacterSet alphanumericCharacterSet] invertedSet]mutableCopy];
        [invalidCharSet removeCharactersInString:@"_-"];
        
        NSRange range1 = [email rangeOfString:@"@" options:NSCaseInsensitiveSearch];
        
        // If username part contains any character other than "."  "_" "-"
        
        NSString *usernamePart = [email substringToIndex:range1.location];
        NSArray *stringsArray1 = [usernamePart componentsSeparatedByString:@"."];
        for (NSString *string in stringsArray1)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet: invalidCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return FALSE;
        }
        
        NSString *domainPart = [email substringFromIndex:range1.location+1];
        NSArray *stringsArray2 = [domainPart componentsSeparatedByString:@"."];
        
        for (NSString *string in stringsArray2)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:invalidCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return FALSE;
        }
        
        return TRUE;
    }
    else {// no '@' or '.' present
        return FALSE;
    }
}

-(UIColor *) colorWithHexString:(NSString *)stringToConvert
{
    // NSLog(@"ColorCode -- %@",stringToConvert);
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
            
                           green:((float) g / 255.0f)
            
                            blue:((float) b / 255.0f)
            
                           alpha:1.0f];
}

- (UIImage *)imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)HideLineDivider:(UITextField *)Textfield
{
    for (UIView* b in Textfield.subviews)
    {
        [b removeFromSuperview];
    }
    UILabel *bottomBorder;
    [bottomBorder removeFromSuperview];
    bottomBorder = [[UILabel alloc]init];
    bottomBorder.frame = CGRectMake(0,0, 0,0);
    bottomBorder.frame = CGRectMake(0.0f, Textfield.frame.size.height - 1.5,Textfield.frame.size.width, 1.5f);
    CGFloat duration = 0.0;
    bottomBorder.backgroundColor = [UIColor blueColor];
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationCurveEaseOut animations:^{
        bottomBorder.frame = CGRectMake(0,0, 0,0);
    } completion:^(BOOL finished)
     {
         bottomBorder.backgroundColor = [UIColor clearColor];
     }];
    bottomBorder.layer.cornerRadius=0.75;
    [Textfield addSubview:bottomBorder];
}
#pragma mark - Get Height
-(CGSize)getSizeForText:(NSString*)givenText andWidth:(CGFloat)givenWidth andFontWeight:(CGFloat)fontWeight andFontSize:(CGFloat)fontSize
{
    CGSize constraint = CGSizeMake(givenWidth, CGFLOAT_MAX);
    CGSize boundingBox = [givenText boundingRectWithSize:constraint options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize weight:fontWeight]} context:nil].size;CGSize size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    return size;
}
- (void) addTextFieldBottomColorr:(UITextField *)textField {
    UIColor *borderColor = violetgreenColor;
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(5.0f, textField.frame.size.height - 1,textField.frame.size.width-10, 1.0f);
    bottomBorder.backgroundColor = borderColor.CGColor;
    [textField.layer addSublayer:bottomBorder];
}
- (void) addRegisterTextFieldBottomColorr:(UITextField *)textField {
    UIColor *borderColor = [UIColor blackColor];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(5.0f, textField.frame.size.height - 1,textField.frame.size.width-10, 1.0f);
    bottomBorder.backgroundColor = borderColor.CGColor;
    [textField.layer addSublayer:bottomBorder];
}
#pragma mark Hud Method
-(void)startHudProcess:(NSString *)text
{
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
    HUD.labelText = text;
    [self.window addSubview:HUD];
    [HUD show:YES];
}
-(void)endHudProcess
{
    [HUD hide:YES];
}

@end
