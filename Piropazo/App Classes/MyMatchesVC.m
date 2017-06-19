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
    
     allClicked = NO;
    FloweClicekd = NO;
    yesTopeopleClicked = NO;
    messageClicked = NO;
    
    [self SetNavigationbar];
    [self setFrame];
    
    [self ShowtransperentForCancel];
    [self ShowtransperentForFlower];

    
}
-(void)viewWillAppear:(BOOL)animated {
  
    NSLog(@"GENDER_STATUS==>%@",GENDER_STATUS);
    NSLog(@"USER_IMAGE==>%@",USER_IMAGE);

    btnFilter = [[UIButton alloc]initWithFrame:CGRectMake(viewTransperent.frame.size.width-60, viewTransperent.frame.size.height-60, 38, 38)];
    [btnFilter setImage:[UIImage imageNamed:@"all_icon_selected.png"] forState:UIControlStateNormal];
    btnFilter.hidden = YES;
    [btnFilter addTarget:self action:@selector(btnFilterClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewTransperent addSubview:btnFilter];
    
    [APP_DELEGATE showTabBar:self.tabBarController];
    [self CallwebServiceForGetmatches];
    [self CallwebServiceForUnredIndivisulaCount];
}
-(void)viewDidDisappear:(BOOL)animated{
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
}

-(void)cencelButtonClicked:(id)Sender
{
    [self viewDidAnimation];
}
#pragma mark - Frame Settings
-(void)setFrame {
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    UIImageView * imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64-50)];
    imgBack.userInteractionEnabled = YES;
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((imgBack.frame.size.width/2)-(30/2), (imgBack.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicator.color = UIActivityIndicatorViewStyleWhiteLarge;;
    [imgBack addSubview:placeActivityIndicator];
    
    viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(10, 10, imgBack.frame.size.width-20,imgBack.frame.size.height-20)];
    viewTransperent.backgroundColor = [UIColor whiteColor];
    viewTransperent.alpha = 0.9;
    viewTransperent.userInteractionEnabled  = YES;
    viewTransperent.layer.cornerRadius = 5;
    viewTransperent.clipsToBounds = YES;
    viewTransperent.layer.shadowColor = [UIColor grayColor].CGColor;
    viewTransperent.layer.shadowOffset = CGSizeMake(3, 3);
    viewTransperent.layer.shadowOpacity = 5.0;
    viewTransperent.layer.shadowRadius = 5.0;
    [imgBack addSubview:viewTransperent];
    
    self.largeLayout = [[AFCollectionViewFlowLargeLayout alloc] init];
   // UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
//    [layout setItemSize:CGSizeMake(191, 160)];
//    layout.minimumInteritemSpacing = 0.0f;
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(5, 5, viewTransperent.frame.size.width-10, viewTransperent.frame.size.height-10) collectionViewLayout:self.largeLayout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[AFCollectionViewCell class] forCellWithReuseIdentifier:ItemIdentifier];
    [_collectionView setBackgroundColor:[UIColor clearColor
                                         ]];
    [viewTransperent addSubview:_collectionView];
    
}
-(void)ShowtransperentForCancel
{
    viewTransperentCancel = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT)];
    viewTransperentCancel.backgroundColor = [UIColor clearColor];
    viewTransperentCancel.hidden = YES;
    
    placeActivityIndicatorCancel = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((viewTransperentCancel.frame.size.width/2)-(30/2), (viewTransperentCancel.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicatorCancel setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicatorCancel.color = UIActivityIndicatorViewStyleWhiteLarge;;
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
    placeActivityIndicatorFlower.color = UIActivityIndicatorViewStyleWhiteLarge;;
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
  
    lblMessageFlower = [[UILabel alloc]initWithFrame:CGRectMake(20,( viewTransperentFlower.frame.size.height/2)-(100/2), viewTransperentFlower.frame.size.width-40, 100)];
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

-(void)cancelPopWithdata:(NSString *)strOtheruserimage strOtheruserName:(NSString *)strname otheruserGender:(NSString *)gender
{
    viewTransperentCancel.hidden = NO;
    stringOthePersonname = strname;

    NSString * strnamePerson = [NSString stringWithFormat:@"@%@",strname];
    
    NSString * strName2 = [NSString stringWithFormat:@"@%@",strname];
    
    lblMessageCancel.text = [NSString stringWithFormat:@"%@ %@ ,%@ %@ %@",[TSLanguageManager localizedString:@"If you unmatch"],strnamePerson,[TSLanguageManager localizedString:@"you two won't be able to chat anymore, nor"],strName2,[TSLanguageManager localizedString:@"will be allowed to contact you."]];
    
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
    
    imgCanceluserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
    [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
    
    if (![USER_IMAGE isEqualToString:@""]) {
        
        if ([GENDER_STATUS isEqualToString:@"M"]) {
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            
            imgCanceluserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
        }else{
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
            
            imgCanceluserBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
        }
    }else{
        if ([GENDER_STATUS isEqualToString:@"M"]) {
            imgCanceluserBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
        }
        else if([GENDER_STATUS isEqualToString:@"F"])
        {
            imgCanceluserBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
            [imgCanceluser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
        }
    }
}
-(void)FlowerPopWithdata:(NSString *)strOtheruserimage strOtheruserName:(NSString *)strname otheruserGender:(NSString *)gender
{
    viewTransperentFlower.hidden = NO;
    stringOthePersonname = strname;
    //Socialmedia demo

   NSString * strnamePerson = [NSString stringWithFormat:@"@%@",strname];
   lblMessageFlower.text = [NSString stringWithFormat:@"%@ %@ %@",[TSLanguageManager localizedString:@"We will send"],strnamePerson,[TSLanguageManager localizedString:@"a nice flower on your behalf. We will let her know about your truly feelings, plus give her seven more days to respond."]];
    
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
    viewFromBottom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    viewFromBottom.backgroundColor = [[APP_DELEGATE colorWithHexString:@"76ccae"] colorWithAlphaComponent:0.95];
    [self.view addSubview:viewFromBottom];
    viewFromBottom.alpha = 0;
    
    int yy = DEVICE_HEIGHT -150;
    
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
    lblMatches.text = [NSString stringWithFormat:@"%@(%@)", @"Matches",strTempMessagePeople];
    [viewFromBottom addSubview:lblMatches];
    
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
    lblWaitingYes.text = [NSString stringWithFormat:@"%@(%@)", @"Waiting for you",strTempYespeople];
    [viewFromBottom addSubview:lblWaitingYes];
    
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
    lblWaitingFlower.text = [NSString stringWithFormat:@"%@(%@)", @"Waiting for them",strTempFloweCount];
    [viewFromBottom addSubview:lblWaitingFlower];
    
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
    lblAll.text = [NSString stringWithFormat:@"%@(%@)", @"All",strTempGetMatches];
    [viewFromBottom addSubview:lblAll];
    
    
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
        }
        return [arrayGetMatches count];

    }
    else if (yesTopeopleClicked == YES){
        if ([arrayTempYespeople count]>0) {
            arrayGetMatches = [arrayTempYespeople mutableCopy];
        }
        return [arrayGetMatches count];

    }
    else if (messageClicked == YES){
        if ([arrayTempMessagePeople count]>0) {
            arrayGetMatches = [arrayTempMessagePeople mutableCopy];
        }
        return [arrayGetMatches count];

    }
    else if (allClicked == YES){
      
        if ([arrayTempGetMatches count]>0) {
            arrayGetMatches = [arrayTempGetMatches mutableCopy];
        }
        return [arrayGetMatches count];
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
    AFCollectionViewCell *cell = (AFCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ItemIdentifier forIndexPath:indexPath];
        cell.backgroundColor=[UIColor clearColor];
    
    NSString * strDate = @"";
    NSString * strgender = @"";
    NSString * strtype = @"";

    if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"type"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"type"]!=[NSNull null]) {
        strtype = [NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"type"]];
    }
    if ([strtype isEqualToString:@"WAITING"] || [strtype isEqualToString:@"LIKE"]) {
        if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"]!=[NSNull null] && ![[NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"]]isEqualToString:@""]) {
            strDate = [NSString stringWithFormat:@"%@ %@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"time_left"],[TSLanguageManager localizedString:@"days to respond"]];
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
        
        
        if ([[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]!=nil && [[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]!=[NSNull null] && ![[NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]]isEqualToString:@""]) {
            NSString * strImageUrl = [NSString stringWithFormat:@"%@",[[arrayGetMatches objectAtIndex:indexPath.row]valueForKey:@"picture_public"]];
            if ([strgender isEqualToString:@"F"])
            {
                cell.imgBorderOtherUser.image = [UIImage imageNamed:@"female-circle_small.png"];

                [cell.imgProfileOtherUser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
                
            }
            else{
                
                cell.imgBorderOtherUser.image = [UIImage imageNamed:@"male-circle_small.png"];

                [cell.imgProfileOtherUser setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            }
        }
        else{
            
            if ([strgender isEqualToString:@"F"]) {
                cell.imgBorderOtherUser.image = [UIImage imageNamed:@"female-circle_small.png"];

                cell.imgProfileOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
            }
            else{
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

                
                [cell.imgProfileOtherUserlike setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
                
            }
            else{
                
                cell.imgBorderOtherUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];

                [cell.imgProfileOtherUserlike setImageWithURL:[NSURL URLWithString:strImageUrl] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
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
        cell.imgplusicon.hidden = YES;
        
        cell.btnFlower.hidden = YES;
        cell.btnCancel.hidden = NO;
        cell.btnAccepet.hidden = NO;
        cell.btnCahticon.hidden = YES;
        cell.imageCancel.frame = CGRectMake((cell.imgBorderOtherUser.frame.origin.x+ cell.imgBorderOtherUser.frame.size.width/2)-(25/2)-5,cell.imageCancel.frame.origin.y, 25,25);
        cell.btnCancel.frame = cell.imageCancel.frame;
        
        cell.imageAccepet.frame = CGRectMake((cell.imgBorderUser.frame.size.width/2)-(26/2)+12, cell.imageAccepet.frame.origin.y, 26,24);
        cell.btnAccepet.frame = cell.imageAccepet.frame;
    }
    else if([strtype isEqualToString:@"LIKE"])
    {
        cell.imageFlower.hidden = NO;
        cell.imageCancel.hidden = NO;
        cell.imageAccepet.hidden = YES;
        cell.imageCahticon.hidden = YES;
        cell.imgplusicon.hidden = YES;
        
        cell.btnFlower.hidden = NO;
        cell.btnCancel.hidden = NO;
        cell.btnAccepet.hidden = YES;
        cell.btnCahticon.hidden = YES;

        cell.imageFlower.frame = CGRectMake((cell.imgBorderUser.frame.size.width/2)-(23/2)+15, cell.imageFlower.frame.origin.y, 23,37);
        cell.btnFlower.frame = cell.imageFlower.frame;
    }
    else{
//        NSInteger width = cell.contentView.frame.size.width/3;
        cell.imageFlower.hidden = NO;
        cell.imageCancel.hidden = NO;
        cell.imageAccepet.hidden = YES;
        cell.imageCahticon.hidden = NO;
        cell.imgplusicon.hidden = NO;
        
        cell.btnFlower.hidden = NO;
        cell.btnCancel.hidden = NO;
        cell.btnAccepet.hidden = YES;
        cell.btnCahticon.hidden = NO;

        cell.imageCahticon.frame = CGRectMake((cell.imgBorderUser.frame.size.width/2)-(36/2), cell.imageFlower.frame.origin.y, 36,28);
        
        
        cell.imageCancel.frame = CGRectMake(cell.imageCancel.frame.origin.x, cell.imageCancel.frame.origin.y, 25,25);
        cell.btnCancel.frame = cell.imageCancel.frame;
        
        
        cell.imageFlower.frame = CGRectMake(cell.imgBorderUserlike.frame.origin.x+cell.imgBorderUserlike.frame.size.width-14, cell.imageFlower.frame.origin.y, 23, 37);
        cell.btnFlower.frame = cell.imageFlower.frame;
    }
   
    
    cell.imgBorderUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];
    cell.imgBorderUser.image = [UIImage imageNamed:@"male-circle_small.png"];

 
    if (![USER_IMAGE isEqualToString:@""]) {
        
        if ([GENDER_STATUS isEqualToString:@"M"]) {
            
            [cell.imgProfileUserlike setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            
            [cell.imgProfileUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            
            cell.imgBorderUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];
            cell.imgBorderUser.image = [UIImage imageNamed:@"male-circle_small.png"];
        }else{
            
            [cell.imgProfileUserlike setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
            
            [cell.imgProfileUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
            
            cell.imgBorderUserlike.image = [UIImage imageNamed:@"female-circle_small.png"];
            cell.imgBorderUser.image = [UIImage imageNamed:@"female-circle_small.png"];
        }
        
    }else{
        if ([GENDER_STATUS isEqualToString:@"M"]) {
            cell.imgBorderUserlike.image = [UIImage imageNamed:@"male-circle_small.png"];
            cell.imgBorderUser.image = [UIImage imageNamed:@"male-circle_small.png"];
        }
        else if([GENDER_STATUS isEqualToString:@"F"])
        {
            cell.imgBorderUserlike.image = [UIImage imageNamed:@"female-circle_small.png"];
            cell.imgBorderUser.image = [UIImage imageNamed:@"female-circle_small.png"];
        }
    }
    
    cell.lbldate.text = strDate;
    
    [cell.btnuser addTarget:self action:@selector(btnuserClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.btnOtheruser.tag = indexPath.row;
    cell.btnCancel.tag = indexPath.row;
    cell.btnAccepet.tag = indexPath.row;
    cell.btnFlower.tag = indexPath.row;

    [cell.btnOtheruser addTarget:self action:@selector(btnOtheruserClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.btnAccepet addTarget:self action:@selector(btnAccepetClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.btnCancel addTarget:self action:@selector(btnCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    
//    [cell.btnCahticon addTarget:self action:@selector(btnOtheruserClicked:) forControlEvents:UIControlEventTouchUpInside];
    
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
    [placeActivityIndicator startAnimating];
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        
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
        [placeActivityIndicatorCancel startAnimating];

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
        [placeActivityIndicatorFlower startAnimating];
        
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
#pragma mark - Web Service Call
-(void)CallwebServiceYestoPeopel:(NSString*)strName
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
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
        manager.commandName = @"unreadMessages";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }

}
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
            
            arrayGetMatches = [[result valueForKey:@"result"] valueForKey:@"people"];
            if ([arrayGetMatches count]>0) {
                
                btnFilter.hidden = NO;

                NSLog(@"arrayGetMatches count==>%lu",(unsigned long)[arrayGetMatches count]);
                for (int i = 0;i<[arrayGetMatches count];i++) {
                    
                    [arrayTempGetMatches addObject:[arrayGetMatches objectAtIndex:i]];

                    if ([[[arrayGetMatches objectAtIndex:i]valueForKey:@"type"]isEqualToString:@"LIKE"]) {
                        [arrayTempFlower addObject:[arrayGetMatches objectAtIndex:i]];
  
                    }
                    else if ([[[arrayGetMatches objectAtIndex:i]valueForKey:@"type"]isEqualToString:@"WAITING"]){
                        [arrayTempYespeople addObject:[arrayGetMatches objectAtIndex:i]];
                     }
                    else if ([[[arrayGetMatches objectAtIndex:i]valueForKey:@"type"]isEqualToString:@"MATCH"]){
                        [arrayTempMessagePeople addObject:[arrayGetMatches objectAtIndex:i]];
                    }
                    
                }
                
                NSLog(@"arrayTempFlower count==>%lu",[arrayTempFlower count]);
                NSLog(@"arrayTempMessagePeople count==>%lu",(unsigned long)[arrayTempMessagePeople count]);
                NSLog(@"arrayTempYespeople count==>%lu",(unsigned long)[arrayTempYespeople count]);
                
                strTempGetMatches = @"0";
                strTempFloweCount = @"0";
                strTempYespeople = @"0";
                strTempMessagePeople = @"0";
                
                if ([arrayGetMatches count]>0) {
                    strTempGetMatches = [NSString stringWithFormat:@"%lu",[arrayGetMatches count]];
                }
                
                if ([arrayTempFlower count]>0) {
                    strTempFloweCount = [NSString stringWithFormat:@"%lu",[arrayTempFlower count]];
                }
                if ([arrayTempYespeople count]>0) {
                    strTempYespeople = [NSString stringWithFormat:@"%lu",[arrayTempYespeople count]];
                }
                
                if ([arrayTempMessagePeople count]>0) {
                    strTempMessagePeople = [NSString stringWithFormat:@"%lu",[arrayTempMessagePeople count]];
                }
               
                [_collectionView reloadData];
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
    else if([[result valueForKey:@"commandName"] isEqualToString:@"NotoPeopel"])
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
    else if([[result valueForKey:@"commandName"] isEqualToString:@"unreadMessages"])
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
                        NSLog(@"Matched==>");
//                        [arrayGetMatches ]
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

    NSLog(@"The error is...%@", error);
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
