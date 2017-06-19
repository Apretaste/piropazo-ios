//
//  HomeVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDCSwipeToChooseView.h"
#import "MDCSwipeToChoose.h"
#import "ChoosePersonView.h"
#import "AppDelegate.h"
#import "UserDetailVC.h"
#import "MDCSwipeResult.h"
@class AppDelegate;

@interface HomeVC : UIViewController<MDCSwipeToChooseDelegate,UIScrollViewDelegate,URLManagerDelegate>
{
    UIImageView * navview;
    UILabel * lblError;
    
    ChoosePersonView *personView;
    
    ChoosePersonView *firstCardView;
    ChoosePersonView *secondCardView;
    ChoosePersonView *thirdCardView;
    
    UIView * viewCardContainer;

   // NSMutableArray * arrayPersons;
    NSMutableArray * arrCountry;
    
    UIImageView * imgBack;
    
    NSInteger selectedIndex;
    UIActivityIndicatorView * placeActivityIndicator;
    
    AppDelegate * appDelegate;
    
    UIScrollView * scrlContentInfo;
    
    UIView * viewInfo;
    
    UIPageControl *pageControl;
    UIButton *BtnNext;
    
    NSMutableArray * arrayPeople;
    NSMutableArray * tempArray;
    
    NSString * strLeftSideUserName;
    NSString * strRightSideUserName;
    
    UILabel * lblStatus;
    
    BOOL Edit;
 
}
@property(nonatomic,strong)NSString*strFirst;
@end
