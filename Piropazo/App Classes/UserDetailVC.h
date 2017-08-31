//
//  UserDetailVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface UserDetailVC : UIViewController<URLManagerDelegate>
{
    
    UIActivityIndicatorView * placeActivityIndicator;
    
    UIImageView * navview;
    UIImageView * imgBack;
    UIImageView * imgBorder;
    UIImageView * imgProfile;

    UIScrollView * scrlContent;
    
    UIView * viewTransperent;
    
//    NSMutableArray * arrofColors;
    
    UILabel * lblStatus;
    
    NSMutableArray * arrColors;
    
//    AppDelegate * appDelegate;
}
@property(nonatomic,strong)NSString * strUsername;
@property(nonatomic,strong)NSString * isFromPush;
@property(nonatomic,strong)NSString * isFromMatchesandChat;


@end
