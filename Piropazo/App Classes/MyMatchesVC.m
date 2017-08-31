//
//  MyMatchesVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "MyMatchesVC.h"

@interface MyMatchesVC ()

@end
static NSString *ItemIdentifier = @"ItemIdentifier";

@implementation MyMatchesVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    changeLanguage = NO;
    arrayGetMatches = [[NSMutableArray alloc]init];
    arrayUnreadMatches = [[NSMutableArray alloc]init];
    arrayTempFlower = [[NSMutableArray alloc]init];
    arrayTempYespeople = [[NSMutableArray alloc]init];
    arrayTempMessagePeople = [[NSMutableArray alloc]init];
    arrayTempGetMatches = [[NSMutableArray alloc]init];
    arrayGetMatchesFilter = [[NSMutableArray alloc]init];
    arrayTempFlowerFilter = [[NSMutableArray alloc]init];
    arrayTempYesFilter = [[NSMutableArray alloc]init];
    arrayTempMatchFilter = [[NSMutableArray alloc]init];
    
         [self setFrame];
    [self SetNavigationbar];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"RefreshScreen" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(RefreshMatches)
                                                 name:@"RefreshScreen"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CallwebapiIncrementHeatrCount" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(CallwebapiIncrementHeatrCount)
                                                 name:@"CallwebapiIncrementHeatrCount"
                                               object:nil];

}
-(void)viewWillAppear:(BOOL)animated {
    
//    NSLog(@"GENDER_STATUS==>%@",GENDER_STATUS);
//    NSLog(@"USER_IMAGE==>%@",USER_IMAGE);
    allClicked = NO;
    FloweClicekd = NO;
    yesTopeopleClicked = NO;
    messageClicked = NO;
    

    imgUnreadMessageCount = [[UIImageView alloc]initWithFrame:CGRectMake((DEVICE_WIDTH/2), DEVICE_HEIGHT-49, 35, 25)];
    imgUnreadMessageCount.image = [UIImage imageNamed:@"chat-notification.png"];
    imgUnreadMessageCount.hidden = YES;
    [[appDelegate window] addSubview:imgUnreadMessageCount];
    
    lblUnreadCount = [[UILabel alloc]init];
    lblUnreadCount.hidden = YES;
    lblUnreadCount.frame = CGRectMake((DEVICE_WIDTH/2), DEVICE_HEIGHT-51, 35, 25);
    lblUnreadCount.textColor = [UIColor whiteColor];
    lblUnreadCount.font = [UIFont boldSystemFontOfSize:18];
    lblUnreadCount.textAlignment = NSTextAlignmentCenter;
    //lblUnreadCount.frame = imgUnreadMessageCount.frame;
    [[appDelegate window] addSubview:lblUnreadCount];
    
//    if ([arrUnreadTotalCount count]>0) {
//        NSLog(@"arrUnreadTotalCount%@",arrUnreadTotalCount);
//        imgUnreadMessageCount.hidden = NO;
//        lblUnreadCount.hidden = NO;
//        
//        lblUnreadCount.text = [NSString stringWithFormat:@"%lu",[arrUnreadTotalCount count]];
//    }
//    else{
//        imgUnreadMessageCount.hidden = YES;
//        lblUnreadCount.hidden = YES;
//        
//    }
    [self unreadcount];
    [self ShowtransperentForCancel];
    [self ShowtransperentForFlower];
    [self ShowtransperentForIfnoFlowers];
    
    
    btnFilter = [[UIButton alloc]initWithFrame:CGRectMake(viewTransperent.frame.size.width-60, viewTransperent.frame.size.height-60, 42, 42)];
    [btnFilter setImage:[UIImage imageNamed:@"all_icon_selected.png"] forState:UIControlStateNormal];
    btnFilter.hidden = YES;
    btnFilter.layer.masksToBounds = NO;
    btnFilter.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    btnFilter.layer.shadowOffset = CGSizeZero;
    btnFilter.layer.shadowRadius = 1.0f;
    btnFilter.layer.shadowOpacity = 1.0f;
    [btnFilter addTarget:self action:@selector(btnFilterClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewShadow2ForViewTransparet addSubview:btnFilter];
    
    
    lblStatus = [[UILabel alloc]initWithFrame:CGRectMake(80, imgBack.frame.size.height-50,imgBack.frame.size.width-160, 40)];
    if (IS_IPHONE_5 || IS_IPHONE_4)
    {
        lblStatus.frame = CGRectMake(40, imgBack.frame.size.height-50,imgBack.frame.size.width-80, 40);
    }
    lblStatus.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    lblStatus.textColor = [UIColor whiteColor];
    lblStatus.textAlignment = NSTextAlignmentCenter;
    lblStatus.hidden = YES;
    lblStatus.layer.masksToBounds = YES;
    lblStatus.opaque =YES;
    //lblStatus.layer.al
    lblStatus.layer.cornerRadius = 8.0;
    [imgBack addSubview:lblStatus];
    
    [APP_DELEGATE showTabBar:self.tabBarController];
    [self CallwebServiceForGetmatches];
}
-(void)RefreshMatches
{
    [self CallwebServiceForGetmatches];
}
-(void)CallwebapiIncrementHeatrCount{
    [self unreadcount];
    [self CallwebServiceForUnredIndivisulaCount];
}
-(void)viewWillDisappear:(BOOL)animated {
    imgUnreadMessageCount.hidden = YES;
    lblUnreadCount.hidden = YES;
    [imgUnreadMessageCount removeFromSuperview];
    [lblUnreadCount removeFromSuperview];
}

-(void)viewDidDisappear:(BOOL)animated{
    [imgUnreadMessageCount removeFromSuperview];
    [lblUnreadCount removeFromSuperview];
    
    FloweClicekd = NO;
    yesTopeopleClicked = NO;
    messageClicked = NO;
    [btnFilter setImage:[UIImage imageNamed:@"all_icon_selected.png"] forState:UIControlStateNormal];
}
#pragma mark - Navigation Frame
-(void)SetNavigationbar {
    navview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 64)];
    navview.backgroundColor =navigationBackgroundcolor;
    navview.userInteractionEnabled=YES;
    // *** Set masks bounds to NO to display shadow visible ***
    navview.layer.masksToBounds = NO;
    // *** Set light gray color as shown in sample ***
    navview.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    // *** *** Use following to add Shadow top, left ***
    //    self.avatarImageView.layer.shadowOffset = CGSizeMake(-5.0f, -5.0f);
    
    // *** Use following to add Shadow bottom, right ***
    navview.layer.shadowOffset = CGSizeMake(5.0f, 0.0f);
    
    // *** Use following to add Shadow top, left, bottom, right ***
    // avatarImageView.layer.shadowOffset = CGSizeZero;
    navview.layer.shadowRadius = 5.0f;
    
    // *** Set shadowOpacity to full (1) ***
    navview.layer.shadowOpacity = 1.0f;
    [self.view addSubview:navview];
    
    UIImageView * imgLogo = [[UIImageView alloc]initWithFrame:CGRectMake((DEVICE_WIDTH/2)-(114/2), (64/2)-(24/7), 114, 27)];
    imgLogo.image = [UIImage imageNamed:Navigationlogo];
    [navview addSubview:imgLogo];
}
#pragma mark - buttonClicked
-(void)btnuserClicked:(id)sender
{
    EditProfileVC * edit = [[EditProfileVC alloc]init];
    edit.strisFrom = @"YES";
    [self.navigationController pushViewController:edit animated:YES];
}
-(void)btnOtheruserClicked:(id)sender
{
    UserDetailVC * user = [[UserDetailVC alloc]init];
    if ([arrayGetMatches count]>0) {
        user.strUsername =  [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"];
        user.isFromMatchesandChat = @"YES";
        [self.navigationController pushViewController:user animated:YES];
    }
}
-(void)btnAccepetClicked:(id)sender
{
    NSString * strName = @"";
    if ([[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"]!=nil && [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"]!=[NSNull null]) {
        strName = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"];
    }
    
    [self CallwebServiceYestoPeopel:strName];
}
-(void)btnCahticonClicked:(id)sender
{
    ChatVC * chat = [[ChatVC alloc]init];
    if ([arrayGetMatches count]>0) {
        chat.dicUserdetails = [arrayGetMatches objectAtIndex:[sender tag]];
        chat.StrNameOtherUser = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"];
    }
    [self.navigationController pushViewController:chat animated:YES];
    
//        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Work in progress.." cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
//        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
//        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//            [alertView hideWithCompletionBlock:^{
//    
//            }];
//        }];
//        [alertView showWithAnimation:URBAlertAnimationTopToBottom];
}
-(void)btnCancelClicked:(id)sender
{
    if ([arrayGetMatches count]>0) {
//        NSString * strOtherimage = [arr]
        NSString * strGender = @"";
        NSString * strimage = @"";
        NSString * strName = @"";
        
        imgCanceluserBorder.frame = CGRectMake(widthview-120,lblMessageCancel.frame.origin.y-130,110, 110);
        
        imgCanceluser.frame = CGRectMake(widthview-118,lblMessageCancel.frame.origin.y-128,106, 106);
        
        imgCancelOtheruser.frame = CGRectMake(widthview+12,lblMessageCancel.frame.origin.y-128, 106, 106);
        imgCancelOtheruserBorder.frame = CGRectMake(widthview+10,lblMessageCancel.frame.origin.y-130, 110, 110);

        
        lblMessageCancel.hidden = NO;
        btnCancelPopCancelClick.hidden = NO;
        btnCancelPopOkClick.hidden = NO;
        lblMessageCancel.font = [UIFont systemFontOfSize:13.0];
        if ([[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"gender"]!=nil && [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"gender"]!=[NSNull null]) {
            strGender = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"gender"];
        }
        
        if ([[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"picture_public"]!=nil && [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"picture_public"]!=[NSNull null]) {
            strimage = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"picture_public"];
        }
        
        if ([[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"]!=nil && [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"]!=[NSNull null]) {
            strName = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"];
        }
        
        [self cancelPopWithdata:strimage strOtheruserName:strName otheruserGender:strGender];

    }
}
-(void)btnFlowerClicked:(id)sender
{
    if ([arrayGetMatches count]>0) {
        //        NSString * strOtherimage = [arr]
        NSString * strGender = @"";
        NSString * strimage = @"";
        NSString * strName = @"";
        if ([[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"gender"]!=nil && [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"gender"]!=[NSNull null]) {
            strGender = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"gender"];
        }
        
        if ([[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"picture_public"]!=nil && [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"picture_public"]!=[NSNull null]) {
            strimage = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"picture_public"];
        }
        
        if ([[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"]!=nil && [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"]!=[NSNull null]) {
            strName = [[arrayGetMatches objectAtIndex:[sender tag]]valueForKey:@"username"];
        }
        [self FlowerPopWithdata:strimage strOtheruserName:strName otheruserGender:strGender];
    }
}

-(void)btnCancelPopOkClick:(id)sender
{
    btnCancelPopOkClick.hidden = YES;
    btnCancelPopCancelClick.hidden = YES;
    lblMessageCancel.hidden = NO;
    lblMessageCancel.text = [TSLanguageManager localizedString:@"Unmatch"];
    lblMessageCancel.font = [UIFont boldSystemFontOfSize:16];
    lblMessageCancel.textColor = darkGayColor;
    
   [ UIView transitionWithView:imgCancelOtheruser
 duration:1.0f
 options:UIViewAnimationOptionAllowUserInteraction+UIViewAnimationOptionCurveLinear
 animations:^{
    imgCanceluser.frame = CGRectMake(viewTransperentCancel.frame.origin.x-imgCanceluser.frame.size.width, imgCanceluser.frame.origin.y, imgCanceluser.frame.size.width, imgCanceluser.frame.size.height);
//         UIVisualEffectView.effect = blurEffect;
     imgCanceluserBorder.frame = CGRectMake(viewTransperentCancel.frame.origin.x-imgCanceluserBorder.frame.size.width, imgCanceluserBorder.frame.origin.y, imgCanceluserBorder.frame.size.width, imgCanceluserBorder.frame.size.height);
     
//     CALayer *layer = [self.blurView layer];
//     [layer setRasterizationScale:0.3];
//     [layer setShouldRasterize:YES]
     
     imgCancelOtheruser.frame = CGRectMake(viewTransperentCancel.frame.size.width, imgCancelOtheruser.frame.origin.y, imgCancelOtheruser.frame.size.width, imgCancelOtheruser.frame.size.height);
     imgCancelOtheruserBorder.frame =  CGRectMake(viewTransperentCancel.frame.size.width, imgCancelOtheruserBorder.frame.origin.y, imgCancelOtheruserBorder.frame.size.width, imgCanceluser.frame.size.height);
     
 }completion:^(BOOL finished){
     [self CallwebServiceNotoPeopel:@""];
     viewTransperentCancel.hidden = YES;
 }];
    
}
-(void)btnCancelPopCancelClick:(id)sender
{
    viewTransperentCancel.hidden = YES;
}
-(void)btnFlowerPopOkClick:(id)sender
{
    [self callwebServiceForSenFlower];
    
    viewTransperentFlower.hidden = YES;

}
-(void)btnFlowerPopCancelClick:(id)sender
{
    viewTransperentFlower.hidden =YES;
}
-(void)btnFilterClicked:(id)Sender
{
      [self viewAnimation];
    //[self popforPushnotificationFlower];
    //[self popforApprating];
}

-(void)cencelButtonClicked:(id)Sender
{
    [self viewDidAnimation];
}

#pragma mark - Frame Settings
-(void)setFrame {
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64-49)];
    imgBack.userInteractionEnabled = YES;
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
    
    
    viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(10, 10, imgBack.frame.size.width-20,imgBack.frame.size.height-20)];
    viewTransperent.backgroundColor = [UIColor clearColor];
//    viewTransperent.alpha = 0.9;
    viewTransperent.userInteractionEnabled  = YES;
    viewTransperent.layer.cornerRadius = 5;
//    viewTransperent.clipsToBounds = YES;
//    viewTransperent.layer.shadowColor = [UIColor grayColor].CGColor;
//    viewTransperent.layer.shadowOffset = CGSizeMake(3, 3);
//    viewTransperent.layer.shadowOpacity = 5.0;
//    viewTransperent.layer.shadowRadius = 5.0;
    [imgBack addSubview:viewTransperent];
    
    UIView * viewShadow = [[UIView alloc]init];
    viewShadow.backgroundColor = [UIColor whiteColor];
    viewShadow.hidden = YES;
    [viewShadow setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    viewShadow.userInteractionEnabled  = YES;
    viewShadow.layer.cornerRadius = 5;
    viewShadow.clipsToBounds = YES;
    viewShadow.layer.shadowColor = [UIColor grayColor].CGColor;
    viewShadow.layer.shadowOffset = CGSizeMake(3, 3);
    viewShadow.layer.shadowOpacity = 5.0;
    viewShadow.layer.shadowRadius = 5.0;
    viewShadow.frame = viewTransperent.frame;
    viewShadow.backgroundColor = [UIColor whiteColor];
    [imgBack addSubview:viewShadow];
    
    viewShadow2ForViewTransparet= [[UIView alloc]init];
    viewShadow2ForViewTransparet.frame = viewTransperent.frame;
    viewShadow2ForViewTransparet.userInteractionEnabled  = YES;
    viewShadow2ForViewTransparet.layer.cornerRadius = 5;
    viewShadow2ForViewTransparet.backgroundColor = [UIColor whiteColor];
    [viewShadow2ForViewTransparet setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    [imgBack addSubview:viewShadow2ForViewTransparet];
    
    
    lblError  = [[UILabel alloc] initWithFrame:CGRectMake(0,(viewTransperent.frame.size.height)/2-(20/2), viewTransperent.frame.size.width, 20)];
    lblError.text = [TSLanguageManager localizedString:@"No Matches Available"];
    lblError.font = [UIFont boldSystemFontOfSize:15.0];
    lblError.textColor = [UIColor blackColor];
    lblError.textAlignment=NSTextAlignmentCenter;
    [viewShadow2ForViewTransparet addSubview:lblError];
    lblError.hidden=YES;
    
    self.largeLayout = nil;
    
    self.largeLayout = [[AFCollectionViewFlowLargeLayout alloc] init];
    // UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    //    [layout setItemSize:CGSizeMake(191, 160)];
    //    layout.minimumInteritemSpacing = 0.0f;
    [_collectionView removeFromSuperview];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(5, 5, viewTransperent.frame.size.width-10, viewTransperent.frame.size.height-10) collectionViewLayout:self.largeLayout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass:[AFCollectionViewCell class] forCellWithReuseIdentifier:ItemIdentifier];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    [viewShadow2ForViewTransparet addSubview:_collectionView];
    
    
    
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((imgBack.frame.size.width/2)-(30/2), (imgBack.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicator.color = violetgreenColor;;
    [imgBack addSubview:placeActivityIndicator];
    
}
-(void)ShowtransperentForCancel
{
    
    viewTransperentCancel = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
    viewTransperentCancel.backgroundColor = [UIColor clearColor];
    viewTransperentCancel.hidden = YES;
    
    placeActivityIndicatorCancel = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((viewTransperentCancel.frame.size.width/2)-(30/2), (viewTransperentCancel.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicatorCancel setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicatorCancel.color = violetgreenColor;;
    [viewTransperentCancel addSubview:placeActivityIndicatorCancel];

    UIView * viewShadow = [[UIView alloc]init];
    viewShadow.backgroundColor = [UIColor whiteColor];
    viewShadow.hidden = YES;
    [viewShadow setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    viewShadow.userInteractionEnabled  = YES;
    viewShadow.layer.cornerRadius = 5;
    viewShadow.clipsToBounds = YES;
    viewShadow.layer.shadowColor = [UIColor grayColor].CGColor;
    viewShadow.layer.shadowOffset = CGSizeMake(3, 3);
    viewShadow.layer.shadowOpacity = 5.0;
    viewShadow.layer.shadowRadius = 5.0;
    viewShadow.frame = viewShadow.frame;
    viewShadow.backgroundColor = [UIColor whiteColor];
    [viewTransperentCancel addSubview:viewShadow];
    
    UIView * viewShadow2= [[UIView alloc]init];
    viewShadow2.frame = viewTransperentCancel.frame;
    viewShadow2.backgroundColor = [UIColor whiteColor];
    [viewShadow2 setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    [viewTransperentCancel addSubview:viewShadow2];

    
    lblMessageCancel = [[UILabel alloc]initWithFrame:CGRectMake(20,( viewTransperentCancel.frame.size.height/2)-(100/2), viewTransperentCancel.frame.size.width-40, 100)];
    lblMessageCancel.numberOfLines = 0;
    lblMessageCancel.textColor = darkGayColor;
    lblMessageCancel.backgroundColor = [UIColor clearColor];
    lblMessageCancel.text = @"";
    lblMessageCancel.textAlignment = NSTextAlignmentCenter;
    [viewTransperentCancel addSubview:lblMessageCancel];
    
    widthview = viewTransperentCancel.frame.size.width/2;
    
    btnCancelPopOkClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancelPopOkClick.frame = CGRectMake(5,lblMessageCancel.frame.origin.y+lblMessageCancel.frame.size.height+5, widthview-10,35);
    [btnCancelPopOkClick setTitle:[TSLanguageManager localizedString:@"Unmatch"] forState:UIControlStateNormal];
    //    [btnFlowerClick setBackgroundImage:[APP_DELEGATE colorWithHexString:violetgreenColor] forState:UIControlStateNormal];
    [btnCancelPopOkClick setBackgroundColor:violetgreenColor];
    btnCancelPopOkClick.layer.cornerRadius = 5.0;
    [btnCancelPopOkClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCancelPopOkClick.clipsToBounds = YES;
    [btnCancelPopOkClick addTarget:self action:@selector(btnCancelPopOkClick:) forControlEvents:UIControlEventTouchUpInside];
    btnCancelPopOkClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperentCancel addSubview:btnCancelPopOkClick];
    
    btnCancelPopCancelClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancelPopCancelClick.frame = CGRectMake(widthview+5,lblMessageCancel.frame.origin.y+lblMessageCancel.frame.size.height+5, widthview-10,35);
    [btnCancelPopCancelClick setTitle:[TSLanguageManager localizedString:@"Cancel"] forState:UIControlStateNormal];
    //    [btnFlowerClick setBackgroundImage:[APP_DELEGATE colorWithHexString:violetgreenColor] forState:UIControlStateNormal];
    [btnCancelPopCancelClick setBackgroundColor:darkGayColor];
    btnCancelPopCancelClick.layer.cornerRadius = 5.0;
    [btnCancelPopCancelClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnCancelPopCancelClick.clipsToBounds = YES;
    [btnCancelPopCancelClick addTarget:self action:@selector(btnCancelPopCancelClick:) forControlEvents:UIControlEventTouchUpInside];
    btnCancelPopCancelClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperentCancel addSubview:btnCancelPopCancelClick];
    
    
    imgCancelOtheruserBorder = [[UIImageView alloc]initWithFrame:CGRectMake(widthview+10,lblMessageCancel.frame.origin.y-130, 110, 110)];
    imgCancelOtheruserBorder.layer.cornerRadius = imgCancelOtheruserBorder.frame.size.width/2;
    imgCancelOtheruserBorder.layer.masksToBounds = NO;
//    imgCancelOtheruserBorder.hidden = YES;
    imgCancelOtheruserBorder.userInteractionEnabled = YES;
    imgCancelOtheruserBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgCancelOtheruserBorder.layer.shadowRadius = 6.0;
    imgCancelOtheruserBorder.layer.shadowOpacity = 0.4;
    [viewTransperentCancel addSubview:imgCancelOtheruserBorder];
    
    imgCancelOtheruser = [[UIImageView alloc]initWithFrame:CGRectMake(widthview+12,lblMessageCancel.frame.origin.y-128, 106, 106)];
    imgCancelOtheruser.layer.cornerRadius = imgCancelOtheruser.frame.size.width/2;
        imgCancelOtheruser.clipsToBounds=YES;
//    imgCancelOtheruser.hidden = YES;
    imgCancelOtheruser.userInteractionEnabled = YES;
    [imgCancelOtheruser setContentMode:UIViewContentModeScaleAspectFill];
    [viewTransperentCancel addSubview:imgCancelOtheruser];

     imgCanceluserBorder = [[UIImageView alloc]initWithFrame:CGRectMake(widthview-120,lblMessageCancel.frame.origin.y-130,110, 110)];
    imgCanceluserBorder.layer.cornerRadius = imgCanceluserBorder.frame.size.width/2;
    imgCanceluserBorder.layer.masksToBounds = NO;
//    imgCanceluserBorder.hidden = YES;
    imgCanceluserBorder.userInteractionEnabled = YES;
    imgCanceluserBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgCanceluserBorder.layer.shadowRadius = 6.0;
    imgCanceluserBorder.layer.shadowOpacity = 0.4;
    [viewTransperentCancel addSubview:imgCanceluserBorder];
    
    imgCanceluser = [[UIImageView alloc]initWithFrame:CGRectMake(widthview-118,lblMessageCancel.frame.origin.y-128,106, 106)];
    imgCanceluser.layer.cornerRadius = imgCanceluser.frame.size.width/2;
    imgCanceluser.clipsToBounds=YES;
//    imgCanceluser.hidden = YES;
    imgCanceluser.userInteractionEnabled = YES;
    [imgCanceluser setContentMode:UIViewContentModeScaleAspectFill];
    [viewTransperentCancel addSubview:imgCanceluser];
    
    [[appDelegate window] addSubview:viewTransperentCancel];
}

-(void)ShowtransperentForFlower
{
    
    viewTransperentFlower = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
    viewTransperentFlower.hidden = YES;
    viewTransperentFlower.backgroundColor = [UIColor clearColor];

    placeActivityIndicatorFlower = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((viewTransperentFlower.frame.size.width/2)-(30/2), (viewTransperentFlower.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicatorFlower setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicatorFlower.color = violetgreenColor;;
    [viewTransperentFlower addSubview:placeActivityIndicatorFlower];
    
    UIView * viewShadow = [[UIView alloc]init];
    viewShadow.backgroundColor = [UIColor whiteColor];
    viewShadow.hidden = YES;
    [viewShadow setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    viewShadow.userInteractionEnabled  = YES;
    viewShadow.layer.cornerRadius = 5;
    viewShadow.clipsToBounds = YES;
    viewShadow.layer.shadowColor = [UIColor grayColor].CGColor;
    viewShadow.layer.shadowOffset = CGSizeMake(3, 3);
    viewShadow.layer.shadowOpacity = 5.0;
    viewShadow.layer.shadowRadius = 5.0;
    viewShadow.frame = viewShadow.frame;
    viewShadow.backgroundColor = [UIColor whiteColor];
    [viewTransperentFlower addSubview:viewShadow];
    
    UIView * viewShadow2= [[UIView alloc]init];
    viewShadow2.frame = viewTransperentCancel.frame;
    viewShadow2.backgroundColor = [UIColor whiteColor];
    [viewShadow2 setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    [viewTransperentFlower addSubview:viewShadow2];
  
    lblMessageFlower = [[UILabel alloc]initWithFrame:CGRectMake(20,(viewTransperentFlower.frame.size.height/2)-(100/2), viewTransperentFlower.frame.size.width-40, 100)];
    lblMessageFlower.numberOfLines = 0;
    lblMessageFlower.textColor = darkGayColor;
    lblMessageFlower.backgroundColor = [UIColor clearColor];
    lblMessageFlower.text = @"";
    lblMessageFlower.textAlignment = NSTextAlignmentCenter;
    [viewTransperentFlower addSubview:lblMessageFlower];
    
    widthview = viewTransperentFlower.frame.size.width/2;
    
    UIButton *btnFlowerPopOkClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFlowerPopOkClick.frame = CGRectMake(5,lblMessageFlower.frame.origin.y+lblMessageFlower.frame.size.height+5, widthview-10,35);
    [btnFlowerPopOkClick setTitle:[TSLanguageManager localizedString:@"Send"] forState:UIControlStateNormal];
    [btnFlowerPopOkClick setBackgroundColor:violetgreenColor];
    btnFlowerPopOkClick.layer.cornerRadius = 5.0;
    [btnFlowerPopOkClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnFlowerPopOkClick.clipsToBounds = YES;
    [btnFlowerPopOkClick addTarget:self action:@selector(btnFlowerPopOkClick:) forControlEvents:UIControlEventTouchUpInside];
    btnFlowerPopOkClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperentFlower addSubview:btnFlowerPopOkClick];
    
    UIButton *  btnFlowerPopCancelClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFlowerPopCancelClick.frame = CGRectMake(widthview+5,lblMessageFlower.frame.origin.y+lblMessageFlower.frame.size.height+5, widthview-10,35);
    [btnFlowerPopCancelClick setTitle:[TSLanguageManager localizedString:@"Cancel"] forState:UIControlStateNormal];
    [btnFlowerPopCancelClick setBackgroundColor:darkGayColor];
    btnFlowerPopCancelClick.layer.cornerRadius = 5.0;
    [btnFlowerPopCancelClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnFlowerPopCancelClick.clipsToBounds = YES;
    [btnFlowerPopCancelClick addTarget:self action:@selector(btnFlowerPopCancelClick:) forControlEvents:UIControlEventTouchUpInside];
    btnFlowerPopCancelClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperentFlower addSubview:btnFlowerPopCancelClick];
    
    imgFlowerOtheruserBorder = [[UIImageView alloc]initWithFrame:CGRectMake(widthview+10,lblMessageFlower.frame.origin.y-130, 110, 110)];
    imgFlowerOtheruserBorder.layer.cornerRadius = imgFlowerOtheruserBorder.frame.size.width/2;
    imgFlowerOtheruserBorder.layer.masksToBounds = NO;
    imgFlowerOtheruserBorder.userInteractionEnabled = YES;
    imgFlowerOtheruserBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgFlowerOtheruserBorder.layer.shadowRadius = 6.0;
    imgFlowerOtheruserBorder.layer.shadowOpacity = 0.4;
    [viewTransperentFlower addSubview:imgFlowerOtheruserBorder];
    
    imgFlowerOtheruser = [[UIImageView alloc]initWithFrame:CGRectMake(widthview+12,lblMessageFlower.frame.origin.y-128, 106, 106)];
    imgFlowerOtheruser.layer.cornerRadius = imgCancelOtheruser.frame.size.width/2;
    imgFlowerOtheruser.clipsToBounds=YES;
    imgFlowerOtheruser.userInteractionEnabled = YES;
    [imgFlowerOtheruser setContentMode:UIViewContentModeScaleAspectFill];
    [viewTransperentFlower addSubview:imgFlowerOtheruser];
    
    UIImageView * imgFlowerIcon = [[UIImageView alloc]initWithFrame:CGRectMake(widthview-66,(imgFlowerOtheruserBorder.frame.origin.y+imgCancelOtheruserBorder.frame.size.height/2)-(50/2) , 31, 50)];
    imgFlowerIcon.image = [UIImage imageNamed:@"SendFlower.png"];
    [viewTransperentFlower addSubview:imgFlowerIcon];
    
    UIImageView * imgSendArrowIcon = [[UIImageView alloc]initWithFrame:CGRectMake(imgFlowerIcon.frame.origin.x+imgFlowerIcon.frame.size.width+2, (imgFlowerIcon.frame.origin.y+imgFlowerIcon.frame.size.height/2)-(25/2), 32, 25)];
    imgSendArrowIcon.image = [UIImage imageNamed:@"Sendarrow.png"];
    [viewTransperentFlower addSubview:imgSendArrowIcon];

    [[appDelegate window] addSubview:viewTransperentFlower];

 }

-(void)ShowtransperentForIfnoFlowers
{
    viewTransperentForNoFlower = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
    viewTransperentForNoFlower.hidden = YES;
    viewTransperentForNoFlower.backgroundColor = [UIColor clearColor];
    
    
    UIView * viewShadow = [[UIView alloc]init];
    viewShadow.backgroundColor = [UIColor whiteColor];
    viewShadow.hidden = YES;
    [viewShadow setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    viewShadow.userInteractionEnabled  = YES;
    viewShadow.layer.cornerRadius = 5;
    viewShadow.clipsToBounds = YES;
    viewShadow.layer.shadowColor = [UIColor grayColor].CGColor;
    viewShadow.layer.shadowOffset = CGSizeMake(3, 3);
    viewShadow.layer.shadowOpacity = 5.0;
    viewShadow.layer.shadowRadius = 5.0;
    viewShadow.frame = viewShadow.frame;
    viewShadow.backgroundColor = [UIColor whiteColor];
    [viewTransperentForNoFlower addSubview:viewShadow];
    
    UIView * viewShadow2= [[UIView alloc]init];
    viewShadow2.frame = viewTransperentCancel.frame;
    viewShadow2.backgroundColor = [UIColor whiteColor];
    [viewShadow2 setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.9]];
    [viewTransperentForNoFlower addSubview:viewShadow2];
    
    lblMessageNOFlower = [[UILabel alloc]initWithFrame:CGRectMake(20,(viewTransperentFlower.frame.size.height/2)-(100/2), viewTransperentFlower.frame.size.width-40, 100)];
    lblMessageNOFlower.numberOfLines = 0;
    lblMessageNOFlower.textColor = darkGayColor;
    lblMessageNOFlower.backgroundColor = [UIColor clearColor];
    lblMessageNOFlower.text = [TSLanguageManager localizedString:@"Noflowernotification"];
    lblMessageNOFlower.textAlignment = NSTextAlignmentCenter;
    [viewTransperentForNoFlower addSubview:lblMessageNOFlower];
    
    
    UIButton *btnNOFlowerPopOkClick = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNOFlowerPopOkClick.frame = CGRectMake(20,lblMessageFlower.frame.origin.y+lblMessageFlower.frame.size.height+5, viewTransperentForNoFlower.frame.size.width-40,35);
    [btnNOFlowerPopOkClick setTitle:[TSLanguageManager localizedString:@"Ok"] forState:UIControlStateNormal];
    [btnNOFlowerPopOkClick setBackgroundColor:violetgreenColor];
    btnNOFlowerPopOkClick.layer.cornerRadius = 5.0;
    [btnNOFlowerPopOkClick setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnNOFlowerPopOkClick.clipsToBounds = YES;
    [btnNOFlowerPopOkClick addTarget:self action:@selector(btnNoFlowerPopOkClick:) forControlEvents:UIControlEventTouchUpInside];
    btnNOFlowerPopOkClick.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [viewTransperentForNoFlower addSubview:btnNOFlowerPopOkClick];
    
    [[appDelegate window] addSubview:viewTransperentForNoFlower];

}
-(void)btnNoFlowerPopOkClick:(id)sender{
    viewTransperentForNoFlower.hidden = YES;
    StoreVC * user = [[StoreVC alloc]init];
    [self.navigationController pushViewController:user animated:YES];
    //user.isFromMatchesandChat = @"YES";
}
-(void)btnPushFlowerPopOkClick:(id)sender {
    coverViewNotification.hidden = YES;
}
-(void)btnPushFlowerPopCancelClick:(id)sender {
    coverViewNotification.hidden = YES;
}
-(void)cancelPopWithdata:(NSString *)strOtheruserimage strOtheruserName:(NSString *)strname otheruserGender:(NSString *)gender
{
    viewTransperentCancel.hidden = NO;
    stringOthePersonname = strname;

    NSString * strnamePerson = [NSString stringWithFormat:@"@%@",strname];
    
    NSString * strName2 = [NSString stringWithFormat:@"@%@",strname];
    
    lblMessageCancel.text = [NSString stringWithFormat:@"%@ %@, %@ %@ %@",[TSLanguageManager localizedString:@"If you unmatch with"],strnamePerson,[TSLanguageManager localizedString:@"you won\'t be able to chat anymore, nor will"],strName2,[TSLanguageManager localizedString:@"be able to reach you in the future."]];
    
    NSRange range = [lblMessageCancel.text rangeOfString:strname];
    NSRange range2 = [lblMessageCancel.text rangeOfString:strName2];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]  initWithString:lblMessageCancel.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:violetgreenColor range:range];
    [attributedString addAttribute:NSForegroundColorAttributeName value:violetgreenColor range:range2];
    lblMessageCancel.attributedText = attributedString;
    
    if ([gender isEqualToString:@"F"]) {
        imgCancelOtheruserBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
    }
    else{
        imgCancelOtheruserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
    }
    
    if (strOtheruserimage!=nil  && ![[NSString stringWithFormat:@"%@",strOtheruserimage]isEqualToString:@""]) {
        NSString * strImageUrl = strOtheruserimage;
        if ([gender isEqualToString:@"F"])
        {
            [imgCancelOtheruser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
        }
        else{
            [imgCancelOtheruser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
        }
    }
    else{
        if ([gender isEqualToString:@"F"]) {
            
            imgCancelOtheruser.image = [UIImage imageNamed:@"female_avtar.png"];
        }
        else{
            imgCanceluserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
        }
    }
    
    if (![USER_IMAGE isEqualToString:@""]) {
        
        if ([GENDER_STATUS isEqualToString:@"M"]) {
            imgCanceluserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
            imgCanceluser.image = [UIImage imageNamed:@"male_avtar.png"];
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
           
            
        }else{
            imgCanceluserBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
            imgCanceluser.image = [UIImage imageNamed:@"female_avtar.png"];
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
                   }
    }else{
        if ([GENDER_STATUS isEqualToString:@"M"]) {
            imgCanceluserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
            imgCanceluser.image = [UIImage imageNamed:@"male_avtar.png"];
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
          
        }
        else if([GENDER_STATUS isEqualToString:@"F"])
        {
            imgCanceluserBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
            imgCanceluser.image = [UIImage imageNamed:@"female_avtar.png"];
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
        }
    }
}
-(void)FlowerPopWithdata:(NSString *)strOtheruserimage strOtheruserName:(NSString *)strname otheruserGender:(NSString *)gender
{
    viewTransperentFlower.hidden = NO;
    stringOthePersonname = strname;
    //Socialmedia demo

   NSString * strnamePerson = [NSString stringWithFormat:@"@%@",strname];
   lblMessageFlower.text = [NSString stringWithFormat:@"%@ %@ %@",[TSLanguageManager localizedString:@"We will send"],strnamePerson,[TSLanguageManager localizedString:@"a nice flower on your behalf, Showing your truly feelings, plus given her seven more days to reply to your request."]];
    
    NSRange range = [lblMessageFlower.text rangeOfString:strnamePerson];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]  initWithString:lblMessageFlower.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:violetgreenColor range:range];
    lblMessageFlower.attributedText = attributedString;

    if ([gender isEqualToString:@"F"]) {
        imgFlowerOtheruserBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
    }
    else{
        imgFlowerOtheruserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
    }
    
    if (strOtheruserimage!=nil  && ![[NSString stringWithFormat:@"%@",strOtheruserimage]isEqualToString:@""]) {
        NSString * strImageUrl = strOtheruserimage;
        if ([gender isEqualToString:@"F"]) {
            [imgFlowerOtheruser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
        }
        else{
            [imgFlowerOtheruser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
        }
    }
    else{
        if ([gender isEqualToString:@"F"]) {
            imgFlowerOtheruser.image = [UIImage imageNamed:@"female_avtar.png"];
        }
        else{
            imgFlowerOtheruser.image = [UIImage imageNamed:@"male-circle_small.png"];
        }
    }
}

#pragma mark - View Animation

-(void)viewAnimation
{
    imgUnreadMessageCount.hidden = YES;
    lblUnreadCount.hidden = YES;
    
    viewFromBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    viewFromBottom.backgroundColor = [[APP_DELEGATE colorWithHexString:@"76ccae"] colorWithAlphaComponent:0.95];
    viewFromBottom.alpha = 0;
    [[appDelegate window] addSubview:viewFromBottom];

    int yy = DEVICE_HEIGHT -120;
    
    UIButton* btnCencel = [[UIButton alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-70,yy, 50, 50)];
    [btnCencel setImage:[UIImage imageNamed:@"float.png"] forState:UIControlStateNormal];
    [btnCencel addTarget:self action:@selector(cencelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnCencel];
    
    yy = yy -38 -30;
    
    UIButton* btnMatches = [[UIButton alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-65, yy, 38 , 38)];
    [btnMatches setImage:[UIImage imageNamed:@"matches_icon_unselected.png"] forState:UIControlStateNormal];
    btnMatches.tag = 1;
    [btnMatches addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnMatches];
 
    int xx = DEVICE_WIDTH - 65 -25;
    
    UILabel* lblMatches = [[UILabel alloc]initWithFrame:CGRectMake(0, yy +10, xx, 20)];
    lblMatches.textColor = [UIColor whiteColor];
    lblMatches.font = [UIFont systemFontOfSize:18];
    lblMatches.textAlignment = NSTextAlignmentRight;
    lblMatches.text = [NSString stringWithFormat:@"%@ (%@)", [TSLanguageManager localizedString:@"Matches"],strTempMessagePeople];
    [viewFromBottom addSubview:lblMatches];
    
    UIButton * btnlableMatchesButton = [UIButton buttonWithType: UIButtonTypeCustom];
    btnlableMatchesButton.frame = lblMatches.frame;
    btnlableMatchesButton.tag = 1;
    [btnlableMatchesButton setBackgroundColor:[UIColor clearColor]];
    [btnlableMatchesButton addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnlableMatchesButton];
    
    yy = yy - 38 -30;
    
    UIButton* btnWaitingYes = [[UIButton alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-65,yy, 38 , 38)];
    [btnWaitingYes setImage:[UIImage imageNamed:@"waiting_you_icon_unselected.png"] forState:UIControlStateNormal];
    btnWaitingYes.tag = 2;
    [btnWaitingYes addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnWaitingYes];
    
    UILabel* lblWaitingYes = [[UILabel alloc]initWithFrame:CGRectMake(0, yy +10, xx, 20)];
    lblWaitingYes.textColor = [UIColor whiteColor];
    lblWaitingYes.font = [UIFont systemFontOfSize:18];
    lblWaitingYes.textAlignment = NSTextAlignmentRight;
    lblWaitingYes.text = [NSString stringWithFormat:@"%@ (%@)", [TSLanguageManager localizedString:@"Waiting for you"],strTempYespeople];
    [viewFromBottom addSubview:lblWaitingYes];
    
    UIButton * btnlblWaitingYes = [UIButton buttonWithType: UIButtonTypeCustom];
    btnlblWaitingYes.frame = lblWaitingYes.frame;
    btnlblWaitingYes.tag = 2;
    [btnlblWaitingYes setBackgroundColor:[UIColor clearColor]];
    [btnlblWaitingYes addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnlblWaitingYes];
    
    yy = yy - 38 -30;
    
    UIButton* btnWaitingFlower = [[UIButton alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-65,yy, 38, 38)];
    [btnWaitingFlower setImage:[UIImage imageNamed:@"waiting_them_icon_unselected.png"] forState:UIControlStateNormal];
    btnWaitingFlower.tag = 3;
    [btnWaitingFlower addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnWaitingFlower];
    
    UILabel* lblWaitingFlower = [[UILabel alloc]initWithFrame:CGRectMake(0, yy +10, xx, 20)];
    lblWaitingFlower.textColor = [UIColor whiteColor];
    lblWaitingFlower.font = [UIFont systemFontOfSize:18];
    lblWaitingFlower.textAlignment = NSTextAlignmentRight;
    lblWaitingFlower.text = [NSString stringWithFormat:@"%@ (%@)", [TSLanguageManager localizedString:@"Waiting for them"],strTempFloweCount];
    [viewFromBottom addSubview:lblWaitingFlower];
    
    
    UIButton * btnlblWaitingFlower = [UIButton buttonWithType: UIButtonTypeCustom];
    btnlblWaitingFlower.frame = lblWaitingFlower.frame;
    btnlblWaitingFlower.tag = 3;
    [btnlblWaitingFlower setBackgroundColor:[UIColor clearColor]];
    [btnlblWaitingFlower addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnlblWaitingFlower];
    
    yy = yy - 38 -30;
    
    UIButton* btnAll  = [[UIButton alloc]initWithFrame:CGRectMake(DEVICE_WIDTH-65,yy, 38, 38)];
    [btnAll setImage:[UIImage imageNamed:@"all_icon_unselected.png"] forState:UIControlStateNormal];
    btnAll.tag = 4;
    [btnAll addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnAll];
    
    UILabel* lblAll = [[UILabel alloc]initWithFrame:CGRectMake(0, yy +10, xx, 20)];
    lblAll.textColor = [UIColor whiteColor];
    lblAll.font = [UIFont systemFontOfSize:18];
    lblAll.textAlignment = NSTextAlignmentRight;
    lblAll.text = [NSString stringWithFormat:@"%@ (%@)", [TSLanguageManager localizedString:@"All"],strTempGetMatches];
    [viewFromBottom addSubview:lblAll];
    
    
    UIButton * btnlblAll = [UIButton buttonWithType: UIButtonTypeCustom];
    btnlblAll.frame = lblAll.frame;
    btnlblAll.tag = 4;
    [btnlblAll setBackgroundColor:[UIColor clearColor]];
    [btnlblAll addTarget:self action:@selector(viewBottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewFromBottom addSubview:btnlblAll];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        viewFromBottom.alpha = 0;
        viewFromBottom.transform = CGAffineTransformMakeTranslation(0,DEVICE_HEIGHT+20);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            viewFromBottom.alpha = 1;
            viewFromBottom.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:nil];
    }];
    
}

-(void)viewBottomButtonClicked:(id)sender
{
    NSInteger btnInteger = [sender tag];
    NSString* btnString = [@(btnInteger) stringValue];
    NSLog(@"%@", btnString);
    
    if ([btnString isEqualToString:@"1"])
    {
        [btnFilter setImage:[UIImage imageNamed: @"matches_icon_selected.png"] forState:UIControlStateNormal];
        [self viewDidAnimation];
        yesTopeopleClicked = NO;
         FloweClicekd = NO;
        allClicked = NO;
        messageClicked = YES;
        
        [_collectionView reloadData];
    }
    else if ([btnString isEqualToString:@"2"])
    {
        [btnFilter setImage:[UIImage imageNamed: @"waiting_you_icon_selected.png"] forState:UIControlStateNormal];
        [self viewDidAnimation];
        
        messageClicked = NO;
        FloweClicekd = NO;
        allClicked = NO;
        yesTopeopleClicked = YES;
        
        [_collectionView reloadData];
    }
    else if ([btnString isEqualToString:@"3"])
    {
        [btnFilter setImage:[UIImage imageNamed: @"waiting_them_icon_selected.png"] forState:UIControlStateNormal];
        [self viewDidAnimation];
        messageClicked = NO;
        yesTopeopleClicked = NO;
        allClicked = NO;
        FloweClicekd = YES;
        
        [_collectionView reloadData];
    }
    else if ([btnString isEqualToString:@"4"])
    {
        [btnFilter setImage:[UIImage imageNamed: @"all_icon_selected.png"] forState:UIControlStateNormal];
        [self viewDidAnimation];
        
        yesTopeopleClicked = NO;
        FloweClicekd = NO;
        messageClicked = NO;
        allClicked = YES;

        [_collectionView reloadData];
    }
    
}

-(void)viewDidAnimation
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        viewFromBottom.alpha = 1;
        viewFromBottom.transform = CGAffineTransformMakeTranslation(0,0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            viewFromBottom.transform = CGAffineTransformMakeTranslation(0,DEVICE_HEIGHT-100);
            viewFromBottom.alpha = 0;
        } completion:nil];
    }];
    
}


#pragma mark - collectionView Delegates
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (FloweClicekd == YES) {
        if ([arrayTempFlower count]>0) {
            arrayGetMatches = [arrayTempFlower mutableCopy];
            lblError.hidden = YES;
            return [arrayGetMatches count];
        }else{
            lblError.hidden = NO;
            return 0;
        }
    }
    else if (yesTopeopleClicked == YES){
        if ([arrayTempYespeople count]>0) {
            arrayGetMatches = [arrayTempYespeople mutableCopy];
            lblError.hidden = YES;
            return [arrayGetMatches count];
        }else{
            lblError.hidden = NO;
            return 0;
        }
    }
    else if (messageClicked == YES){
        if ([arrayTempMessagePeople count]>0) {
            arrayGetMatches = [arrayTempMessagePeople mutableCopy];
            lblError.hidden = YES;
            return [arrayGetMatches count];
        }else{
            lblError.hidden = NO;
            return 0;
        }
    }
    else if (allClicked == YES){
        if ([arrayTempGetMatches count]>0) {
            arrayGetMatches = [arrayTempGetMatches mutableCopy];
            lblError.hidden = YES;
            return [arrayGetMatches count];
        }else{
            lblError.hidden = NO;
            return 0;
        }
    }
    else{
        if ([arrayGetMatches count]>0) {
            return [arrayGetMatches count];
        }
    }
   
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AFCollectionViewCell *cell =  (AFCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ItemIdentifier forIndexPath:indexPath];
        cell.backgroundColor=[UIColor clearColor];
    
    NSString * strDate = @"";
    NSString * strgender = @"";
    NSString * strtype = @"";


    if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"type"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"type"]!=[NSNull null]) {
        strtype = [NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"type"]];
    }
    if ([strtype isEqualToString:@"WAITING"] || [strtype isEqualToString:@"LIKE"]) {
        if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"]!=[NSNull null] && ![[NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"]]isEqualToString:@""]) {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish]) {
            strDate = [NSString stringWithFormat:@"%@ %@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"],[TSLanguageManager localizedString:@"days to respond"]];
            }
            else{
                strDate = [NSString stringWithFormat:@"%@ %@ %@",@"Faltan",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"],@"días"];
            }
        }
    }
    else if([strtype isEqualToString:@"MATCH"])
    {
        if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"matched_on"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"matched_on"]!=[NSNull null] && ![[NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"matched_on"]]isEqualToString:@""]) {
            strDate = [NSString stringWithFormat:@"%@ %@",[TSLanguageManager localizedString:@"Since"],[self todatetimonly:[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"matched_on"]]];
        }
    }
    else {
        strDate = @"";
    }
    
    if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"gender"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"gender"]!=[NSNull null] && ![[NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"gender"]]isEqualToString:@""]) {
        strgender = [NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"gender"]];
    }
    
    if ([strtype isEqualToString:@"WAITING"] || [strtype isEqualToString:@"MATCH"]) {
        
        cell.imgBorderUserlike.hidden = YES;
        cell.imgBorderOtherUserlike.hidden = YES;
        cell.imgProfileOtherUserlike.hidden = YES;
        cell.imgProfileUserlike.hidden = YES;
        cell.imgBorderUser.hidden = NO;
        cell.imgBorderOtherUser.hidden = NO;
        cell.imgProfileUser.hidden = NO;
        cell.imgProfileOtherUser.hidden = NO;
        cell.imageFlower.hidden = YES;
        cell.imageCancel.hidden = YES;
        cell.imageAccepet.hidden = NO;
        cell.btnCancel.hidden = YES;
        
        if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]!=[NSNull null] && ![[NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]]isEqualToString:@""] && ![[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]isEqual:[NSNull null]])
        {
            NSString * strImageUrl = [NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]];
            if ([strgender isEqualToString:@"F"])
            {
                cell.imgBorderOtherUser.image = [UIImage imageNamed:@"female-circle_small.png"];
//
                cell.imgProfileOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
//
                [cell.imgProfileOtherUser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@""]];

            }
            else{
                
                cell.imgBorderOtherUser.image = [UIImage imageNamed:@"male-circle_small.png"];

                cell.imgProfileOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];

                [cell.imgProfileOtherUser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@""]];
            }
        }
        else
        {
            if ([strgender isEqualToString:@"F"])
            {
                cell.imgBorderOtherUser.image = [UIImage imageNamed:@"female-circle_small.png"];

                cell.imgProfileOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
            }
            else
            {
                cell.imgBorderOtherUser.image = [UIImage imageNamed:@"male-circle_small.png"];
                cell.imgProfileOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];
            }
        }
    }
    else if([strtype isEqualToString:@"LIKE"])
    {
        cell.imgBorderUserlike.hidden = NO;
        cell.imgBorderOtherUserlike.hidden = NO;
        cell.imgProfileOtherUserlike.hidden = NO;
        cell.imgProfileUserlike.hidden = NO;
        cell.imgBorderUser.hidden = YES;
        cell.imgBorderOtherUser.hidden = YES;
        cell.imgProfileUser.hidden = YES;
        cell.imgProfileOtherUser.hidden = YES;
    
        
        if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]!=[NSNull null] && ![[NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]]isEqualToString:@""]) {

            NSString * strImageUrl = [NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]];
            if ([strgender isEqualToString:@"F"])
            {
                cell.imgBorderOtherUserlike.image = [UIImage imageNamed:@"female-circle_small.png"];
                
                cell.imgProfileOtherUserlike.image = [UIImage imageNamed:@"female_avtar.png"];
                
            [cell.imgProfileOtherUserlike setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@""]];

            }
            else{
                
                cell.imgBorderOtherUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];
//                
                cell.imgProfileOtherUserlike.image = [UIImage imageNamed:@"male_avtar.png"];
                
                [cell.imgProfileOtherUserlike setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@""]
                 ];
            }
        }
        else{
            
            if ([strgender isEqualToString:@"F"]) {
                cell.imgBorderOtherUserlike.image = [UIImage imageNamed:@"female-circle_small.png"];

                cell.imgProfileOtherUserlike.image = [UIImage imageNamed:@"female_avtar.png"];
            }
            else{
                cell.imgBorderOtherUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];

                cell.imgProfileOtherUserlike.image = [UIImage imageNamed:@"male_avtar.png"];
            }
        }
    }
    if ([strtype isEqualToString:@"WAITING"])
    {
        cell.imageFlower.hidden = YES;
        cell.imageCancel.hidden = NO;
        cell.imageAccepet.hidden = NO;
        cell.imageCahticon.hidden = YES;
        cell.btnCahticon.hidden = YES;
        cell.imgplusicon.hidden = YES;
        
        cell.btnFlower.hidden = YES;
        cell.btnCancel.hidden = NO;
        cell.btnAccepet.hidden = NO;
        cell.btnCahticon.hidden = YES;
        cell.imageCancel.frame = CGRectMake(cell.imgBorderOtherUser.frame.origin.x+13,cell.imageCancel.frame.origin.y, 25,25);
        cell.btnCancel.frame = cell.imageCancel.frame;
        
        cell.imageAccepet.frame = CGRectMake((cell.imgBorderUser.frame.size.width)-35, cell.imageAccepet.frame.origin.y, 26,24);
        cell.btnAccepet.frame = cell.imageAccepet.frame;
    }
    else if([strtype isEqualToString:@"LIKE"])
    {
        cell.imageFlower.hidden = NO;
        cell.imageCancel.hidden = NO;
        cell.imageAccepet.hidden = YES;
        cell.imageCahticon.hidden = YES;
        cell.btnCahticon.hidden = YES;
        cell.imgplusicon.hidden = YES;
        cell.btnFlower.hidden = NO;
        cell.btnCancel.hidden = NO;
        cell.btnAccepet.hidden = YES;
        cell.btnCahticon.hidden = YES;

        cell.imageCancel.frame = CGRectMake(cell.imgBorderOtherUser.frame.origin.x+13,cell.imageCancel.frame.origin.y, 25,25);
        cell.btnCancel.frame = cell.imageCancel.frame;
        
        cell.imageFlower.frame = CGRectMake((cell.imgBorderUser.frame.size.width)-33, cell.imageFlower.frame.origin.y, 23,37);
        cell.btnFlower.frame = cell.imageFlower.frame;
    }
    else{
        cell.imageFlower.hidden = NO;
        cell.imageCancel.hidden = NO;
        cell.imageAccepet.hidden = YES;
        cell.imageCahticon.hidden = NO;
        cell.btnCahticon.hidden = NO;
        cell.imgplusicon.hidden = NO;
        cell.btnFlower.hidden = NO;
        cell.btnCancel.hidden = NO;
        cell.btnAccepet.hidden = YES;
        cell.btnCahticon.hidden = NO;

        cell.imageCahticon.frame = CGRectMake((cell.imgBorderUser.frame.size.width/2)-(36/2),(cell.imageFlower.frame.origin.y+cell.imageFlower.frame.size.height/2)-(28/2), 36,28);
        cell.btnCahticon.frame = cell.imageCahticon.frame;
        
        cell.imageFlower.frame = CGRectMake(cell.imageCahticon.frame.origin.x+cell.imageCahticon.frame.size.width+10, cell.imageFlower.frame.origin.y, 23, 37);
        cell.btnFlower.frame = cell.imageFlower.frame;
        
        cell.imageCancel.frame = CGRectMake(cell.imageFlower.frame.origin.x+cell.imageFlower.frame.size.width+10, cell.imageCancel.frame.origin.y, 25,25);
        cell.btnCancel.frame = cell.imageCancel.frame;
        
       
    }
    
    cell.imgBorderUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];
    cell.imgBorderUser.image = [UIImage imageNamed:@"male-circle_small.png"];

     if (![USER_IMAGE isEqualToString:@""]) {
        
        if ([GENDER_STATUS isEqualToString:@"M"])
        {
        cell.imgBorderUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];
        cell.imgBorderUser.image = [UIImage imageNamed:@"male-circle_small.png"];
            
        cell.imgProfileUserlike.image = [UIImage imageNamed:@"male_avtar.png"];
        cell.imgProfileUser.image = [UIImage imageNamed:@"male_avtar.png"];
        [cell.imgProfileUserlike setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
            
        [cell.imgProfileUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
            
//            NSLog(@"USER_IMAGE==>%@",USER_IMAGE);
        }else{
            
            cell.imgBorderUserlike.image = [UIImage imageNamed:@"female-circle_small.png"];
            cell.imgBorderUser.image = [UIImage imageNamed:@"female-circle_small.png"];
            
            cell.imgProfileUserlike.image = [UIImage imageNamed:@"female_avtar.png"];
            cell.imgProfileUser.image = [UIImage imageNamed:@"female_avtar.png"];
            
            [cell.imgProfileUserlike setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
            
            [cell.imgProfileUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@""]];
        }
    }else{
        if ([GENDER_STATUS isEqualToString:@"M"]) {
            cell.imgBorderUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];
            cell.imgBorderUser.image = [UIImage imageNamed:@"male-circle_small.png"];
            cell.imgProfileUserlike.image = [UIImage imageNamed:@"male_avtar.png"];
            cell.imgProfileUser.image = [UIImage imageNamed:@"male_avtar.png"];

        }
        else if([GENDER_STATUS isEqualToString:@"F"])
        {
            cell.imgBorderUserlike.image = [UIImage imageNamed:@"female-circle_small.png"];
            cell.imgBorderUser.image = [UIImage imageNamed:@"female-circle_small.png"];
            cell.imgProfileUserlike.image = [UIImage imageNamed:@"female_avtar.png"];
            cell.imgProfileUser.image = [UIImage imageNamed:@"female_avtar.png"];
        }
    }
    
    NSString * strCount = @"";
    if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"MessageCount"]) {
        if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"MessageCount"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"MessageCount"]!=[NSNull null]) {
            strCount = [NSString stringWithFormat:@"%@" ,[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"MessageCount"]];
            cell.imgMessage.hidden = NO;
            cell.lblMessageCount.hidden = NO;
        }
    }
    else{
        cell.imgMessage.hidden = YES;
        cell.lblMessageCount.hidden = YES;
    }
    if (![strCount isEqualToString:@"0"]) {
        cell.lblMessageCount.text = strCount;
    }
    cell.lbldate.text = strDate;
    
    [cell.btnuser addTarget:self action:@selector(btnuserClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.btnOtheruser.tag = indexPath.row;
    cell.btnCancel.tag = indexPath.row;
    cell.btnAccepet.tag = indexPath.row;
    cell.btnFlower.tag = indexPath.row;
    cell.btnCahticon.tag = indexPath.row;

    [cell.btnOtheruser addTarget:self action:@selector(btnOtheruserClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.btnAccepet addTarget:self action:@selector(btnAccepetClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.btnCancel addTarget:self action:@selector(btnCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.btnCahticon addTarget:self action:@selector(btnCahticonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
      [cell.btnFlower addTarget:self action:@selector(btnFlowerClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - Web Service Call
-(void)CallwebServiceForGetmatches
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        if ([arrayGetMatches count]>0) {
            
        }else{
            [placeActivityIndicator startAnimating];
        }
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:@"piropazo parejas" forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"getMatches";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}
#pragma mark - Web Service Call
-(void)CallwebServiceNotoPeopel:(NSString*)strName
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [placeActivityIndicator startAnimating];

        NSString * strLeft = [NSString stringWithFormat:@"piropazo no @%@",stringOthePersonname];
        NSLog(@"strLeft==>%@",strLeft);
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strLeft forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"NotoPeopel";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}
-(void)callwebServiceForSenFlower
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [placeActivityIndicator startAnimating];
        
        NSString * strLeft = [NSString stringWithFormat:@"piropazo flor @%@",stringOthePersonname];
        NSLog(@"strLeft==>%@",strLeft);
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strLeft forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"SendFlower";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
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
#pragma mark - Web Service Call
-(void)CallwebServiceYestoPeopel:(NSString*)strName
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [placeActivityIndicator startAnimating];

        NSString * strRight = [NSString stringWithFormat:@"piropazo si @%@",strName];
        
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

-(void)CallwebServiceForUnredIndivisulaCount
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
        manager.commandName = @"unreadMessagesMatch";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}

//-(void)CallWebapiForLogout {
//    
//    URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Your account is in use in another device. Please logout first."] cancelButtonTitle:OK_BTN otherButtonTitles:nil, nil];
//    [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
//    [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//        [alertView hideWithCompletionBlock:^{
//            if (buttonIndex == 0) {
//                BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
//                if (isNetAvaliable == NO)
//                {
//                }else{
//                    
//                    NSString * webServiceName = @"api/logout";
//                    
//                    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
//                    if (CURRENT_USER_ACCESS_TOKEN) {
//                        if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
//                        {
//                            [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
//                        }
//                        else
//                        {
//                            [parameter_dict setObject:@"" forKey:@"token"];
//                        }
//                    }
//                    
//                    URLManager *manager = [[URLManager alloc] init];
//                    manager.delegate = self;
//                    manager.commandName = @"Logout";
//                    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
//                }
//            }
//        }];
//    }];
//    [alertView showWithAnimation:Alert_Animation_Type];
//    
//}
#pragma mark Response
- (void)onResult:(NSDictionary *)result
{
    [placeActivityIndicator stopAnimating];
    [placeActivityIndicatorCancel stopAnimating];
    [placeActivityIndicatorFlower stopAnimating];

    NSLog(@"Result :%@",result);
    if([[result valueForKey:@"commandName"] isEqualToString:@"getMatches"])
    {
        NSLog(@"Inside==>");
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [arrayGetMatches removeAllObjects];
            [arrayTempGetMatches removeAllObjects];
            [arrayTempFlower removeAllObjects];
            [arrayTempYespeople removeAllObjects];
            [arrayTempMessagePeople removeAllObjects];
            [arrayGetMatchesFilter removeAllObjects];
            [arrayTempFlowerFilter removeAllObjects];
            [arrayTempYesFilter removeAllObjects];
            [arrayTempMatchFilter removeAllObjects];
            
            arrayGetMatchesFilter = [[result valueForKey:@"result"] valueForKey:@"people"];
            
       //****************  Filter array based on Time *******************//
            
            if ([arrayGetMatchesFilter count]>0) {
                
                btnFilter.hidden = NO;
                NSArray *sortedArray;
                NSArray *sortedArrayForYes;
                NSArray *sortedArrayForMatches;


                
                NSLog(@"arrayGetMatchesFilter count==>%lu",(unsigned long)[arrayGetMatchesFilter count]);
                for (int i = 0;i<[arrayGetMatchesFilter count];i++) {
                    if ([[[arrayGetMatchesFilter objectAtIndex:i]valueForKey:@"type"]isEqualToString:@"LIKE"]) {
                        [arrayTempFlowerFilter addObject:[arrayGetMatchesFilter objectAtIndex:i]];
  
                        NSSortDescriptor *alphaNumSD = [NSSortDescriptor sortDescriptorWithKey:@"time_left" ascending:YES comparator:^(NSString *string1, NSString *string2) {
                            return [string1 compare:string2 options:NSNumericSearch];
                        }];
                        sortedArray = [arrayTempFlowerFilter sortedArrayUsingDescriptors:@[alphaNumSD]];
                    }
                    else if ([[[arrayGetMatchesFilter objectAtIndex:i]valueForKey:@"type"]isEqualToString:@"WAITING"]){
                        [arrayTempYesFilter addObject:[arrayGetMatchesFilter objectAtIndex:i]];
                        NSSortDescriptor *alphaNumSD = [NSSortDescriptor sortDescriptorWithKey:@"time_left" ascending:YES comparator:^(NSString *string1, NSString *string2) {
                            return [string1 compare:string2 options:NSNumericSearch];
                        }];
                        sortedArrayForYes = [arrayTempYesFilter sortedArrayUsingDescriptors:@[alphaNumSD]];
                     }
                    else if ([[[arrayGetMatchesFilter objectAtIndex:i]valueForKey:@"type"]isEqualToString:@"MATCH"]){
                        [arrayTempMatchFilter addObject:[arrayGetMatchesFilter objectAtIndex:i]];
                        
                        NSSortDescriptor *alphaNumSD = [NSSortDescriptor sortDescriptorWithKey:@"matched_on" ascending:NO comparator:^(NSString *string1, NSString *string2) {
                            return [string1 compare:string2 options:NSNumericSearch];
                        }];
                        sortedArrayForMatches = [arrayTempMatchFilter sortedArrayUsingDescriptors:@[alphaNumSD]];
                        
                    //sortedArrayForMatches = [[[arrayTempMatchFilter reverseObjectEnumerator]allObjects]mutableCopy];

                        
                    }
                }
                
    //********************************************************************************//
                
          //************ Filter Array adding Main Array based on Types *************//
                
                for(int i = 0;i<[sortedArray count];i++) {
                    [arrayGetMatches addObject:[sortedArray objectAtIndex:i]];
                    }
                
                for(int i = 0;i<[sortedArrayForYes count];i++) {
                    [arrayGetMatches addObject:[sortedArrayForYes objectAtIndex:i]];
                }
                
                for(int i = 0;i<[sortedArrayForMatches count];i++) {
                    [arrayGetMatches addObject:[sortedArrayForMatches objectAtIndex:i]];
                }
                
                if ([sortedArray count]>0) {
                arrayTempFlower = [sortedArray mutableCopy];
                }
                if ([sortedArrayForYes count]>0){
                    arrayTempYespeople = [sortedArray mutableCopy];
                }
                if ([sortedArrayForMatches count]>0){
                    arrayTempMessagePeople = [sortedArrayForMatches mutableCopy];
                }
    //********************************************************************************//
                
                for (int i = 0;i<[arrayGetMatches count];i++) {
                    
                    [arrayTempGetMatches addObject:[arrayGetMatches objectAtIndex:i]];
                }

                NSLog(@"arrayTempMessagePeople==>%@",arrayGetMatches);
                NSLog(@"arrayTempFlower count==>%lu",(unsigned long)[arrayTempFlower count]);
                NSLog(@"arrayTempMessagePeople count==>%lu",(unsigned long)[arrayTempMessagePeople count]);
                NSLog(@"arrayTempYespeople count==>%lu",(unsigned long)[arrayTempYespeople count]);
                
                strTempGetMatches = @"0";
                strTempFloweCount = @"0";
                strTempYespeople = @"0";
                strTempMessagePeople = @"0";
                
                if ([arrayGetMatches count]>0) {
                    strTempGetMatches = [NSString stringWithFormat:@"%lu",(unsigned long)[arrayGetMatches count]];
                }
                
                if ([arrayTempFlower count]>0) {
                    strTempFloweCount = [NSString stringWithFormat:@"%lu",(unsigned long)[arrayTempFlower count]];
                }
                if ([arrayTempYespeople count]>0) {
                    strTempYespeople = [NSString stringWithFormat:@"%lu",(unsigned long)[arrayTempYespeople count]];
                }
                if ([arrayTempMessagePeople count]>0) {
                    strTempMessagePeople = [NSString stringWithFormat:@"%lu",(unsigned long)[arrayTempMessagePeople count]];
                }
                
                [self CallwebServiceForUnredIndivisulaCount];
               
                [_collectionView reloadData];
                
                lblError.hidden = YES;

            }
            else{
                lblError.hidden = NO;
            }
        }else if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"error"]){
            
            [APP_DELEGATE CallWebapiForLogout];
        }
        else{
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"message"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
    }else if ([[result valueForKey:@"commandName"] isEqualToString:@"unreadMessages"])
    {
        NSLog(@"Inside==>");
        [arrUnreadTotalCount removeAllObjects];
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if ([[[result valueForKey:@"result"] valueForKey:@"items"]count]>0) {
                if ([[result valueForKey:@"result"] valueForKey:@"items"]!=nil && [[result valueForKey:@"result"] valueForKey:@"items"]!=[NSNull null]) {
                    arrUnreadTotalCount = [[result valueForKey:@"result"] valueForKey:@"items"];
                    
                    if ([arrUnreadTotalCount count]>0) {
                        NSLog(@"arrUnreadTotalCount%@",arrUnreadTotalCount);
                        imgUnreadMessageCount.hidden = NO;
                        lblUnreadCount.hidden = NO;
                        
                        lblUnreadCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)[arrUnreadTotalCount count]];
                    }
                    else{
                        imgUnreadMessageCount.hidden = YES;
                        lblUnreadCount.hidden = YES;
                    }
                }
            }
            else{
                imgUnreadMessageCount.hidden = YES;
                lblUnreadCount.hidden = YES;
            }
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"Logout"]){
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSLog(@"logout==>");
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
    else if([[result valueForKey:@"commandName"] isEqualToString:@"NotoPeopel"])
    {
        NSLog(@"Inside==>");
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [self unreadcount];
            
            [self CallwebServiceForGetmatches];
        }
        else{
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"message"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
    }
    else if([[result valueForKey:@"commandName"] isEqualToString:@"YestoPeopel"])
    {
        NSLog(@"Inside==>");
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [self CallwebServiceForGetmatches];
        }
        else{
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"message"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
    }
    else if([[result valueForKey:@"commandName"] isEqualToString:@"SendFlower"])
    {
        NSLog(@"Inside==>");
        
        lblStatus.hidden = NO;
        lblStatus.text = [TSLanguageManager localizedString:@"Your flower has been sent"];
        [self performSelector:@selector(HideLabel) withObject:nil afterDelay:1.0];
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [self CallwebServiceForGetmatches];
        }
        else if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ERROR"])
        {
            if([[[result valueForKey:@"result"] valueForKey:@"message"]isEqualToString:@"Not enought flowers"]){
                
                viewTransperentForNoFlower.hidden = NO;
                
            }
        }
        else{
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"message"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
    }
    else if([[result valueForKey:@"commandName"] isEqualToString:@"unreadMessagesMatch"])
    {
        NSLog(@"Inside==>");
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [arrayUnreadMatches removeAllObjects];

            NSLog(@"unread==>");
            if ([[result valueForKey:@"result"]valueForKey:@"items"]) {
                arrayUnreadMatches = [[result valueForKey:@"result"]valueForKey:@"items"];
            }
            
            for(int i = 0;i<[arrayGetMatches count];i++)
            {
                for(int j= 0;j<[arrayUnreadMatches count];j++)
                {
                    if([[[arrayGetMatches objectAtIndex:i]valueForKey:@"username"] isEqualToString:[[arrayUnreadMatches objectAtIndex:j]valueForKey:@"username"]])
                    {
                        [[arrayGetMatches objectAtIndex:i] setValue:[[arrayUnreadMatches objectAtIndex:j]valueForKey:@"counter"] forKey:@"MessageCount"];
                        [_collectionView reloadData];
                        NSLog(@"Matched==>");
                     
                    }  else {
                        
                    }
                }
            }
        }
        else{
           
        }
    }
}

- (void)onError:(NSError *)error
{
    [placeActivityIndicator stopAnimating];
    [placeActivityIndicatorCancel stopAnimating];
    [placeActivityIndicatorFlower stopAnimating];
    lblError.hidden = YES;

    if ([arrayGetMatches count]==0) {
        [self CallwebServiceForGetmatches];
    }
    
    NSLog(@"The error is...%@", error);
}

-(void)HideLabel
{
    lblStatus.hidden = YES;
}
#pragma mark - helperMethods
-(NSString *)todatetimonly:(NSString *)givenDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [[NSDate alloc] init];
    date = [dateFormatter dateFromString:givenDate];
    // converting into our required date format
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *reqDateString = [dateFormatter stringFromDate:date];
    //NSLog(@"date is %@", reqDateString);
    
    return reqDateString;
}
#pragma mark - CleanUp
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
