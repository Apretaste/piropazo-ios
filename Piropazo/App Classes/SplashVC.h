//
//  SplashVC.h
//  DatingApp
//
//  Created by Lubhna Shirvastava on 09/05/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@class AppDelegate;

@interface SplashVC : UIViewController<URLManagerDelegate>
{
    AppDelegate * appDelegate;

    NSMutableArray *arrRandomtext;
    
    NSTimer * timerSplash;
    
    NSMutableArray * tempArray;

}
@end
