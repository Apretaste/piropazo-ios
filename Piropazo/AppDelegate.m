//
//  AppDelegate.m
//  DatingApp8e903ac850959c05ec044ce7541050931e633250e029b6b82a6d26aa0b62129b//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import <BuddyBuildSDK/BuddyBuildSDK.h>
#import <UserNotifications/UserNotifications.h>
#import <Firebase.h>
#import <FirebaseInstanceID/FirebaseInstanceID.h>
#import <FirebaseMessaging/FirebaseMessaging.h>

@interface AppDelegate ()<UNUserNotificationCenterDelegate,FIRMessagingDelegate>

@end

@implementation AppDelegate
@synthesize isOnChatScreen,isOtherUserdetailScreen;
#pragma mark - Life Cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    isFromPushNotification = NO;
    IsPopAvialabecrashLogout = NO;
    IsRatingpopUpAvialabe = NO;
    
    [BuddyBuildSDK setup];
    
    //Test
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    changeLanguage = NO;
    isOnChatScreen = NO;
   // isForCrashLogout = NO;
    isOtherUserdetailScreen = NO;
    
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
    
    
    /*-----------Firebase Push Notifications-------------*/
    
    // Register for remote notifications. This shows a permission dialog on first run, to
    // show the dialog at a more appropriate time move this registration accordingly.
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1)
    {
        // iOS 7.1 or earlier. Disable the deprecation warnings.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIRemoteNotificationType allNotificationTypes =
        (UIRemoteNotificationTypeSound |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeBadge);
        [application registerForRemoteNotificationTypes:allNotificationTypes];
#pragma clang diagnostic pop
    } else
    {
        // iOS 8 or later
        // [START register_for_notifications]
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
            UIUserNotificationType allNotificationTypes =
            (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
            UIUserNotificationSettings *settings =
            [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        }
        else
        {
            // iOS 10 or later
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
            // For iOS 10 display notification (sent via APNS)
            [UNUserNotificationCenter currentNotificationCenter].delegate = self;
            UNAuthorizationOptions authOptions =
            UNAuthorizationOptionAlert
            | UNAuthorizationOptionSound
            | UNAuthorizationOptionBadge;
            [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
            }];
#endif
        }
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    
    
    
    [FIRApp configure];

    /*---------------------------------------------------*/
    
    /*-----------Push Notitications----------*/
    // Register for Push Notitications, if running iOS 8
    /*if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
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
    }*/
    /*-------------------------------------------*/
    
    NSDictionary *remoteNotif = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
    if (remoteNotif) {
        
        isFromPushNotification = YES;
        [self handlePushNotificationForDict:remoteNotif];
        NSLog(@"PrabhuDidFinish==>");
    }
 
    [self splashOn];
   
    [_window makeKeyAndVisible];
    
    
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
 
    isFromPushNotification = NO;

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    isFromPushNotification = NO;

}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    NSLog(@"ComingEveryTime");
    
    if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
    {
    }else{
        
        IsPopAvialabecrashLogout = NO;
      [self unreadcount];
        
        NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setValue:@"twoWay" forKey:@"wayToSwipe"];
        [userDefault synchronize];

    }
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    isFromPushNotification = NO;
}

#pragma mark - SetUp Tabbar
-(void)setUpTabBarController:(NSString*)isFirsttime
{

    HomeVC * firstViewController = [[HomeVC alloc]init];
   // firstViewController.title=@"New";
    if ([isFirsttime isEqualToString:@"YES"]) {
        firstViewController.strFirst = @"isFromFirstTime";
    }
    firstViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"people.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"active_people.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    firstViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    UINavigationController *firstNavigation = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    [firstNavigation.navigationBar setBarTintColor:[UIColor whiteColor]];
    firstNavigation.navigationBarHidden=YES;

    MyMatchesVC * secondViewController = [[MyMatchesVC alloc]init];
    //secondViewController.title=@"Current";
    secondViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"heart.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"active_heart.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
     UINavigationController *secondNavigation = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    secondNavigation.navigationBarHidden=YES;
    secondNavigation.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

    EditProfileVC * thirdViewController = [[EditProfileVC alloc]init];
    //thirdViewController.title = @"Completed";
    thirdViewController.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"user.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"active_user.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    UINavigationController *thirdNavigation = [[UINavigationController alloc]initWithRootViewController:thirdViewController];
    thirdNavigation.navigationBarHidden=YES;
    thirdNavigation.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

    
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavigation, secondNavigation, thirdNavigation,nil];
    //tabBarController.tabBar.tintColor = globalAppColor;
    tabBarController.delegate = self;
    //tabBarController.tabBar.barTintColor = globalAppColor;
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.0f],
                                                        NSForegroundColorAttributeName : [UIColor whiteColor]
                                                        } forState:UIControlStateSelected];
    
    
    // doing this results in an easier to read unselected state then the default iOS 7 one
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:11.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:175.0/225.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0]
                                                        } forState:UIControlStateNormal];
    
    //===Only showing images in center with out Text ===// Prabhu
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

/*#ifdef __IPHONE_8_0
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
*/
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"PrabhudidRegisterForRemoteNotifications==>");

       /* deviceTokenStr = [[[[deviceToken description]
                            stringByReplacingOccurrencesOfString: @"<" withString: @""]
                           stringByReplacingOccurrencesOfString: @">" withString: @""]
                          stringByReplacingOccurrencesOfString: @" " withString: @""] ;
        NSLog(@"My device token ============================>>>>>>>>>>>%@",deviceTokenStr);*/
    
       // [[FIRInstanceID instanceID] setAPNSToken:deviceToken type:FIRInstanceIDAPNSTokenTypeSandbox];
       // NSLog(@"deviceToken1 = %@",deviceToken);
    
    NSString *fcmToken = [FIRMessaging messaging].FCMToken;
    NSLog(@"FCM registration token: %@", fcmToken);
    deviceTokenStr = fcmToken;
    NSLog(@"My device token ============================>>>>>>>>>>>%@",deviceTokenStr);
    
    // Pass device token to auth.
    //    [[FIRAuth auth] setAPNSToken:deviceToken type:FIRAuthAPNSTokenTypeProd];
    // Further handling of the device token if needed by the app.
}

- (void)messaging:(nonnull FIRMessaging *)messaging didRefreshRegistrationToken:(nonnull NSString *)fcmToken
{
    NSLog(@"%s",__FUNCTION__);
    
    // Note that this callback will be fired everytime a new token is generated, including the first
    // time. So if you need to retrieve the token as soon as it is available this is where that
    // should be done.
    NSLog(@"FCM registration token: %@", fcmToken);
    
    // TODO: If necessary send token to application server.
}
/*- (void)tokenRefreshNotification:(NSNotification *)notification {
 NSLog(@"instanceId_notification=>%@",[notification object]);
 InstanceID = [NSString stringWithFormat:@"%@",[notification object]];
 
 [self connectToFcm];
 }
 
 - (void)connectToFcm {
 
 [[FIRMessaging messaging] connectWithCompletion:^(NSError * _Nullable error) {
 if (error != nil) {
 NSLog(@"Unable to connect to FCM. %@", error);
 } else {
 
 NSLog(@"InstanceID_connectToFcm = %@", InstanceID);
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
 
 dispatch_async(dispatch_get_main_queue(), ^{
 //                    [self sendDeviceInfo];
 NSLog(@"instanceId_tokenRefreshNotification22=>%@",[[FIRInstanceID instanceID] token]);
 
 });
 });
 
 
 }
 }];
 }*/

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"%s",__FUNCTION__);
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[Messaging messaging] appDidReceiveMessage:userInfo];
    
    // Print message ID.
    //    if (userInfo[kGCMMessageIDKey]) {
    //        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    //    }
    
    // Print full message.
    [self handlePushNotificationForDict:userInfo];

    NSLog(@"PrabhudidRegisterForRemoteNotificationsApns==>");

    NSLog(@"userInfo=>%@", userInfo);
}

//***** THIS METHOD WILL CALL WHEN TAP ON NOTIFICATION WHILE APP IN BACKGROUND *****//
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"%s",__FUNCTION__);
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[Messaging messaging] appDidReceiveMessage:userInfo];
    
    // Print message ID.
    //    if (userInfo[kGCMMessageIDKey]) {
    //        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    //    }
    
    // Print full message.
    isFromPushNotification = YES;

    NSLog(@"userInfo==>%@", userInfo);
    NSLog(@"PrabhudidRegisterForRemoteNotificationsfetchCompletionHandlerUIBackgroundFetchResultNewData==>");

    [self handlePushNotificationForDict:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
}
//****************** METHOD WILL CALL WHEN APP IN FORE GROUND ***********************//Prabhu
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSLog(@"%s",__FUNCTION__);
    NSDictionary *userInfo = notification.request.content.userInfo;
    
    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[Messaging messaging] appDidReceiveMessage:userInfo];
    
    // Print message ID.
    //    if (userInfo[kGCMMessageIDKey]) {
    //        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    //    }
    
    // Print full message.
//    NSString * StrTitle = @"";
//    NSString * StrDescription = @"";
//
//    
//    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"])
//    {
//        if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"] != [NSNull null])
//        {
//            StrTitle = [NSString stringWithFormat:@"%@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]];
//        }
//    }
//    
//    /*if ([userInfo objectForKey:@"google.c.a.c_l"])
//    {
//        if ([userInfo objectForKey:@"google.c.a.c_l"] != [NSNull null])
//        {
//            StrDescription = [NSString stringWithFormat:@"%@",[userInfo objectForKey:@"google.c.a.c_l"]];
//        }
//    }*/
//    
//    if (![StrTitle isEqualToString:@""] && ![StrTitle isEqualToString:@"(null)"])
//    {
//       // if (![StrDescription isEqualToString:@""] && ![StrDescription isEqualToString:@"(null)"])
//       // {
//            
//            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:StrTitle message:StrDescription cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
//            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
//            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//                [alertView hideWithCompletionBlock:^{
//                    
//                }];
//            }];
//            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
//        //}
//    }
    
    NSLog(@"userInfo===>%@", userInfo);
    NSLog(@"PrabhudidRegisterForRemoteNotificationsfetchCompletionHandlerUNNotificationPresentationOptionNone==>");

    [self handlePushNotificationForDict:userInfo];

    // Change this to your preferred presentation option
    completionHandler(UNNotificationPresentationOptionNone);
}

// Handle notification messages after display notification is tapped by the user.
/*- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    //    if (userInfo[kGCMMessageIDKey]) {
    //        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    //    }
    
    // Print full message.
    NSLog(@"userInfo===%@", userInfo);
    
    completionHandler();
}*/
//#ifdef __IPHONE_8_0
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:   (UIUserNotificationSettings *)notificationSettings
{
    //register to receive notifications
    [application registerForRemoteNotifications];
}

/*- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString   *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    //handle the actions
    if ([identifier isEqualToString:@"declineAction"]){
    }
    else if ([identifier isEqualToString:@"answerAction"]){
    }
}
*/

-(void)handlePushNotificationForDict:(NSDictionary*)userInfo
{
    NSLog(@"PrabhuForegrounduserInfo==> %@", userInfo);
    newPush = [userInfo mutableCopy];
//    NSLog(@"userInfo==>%@",[newPush valueForKey:@"aps"]);
    NSString * myDict ;
    NSData *data;
    id response;
    
    if (newPush!=nil) {
        if ([newPush valueForKey:@"gcm.notification.message_data"]) {
            
             myDict = [newPush valueForKey:@"gcm.notification.message_data"];
            //    NSLog(@"newPush==>%@",[myDict valueForKey:@"notification_type"]);
            data= [myDict dataUsingEncoding:NSUTF8StringEncoding];//viral
             response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//viral
            NSLog(@"MessageBody==>%@", response);
            NSLog(@"MessageType==>%@",[newPush valueForKey:@"gcm.notification.notification_type"]);
            
            if ([newPush valueForKey:@"gcm.notification.message_data"]!=nil && [newPush valueForKey:@"gcm.notification.message_data"]!=[NSNull null] )
            {
                //            NSData *data= [myDict dataUsingEncoding:NSUTF8StringEncoding];//viral
                //            id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//viral
                //            NSLog(@"MessageBody==>%@", response);
                if([newPush valueForKey:@"gcm.notification.notification_type"])
                {
                    if ([newPush valueForKey:@"gcm.notification.notification_type"]!=nil && [newPush valueForKey:@"gcm.notification.notification_type"]!=[NSNull null] )
                    {
                        if ([[newPush valueForKey:@"gcm.notification.notification_type"]isEqualToString:@"chat_notification"])
                        {
                            //[self moveToChatScreen];
                            if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive)
                            {
                                if([[newPush valueForKey:@"gcm.notification.notification_type"]isEqualToString:@"chat_notification"])
                                {
                                    if([response valueForKey:@"from_username"])
                                    {
                                        if ([response valueForKey:@"from_username"]!=nil && [response valueForKey:@"from_username"]!=[NSNull null]) {
                                            if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
                                            {
                                            }else{
                                                if (!isOnChatScreen) {
                                                    ChatVC * request = [[ChatVC alloc]init];
                                                    request.isFromChat = @"YES";
                                                    request.StrNameOtherUser = [response valueForKey:@"from_username"];
                                                    UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:request];
                                                    [self.window makeKeyAndVisible];
                                                    
                                                    [self.window.rootViewController presentViewController:navControl animated:YES completion:^{
                                                        request.isFromChat = @"YES";
                                                        request.dicOtherUserProfile = [response mutableCopy];
                                                        newPush=nil;
                                                    }];;
                                                }else{
                                                    NSLog(@"onChatScreen==>");
                                                    [[NSNotificationCenter defaultCenter] postNotificationName:@"CallwebapiforgetMessage" object:newPush];
                                                }
                                            }
                                        }
                                    }
                                }
                                
                            }else{
                              
                                if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
                                {
                                }else{
                                    [[NSNotificationCenter defaultCenter] postNotificationName:@"CallwebapiIncrementHeatrCount" object:nil];
 
                                }
                            }
                        }
                    }
                }
            }
        }else if([newPush valueForKey:@"gcm.notification.flower_data"]){
            if([[newPush valueForKey:@"gcm.notification.notification_type"]isEqualToString:@"flower_notification"]){
            if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
            {
            }else{
                if (coverViewNotification) {
                    [coverViewNotification removeFromSuperview];
                }
                if ([newPush valueForKey:@"gcm.notification.flower_data"]) {
                    
                    if ([newPush valueForKey:@"gcm.notification.flower_data"]!=nil && [newPush valueForKey:@"gcm.notification.flower_data"]!=[NSNull null] )
                    {
                        myDict = [newPush valueForKey:@"gcm.notification.flower_data"];
                        //    NSLog(@"newPush==>%@",[myDict valueForKey:@"notification_type"]);
                        data= [myDict dataUsingEncoding:NSUTF8StringEncoding];//viral
                        response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//viral
                        if (response!=nil) {
                            [self popforPushnotificationFlower:response];
                        }
                    }
                }
            }
        }
        }else if ([newPush valueForKey:@"gcm.notification.like_data"]){
            if([[newPush valueForKey:@"gcm.notification.notification_type"]isEqualToString:@"like_notification"]){
                if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
                {
                }else{
    
                    if ([newPush valueForKey:@"gcm.notification.like_data"]) {
                        
                        if ([newPush valueForKey:@"gcm.notification.like_data"]!=nil && [newPush valueForKey:@"gcm.notification.like_data"]!=[NSNull null] )
                        {
                            myDict = [newPush valueForKey:@"gcm.notification.like_data"];
                            //    NSLog(@"newPush==>%@",[myDict valueForKey:@"notification_type"]);
                            data= [myDict dataUsingEncoding:NSUTF8StringEncoding];//viral
                            response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//viral
                            if (response!=nil) {
                                if([response valueForKey:@"from_username"])
                                {
                                    if ([response valueForKey:@"from_username"]!=nil && [response valueForKey:@"from_username"]!=[NSNull null]) {
                                        if (!isOtherUserdetailScreen) {
                                            UserDetailVC * request = [[UserDetailVC alloc]init];
                                            request.isFromPush = @"YES";
                                            request.strUsername = [response valueForKey:@"from_username"];
                                            UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:request];
                                            [self.window makeKeyAndVisible];
                                            
                                            [self.window.rootViewController presentViewController:navControl animated:YES completion:^{
                                                request.isFromPush = @"YES";
                                                newPush=nil;
                                            }];;
                                        }else{
                                            //                            NSLog(@"onChatScreen==>");
                                            //                            [[NSNotificationCenter defaultCenter] postNotificationName:@"CallwebapiforgetMessage" object:newPush];
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
}
    
    
    /*if ([userInfo valueForKey:@"message"]) {
        if ([userInfo valueForKey:@"message"]!=nil && [userInfo valueForKey:@"message"]!=[NSNull null] ) {
            if([[userInfo valueForKey:@"message"]valueForKey:@"notification_type"]){
                if ([[userInfo valueForKey:@"message"]valueForKey:@"notification_type"]!=nil && [[userInfo valueForKey:@"message"]valueForKey:@"notification_type"]!=[NSNull null] ) {
                    if ([[[userInfo valueForKey:@"message"]valueForKey:@"notification_type"]isEqualToString:@"chat_notification"]) {
                        if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
                        {
                        }else{
                            [self moveToChatScreen];
                        }
                    }else if ([[[userInfo valueForKey:@"message"]valueForKey:@"notification_type"]isEqualToString:@"like_notification"]){
                        if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
                        {
                        }else{
                            [self moveToUserdetailScreen];
                        }
                    }else if ([[[userInfo valueForKey:@"message"]valueForKey:@"notification_type"]isEqualToString:@"flower_notification"]){
                        if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
                        {
                        }else{
                            if (coverViewNotification) {
                                [coverViewNotification removeFromSuperview];
                            }
                            [self popforPushnotificationFlower];
                        }
                    }
                }
            }
        }
    }*/
    //newPush =[userInfo copy];;
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

-(void)moveToUserdetailScreen {
    if (newPush != nil)
    {
        if ([newPush valueForKey:@"message"])
        {
            if([[[newPush valueForKey:@"message"]valueForKey:@"notification_type"]isEqualToString:@"like_notification"])
            {
                if([[[newPush valueForKey:@"message"]valueForKey:@"message_data"]valueForKey:@"from_username"])
                {
                    if ([[[newPush valueForKey:@"message"]valueForKey:@"message_data"]valueForKey:@"from_username"]!=nil && [[[newPush valueForKey:@"message"]valueForKey:@"message_data"]valueForKey:@"from_username"]!=[NSNull null]) {
                        if (!isOtherUserdetailScreen) {
                            UserDetailVC * request = [[UserDetailVC alloc]init];
                            request.isFromPush = @"YES";
                            request.strUsername = [[[newPush valueForKey:@"message"]valueForKey:@"message_data"]valueForKey:@"from_username"];
                            UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:request];
                            [self.window makeKeyAndVisible];
                            
                            [self.window.rootViewController presentViewController:navControl animated:YES completion:^{
                                request.isFromPush = @"YES";
                                newPush=nil;
                            }];;
                        }else{
//                            NSLog(@"onChatScreen==>");
//                            [[NSNotificationCenter defaultCenter] postNotificationName:@"CallwebapiforgetMessage" object:newPush];
                        }
                    }
                }
            }
        }
    }
}
#pragma mark - SplashScreen
#pragma mark splashscreen Method
-(void)splashOn
{
    
    if (isFromPushNotification == YES) {
        
        
        NSLog(@"userToken==%@",CURRENT_USER_ACCESS_TOKEN);
        [[NSBundle mainBundle] preferredLocalizations];
        NSString *languageSyatem = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
        
        NSLog(@"language==>%@",languageSyatem);
        
        if([CURRENT_USER_LANGUAGE isEqual:[NSNull null]] || [CURRENT_USER_LANGUAGE isEqualToString:@""] || CURRENT_USER_LANGUAGE == nil || [CURRENT_USER_LANGUAGE isEqualToString:@"(null)"])
        {
            if ([languageSyatem isEqualToString:@"es"]) {
                [TSLanguageManager setSelectedLanguage:kLMSpanish];
            }
            else{
                [TSLanguageManager setSelectedLanguage:kLMEnglish];
            }
        }else{
            if ([languageSyatem isEqualToString:@"es"]) {
                [TSLanguageManager setSelectedLanguage:kLMSpanish];
            }
            else{
                [TSLanguageManager setSelectedLanguage:kLMEnglish];
            }
        }
        
        if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
        {
            ValidateEmailVC * splash = [[ValidateEmailVC alloc] init];
            UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:splash];
            navControl.navigationBarHidden=YES;
            
            appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            appDelegate.window.rootViewController = navControl;
        }
        else
        {
            [self upDatewebserviceCalling];
            [APP_DELEGATE setUpTabBarController:@"NO"];
        }
    }else{
        splashScreen = [[SplashVC alloc] init];
        //    [self.window addSubview:splashScreen.view];
        UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:splashScreen];
        self.window.rootViewController = navControl;
    }

    // Checking user logged in or not
    /*NSLog(@"userToken==%@",CURRENT_USER_ACCESS_TOKEN);
    [[NSBundle mainBundle] preferredLocalizations];
    NSString *languageSyatem = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    NSLog(@"language==>%@",languageSyatem);
    
    if([CURRENT_USER_LANGUAGE isEqual:[NSNull null]] || [CURRENT_USER_LANGUAGE isEqualToString:@""] || CURRENT_USER_LANGUAGE == nil || [CURRENT_USER_LANGUAGE isEqualToString:@"(null)"])
    {
        if ([languageSyatem isEqualToString:@"es"]) {
            [TSLanguageManager setSelectedLanguage:kLMSpanish];
        }
        else{
            [TSLanguageManager setSelectedLanguage:kLMEnglish];
        }
    }else{
        if ([languageSyatem isEqualToString:@"es"]) {
            [TSLanguageManager setSelectedLanguage:kLMSpanish];
        }
        else{
            [TSLanguageManager setSelectedLanguage:kLMEnglish];
        }
    }
    
    if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
    {
        ValidateEmailVC * splash = [[ValidateEmailVC alloc] init];
        UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:splash];
        navControl.navigationBarHidden=YES;
        
        appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        appDelegate.window.rootViewController = navControl;
    }
    else
    {
        [self upDatewebserviceCalling];
        [APP_DELEGATE setUpTabBarController:@"NO"];
        
    }*/
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
#pragma mark - Pop up
-(void)popforPushnotificationFlower:(NSDictionary *)dicUserDeails
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    coverViewNotification = [[UIView alloc] initWithFrame:screenRect];
    coverViewNotification.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    //    [self.view addSubview:coverView];
    //coverViewNotification.backgroundColor  = [UIColor redColor];
    UIView * viewShadowWhite = [[UIView alloc]init];
    if (IS_IPHONE_4 || IS_IPHONE_5) {
        viewShadowWhite.frame = CGRectMake(15,15,coverViewNotification.frame.size.width-30, DEVICE_HEIGHT-30);
    }else{
        viewShadowWhite.frame = CGRectMake(30,30,coverViewNotification.frame.size.width-60, DEVICE_HEIGHT-60);

    }
    viewShadowWhite.backgroundColor = [UIColor whiteColor];
    viewShadowWhite.userInteractionEnabled  = YES;
    [coverViewNotification addSubview:viewShadowWhite];
    
    int yy = 40;
    
    if (IS_IPHONE_4 || IS_IPHONE_5) {
        yy = 40;
    }else{
        yy = 60;
    }
    
    UIImageView * imgFlowerIcon = [[UIImageView alloc]initWithFrame:CGRectMake((viewShadowWhite.frame.size.width/2)-(31/2), yy, 31, 50)];
    imgFlowerIcon.image = [UIImage imageNamed:@"SendFlower.png"];
    [viewShadowWhite addSubview:imgFlowerIcon];
    
    yy = yy + 60;
    
    UILabel * lblUserName = [[UILabel alloc]initWithFrame:CGRectMake(0,yy, viewShadowWhite.frame.size.width, 22)];
    [lblUserName setTextColor:merunRed];
    [lblUserName setTextAlignment:NSTextAlignmentCenter];
    [lblUserName setFont:[UIFont systemFontOfSize:20]];
    strOtherFlowerUserName = @"";
    if ([dicUserDeails valueForKey:@"from_username"]!=nil && [dicUserDeails valueForKey:@"from_username"]!=[NSNull null]) {
        strOtherFlowerUserName = [dicUserDeails valueForKey:@"from_username"];
    }
    lblUserName.text = [NSString stringWithFormat:@"@%@",strOtherFlowerUserName];
    [viewShadowWhite addSubview:lblUserName];
    
    yy = yy + 33;
    
    UILabel * lblSentYouflower = [[UILabel alloc]initWithFrame:CGRectMake(0,yy, viewShadowWhite.frame.size.width, 16)];
    [lblSentYouflower setTextColor:darkGayColor];
    [lblSentYouflower setTextAlignment:NSTextAlignmentCenter];
    [lblSentYouflower setFont:[UIFont systemFontOfSize:15]];
    lblSentYouflower.text = [TSLanguageManager localizedString:@"sent you a flower"];
    [viewShadowWhite addSubview:lblSentYouflower];
    
    UIImageView * imgBorderPushFlowe = [[UIImageView alloc]initWithFrame:CGRectMake((viewShadowWhite.frame.size.width/2)-(192/2),(viewShadowWhite.frame.size.height/2)-(192/2), 192, 192)];
    if ( IS_IPHONE_5) {
        imgBorderPushFlowe.frame = CGRectMake((viewShadowWhite.frame.size.width/2)-(160/2),(viewShadowWhite.frame.size.height/2)-(160/2), 160, 160);
    }
    if ( IS_IPHONE_4) {
        imgBorderPushFlowe.frame = CGRectMake((viewShadowWhite.frame.size.width/2)-(120/2),(viewShadowWhite.frame.size.height/2)-(120/2), 120, 120);
    }
    
    imgBorderPushFlowe.clipsToBounds=YES;
    imgBorderPushFlowe.layer.cornerRadius = imgBorderPushFlowe.frame.size.width/2;
    imgBorderPushFlowe.layer.masksToBounds = NO;
    imgBorderPushFlowe.backgroundColor = [UIColor whiteColor];
    imgBorderPushFlowe.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgBorderPushFlowe.layer.shadowRadius = 6.0;
    imgBorderPushFlowe.layer.shadowOpacity = 0.4;
    [viewShadowWhite addSubview:imgBorderPushFlowe];
    
    UIImageView * imgProfilePushFlower = [[UIImageView alloc]initWithFrame:CGRectMake((viewShadowWhite.frame.size.width/2)-(172/2),(viewShadowWhite.frame.size.height/2)-(172/2), 172, 172)];
    if ( IS_IPHONE_5) {
        imgProfilePushFlower.frame = CGRectMake((viewShadowWhite.frame.size.width/2)-(140/2),(viewShadowWhite.frame.size.height/2)-(140/2), 140, 140);
    }
    
  else if (IS_IPHONE_4) {
          imgProfilePushFlower.frame = CGRectMake((viewShadowWhite.frame.size.width/2)-(100/2),(viewShadowWhite.frame.size.height/2)-(100/2), 100, 100);
    }
    imgProfilePushFlower.clipsToBounds=YES;
    imgProfilePushFlower.layer.cornerRadius = imgProfilePushFlower.frame.size.width/2;
    [imgProfilePushFlower setContentMode:UIViewContentModeScaleAspectFill];
    imgProfilePushFlower.backgroundColor = violetgreenColor;
    [viewShadowWhite addSubview:imgProfilePushFlower];
    
//    NSString * strGender = @"";
//    
//    if ([dicUserDeails valueForKey:@"gender"]!=nil && [dicUserDeails valueForKey:@"gender"]!=[NSNull null]) {
//        strGender = [dicUserDeails valueForKey:@"gender"];
//    }
//    if ([strGender isEqualToString:@"F"]) {
//        imgBorderPushFlowe.image = [UIImage imageNamed:@"female-circle.png"];
//    }
//    else {
//        imgBorderPushFlowe.image = [UIImage imageNamed:@"male-circle.png"];
//    }
    if ([dicUserDeails valueForKey:@"from_user_image"]!=nil && [dicUserDeails valueForKey:@"from_user_image"]!=[NSNull null] && ![[dicUserDeails valueForKey:@"from_user_image"]isEqualToString:@""]){
        NSString * strPhoto = [dicUserDeails valueForKey:@"from_user_image"];
        //        imgProfile.imageURL = [NSURL URLWithString:strPhoto];
//        if ([strGender isEqualToString:@"F"])
//        {
            [imgProfilePushFlower setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
//        }else{
//            [imgProfilePushFlower setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
//        }
        
    }else{
//        if ([strGender isEqualToString:@"F"])
//        {
//            imgProfilePushFlower.image = [UIImage imageNamed:@"female_avtar.png"];
//        }
//        else
//        {
            imgProfilePushFlower.image = [UIImage imageNamed:@"male_avtar.png"];
        //}
    }
    
    
    
    UILabel * lblMessageFlowerPush = [[UILabel alloc]initWithFrame:CGRectMake(20,imgBorderPushFlowe.frame.origin.y+imgBorderPushFlowe.frame.size.height+5, viewShadowWhite.frame.size.width-40, 130)];
    lblMessageFlowerPush.numberOfLines = 0;
    lblMessageFlowerPush.textColor = darkGayColor;
    lblMessageFlowerPush.backgroundColor = [UIColor clearColor];
    lblMessageFlowerPush.text = @"";
    
    lblMessageFlowerPush.textAlignment = NSTextAlignmentCenter;
    [viewShadowWhite addSubview:lblMessageFlowerPush];
//    [NSString stringWithFormat:@"@%@ %@",strOtherFlowerUserName,[TSLanguageManager localizedString:@"has seen something different in you, and this flower it is call to chat and get to know each other better.Would you accepet"]]
     if ([dicUserDeails valueForKey:@"from_user_description"]!=nil && [dicUserDeails valueForKey:@"from_user_description"]!=[NSNull null] && ![[dicUserDeails valueForKey:@"from_user_description"]isEqualToString:@""]){
         lblMessageFlowerPush.text = [dicUserDeails valueForKey:@"from_user_description"];
     }
    int widthviewWhite = viewShadowWhite.frame.size.width/2;
    
    UIButton *btnPushFlowerPopOkClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPushFlowerPopOkClick.frame = CGRectMake(5,viewShadowWhite.frame.size.height-55, widthviewWhite-10,35);
    [btnPushFlowerPopOkClick setTitle:[TSLanguageManager localizedString:@"Yes"] forState:UIControlStateNormal];
    [btnPushFlowerPopOkClick setBackgroundColor:violetgreenColor];
    btnPushFlowerPopOkClick.layer.cornerRadius = 5.0;
    [btnPushFlowerPopOkClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnPushFlowerPopOkClick.clipsToBounds = YES;
    [btnPushFlowerPopOkClick addTarget:self action:@selector(btnPushFlowerPopOkClick:) forControlEvents:UIControlEventTouchUpInside];
    btnPushFlowerPopOkClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewShadowWhite addSubview:btnPushFlowerPopOkClick];
    
    UIButton *  btnPushFlowerPopCancelClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPushFlowerPopCancelClick.frame = CGRectMake(widthviewWhite+5,viewShadowWhite.frame.size.height-55, widthviewWhite-10,35);
    [btnPushFlowerPopCancelClick setTitle:[TSLanguageManager localizedString:@"Later"] forState:UIControlStateNormal];
    [btnPushFlowerPopCancelClick setBackgroundColor:darkGayColor];
    btnPushFlowerPopCancelClick.layer.cornerRadius = 5.0;
    [btnPushFlowerPopCancelClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnPushFlowerPopCancelClick.clipsToBounds = YES;
    [btnPushFlowerPopCancelClick addTarget:self action:@selector(btnPushFlowerPopCancelClick:) forControlEvents:UIControlEventTouchUpInside];
    btnPushFlowerPopCancelClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewShadowWhite addSubview:btnPushFlowerPopCancelClick];
    
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((DEVICE_WIDTH/2)-(30/2), (DEVICE_HEIGHT/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicator.color = violetgreenColor;;
    [_window addSubview:placeActivityIndicator];
    
    [_window addSubview:coverViewNotification];
}


#pragma mark - Webapicalling
-(void)unreadcount
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:@"piropazo unread" forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"unreadMessages";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}
-(void)CallWebapiForLogout {
    //isForCrashLogout = YES;

    if (IsPopAvialabecrashLogout == YES) {
        
    }else{
        
       alertViewForlogout = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Your account is in use in another device. Please logout first."] cancelButtonTitle:OK_BTN otherButtonTitles:nil, nil];
        IsPopAvialabecrashLogout = YES;
        [alertViewForlogout setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertViewForlogout setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
                if (buttonIndex == 0) {
                    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
                    if (isNetAvaliable == NO)
                    {
                    }else{
                        
                        IsPopAvialabecrashLogout = NO;
                        NSString * webServiceName = @"api/logout";
                        
                        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
                        
                        if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
                        {
                            [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
                        }
                        else
                        {
                            [parameter_dict setObject:@"" forKey:@"token"];
                        }
                        
                        URLManager *manager = [[URLManager alloc] init];
                        manager.delegate = self;
                        manager.commandName = @"Logout";
                        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
                    }
                }
            }];
        }];
        [alertViewForlogout showWithAnimation:Alert_Animation_Type]; 
    }
    
   
    
}
-(void)upDatewebserviceCalling
{
    NSString * webServiceName = @"run/api";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    
    [parameter_dict setObject:@"piropazo profile" forKey:@"subject"];
    [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"GettingPeopels";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}
-(void)btnPushFlowerPopOkClick:(id)sender {
    [coverViewNotification removeFromSuperview];
    
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [placeActivityIndicator startAnimating];
        NSString * strRight = [NSString stringWithFormat:@"piropazo si @%@",strOtherFlowerUserName];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strRight forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"YestoPeopel";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }

}
-(void)btnPushFlowerPopCancelClick:(id)sender {
    [coverViewNotification removeFromSuperview];
}

#pragma mark Response
- (void)onResult:(NSDictionary *)result
{
    NSLog(@"Result==%@",result);
    [placeActivityIndicator stopAnimating];
    [placeActivityIndicator removeFromSuperview];

    if([[result valueForKey:@"commandName"] isEqualToString:@"unreadMessages"])
    {
        NSLog(@"Inside==>");
        [arrUnreadTotalCount removeAllObjects];

        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if ([[result valueForKey:@"result"] valueForKey:@"items"]!=nil && [[result valueForKey:@"result"] valueForKey:@"items"]!=[NSNull null]) {
                arrUnreadTotalCount = [[result valueForKey:@"result"] valueForKey:@"items"];
            }
        }
    }else if ([[result valueForKey:@"commandName"] isEqualToString:@"Logout"]){
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSLog(@"logout==>");
            deviceTokenStr = @"";

            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CURRENT_USER_ACCESS_TOKEN"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CURRENT_USER_EMAIL"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"NEW_USER_STATUS"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"GENDER_STATUS"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USER_IMAGE"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CURRENT_USER_FIRST_NAME"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            ValidateEmailVC * splash = [[ValidateEmailVC alloc] init];
            UINavigationController * navControl = [[UINavigationController alloc] initWithRootViewController:splash];
            navControl.navigationBarHidden=YES;
            appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            appDelegate.window.rootViewController = navControl;
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"GettingPeopels"]){
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            
            if([[result valueForKey:@"result"] valueForKey:@"profile"])
            {
                NSMutableDictionary * dicDetails = [[NSMutableDictionary alloc]init];
                
                if ([[result valueForKey:@"result"] valueForKey:@"profile"]!=nil && [[result valueForKey:@"result"] valueForKey:@"profile"]!=[NSNull null]) {
                    dicDetails = [[result valueForKey:@"result"] valueForKey:@"profile"];
                }
                
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                
                NSString * strGender = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"gender"]];
                
                NSString * strImage = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"picture_public"]];
                
                NSString * strUserName = [NSString stringWithFormat:@"%@",[dicDetails valueForKey:@"username"]];
                
                if (strUserName!=nil && ![strUserName isEqualToString:@"(null)"] ) {
                    [userDefaults setObject:strUserName forKey:@"CURRENT_USER_FIRST_NAME"];
                }
                else{
                    [userDefaults setObject:@"" forKey:@"CURRENT_USER_FIRST_NAME"];
                }
                
                
                if (strGender!=nil && ![strGender isEqualToString:@"(null)"] ) {
                    [userDefaults setObject:strGender forKey:@"GENDER_STATUS"];
                }
                else{
                    [userDefaults setObject:@"" forKey:@"GENDER_STATUS"];
                }
                
                if (strImage!=nil && ![strImage isEqualToString:@"(null)"] ) {
                    [userDefaults setObject:strImage forKey:@"USER_IMAGE"];
                }
                else{
                    [userDefaults setObject:@"" forKey:@"USER_IMAGE"];
                }
                
                [userDefaults synchronize];
            }
        }
        else if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"error"])
        {
//            if(isForCrashLogout){
//                
//            }else{
                [self CallWebapiForLogout];
            //}
        }
    }else if ([[result valueForKey:@"commandName"] isEqualToString:@"YestoPeopel"])
    { if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
     {
         NSLog(@"Accepted=========");
         [[NSNotificationCenter defaultCenter] postNotificationName:@"RefreshScreen" object:nil];

     }
    }
}
- (void)onError:(NSError *)error
{
    [placeActivityIndicator stopAnimating];
    [placeActivityIndicator removeFromSuperview];


    NSLog(@"The error is...%@", error);
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
            
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[NSString stringWithFormat:@"%@", [TSLanguageManager localizedString:@"Please check internet connection!"]] cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
   /* if( (0 != [email rangeOfString:@"@"].length) &&  (0 != [email rangeOfString:@"."].length) )
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
    }*/
    
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
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
