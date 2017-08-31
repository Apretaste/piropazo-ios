//
//  MyMatchesVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFCollectionViewFlowLargeLayout.h"
#import "AFCollectionViewCell.h"
#import "EditProfileVC.h"
#import "UserDetailVC.h"
#import "ChatVC.h"
#import "StoreVC.h";
@interface MyMatchesVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,URLManagerDelegate>
{
    
    UIImageView * imgUnreadMessageCount;
    UILabel * lblUnreadCount;
    
    UIImageView * navview;
    
    UILabel * lblError;
    UILabel * lblStatus;
    
    AppDelegate * appDelegate;
    
    UICollectionView *_collectionView;

    UIView * viewTransperent;
    
    NSMutableArray * arrayGetMatchesFilter;
    NSMutableArray * arrayTempFlowerFilter;
    NSMutableArray * arrayTempYesFilter;
    NSMutableArray * arrayTempMatchFilter;

    NSMutableArray * arrayGetMatches;
    NSMutableArray * arrayUnreadMatches;
    NSMutableArray * arrayTempGetMatches;
    NSMutableArray * arrayTempFlower;
    NSMutableArray * arrayTempYespeople;
    NSMutableArray * arrayTempMessagePeople;
    
    NSString * strTempGetMatches;
    NSString * strTempFloweCount;
    NSString * strTempYespeople;
    NSString * strTempMessagePeople;

    UIActivityIndicatorView * placeActivityIndicator;
    UIActivityIndicatorView * placeActivityIndicatorCancel;
    UIActivityIndicatorView * placeActivityIndicatorFlower;
    
    UIView * viewTransperentCancel;
    UILabel * lblMessageCancel;
    
    UIView * viewTransperentFlower;
    UILabel * lblMessageFlower;
    
    UIView * viewTransperentForNoFlower;
    UILabel * lblMessageNOFlower;
    
    
    UIImageView * imgCancelOtheruserBorder;
    UIImageView * imgCancelOtheruser;
    UIImageView * imgCanceluserBorder;
    UIImageView * imgCanceluser;
    UIImageView * imgBack;
    
    UIImageView * imgFlowerOtheruserBorder;
    UIImageView *  imgFlowerOtheruser;
    
    UIButton * btnCancelPopOkClick;
    UIButton * btnCancelPopCancelClick;
    
    NSInteger widthview;
    
    NSString *stringOthePersonname;
    
    UIView* viewFromBottom ;
    UIButton* btnFilter;
    
    UIView* coverViewNotification;
    UIView * viewShadow2ForViewTransparet;

    BOOL allClicked;
    BOOL FloweClicekd;
    BOOL yesTopeopleClicked;
    BOOL messageClicked;
}

@property (nonatomic, strong) AFCollectionViewFlowLargeLayout *largeLayout;


@end
