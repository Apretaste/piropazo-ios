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
@interface MyMatchesVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,URLManagerDelegate>
{
    UIImageView * navview;
    
    UILabel * lblError;
    
    AppDelegate * appDelegate;
    
    UICollectionView *_collectionView;

    UIView * viewTransperent;
    
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
    
    UIImageView * imgCancelOtheruserBorder;
    UIImageView * imgCancelOtheruser;
    UIImageView * imgCanceluserBorder;
    UIImageView * imgCanceluser;
    
    UIImageView * imgFlowerOtheruserBorder;
    UIImageView *  imgFlowerOtheruser;
    
    UIButton * btnCancelPopOkClick;
    UIButton * btnCancelPopCancelClick;
    
    NSInteger widthview;
    
    NSString *stringOthePersonname;
    
    UIView* viewFromBottom ;
    UIButton* btnFilter;
    
    BOOL allClicked;
    BOOL FloweClicekd;
    BOOL yesTopeopleClicked;
    BOOL messageClicked;
}

@property (nonatomic, strong) AFCollectionViewFlowLargeLayout *largeLayout;


@end
