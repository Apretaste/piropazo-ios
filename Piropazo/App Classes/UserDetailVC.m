//
//  UserDetailVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "UserDetailVC.h"

@interface UserDetailVC ()

@end

@implementation UserDetailVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    changeLanguage = NO;

    arrofColors = [[NSMutableArray alloc]init];
    [arrofColors addObject:[UIColor redColor]];
    [arrofColors addObject:[UIColor greenColor]];
    [arrofColors addObject:[UIColor purpleColor]];
    [arrofColors addObject:[UIColor grayColor]];
    [arrofColors addObject:[UIColor darkGrayColor]];
    [arrofColors addObject:[UIColor yellowColor]];

    [self setNavigationViewFrames];
    [self setFrame];
    [self getProfileDetails];
}
-(void)viewWillAppear:(BOOL)animated {
   // [APP_DELEGATE hideTabBar:self.tabBarController];
}
-(instancetype)init
{
    if (self)
    {
        self.hidesBottomBarWhenPushed=YES;
    }return self;
}

#pragma mark - Frame Settings
-(void)setNavigationViewFrames {
    self.navigationController.navigationBarHidden = YES;
    navview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 64)];
    navview.backgroundColor =navigationBackgroundcolor;
    navview.userInteractionEnabled=YES;
    [self.view addSubview:navview];
    
    UIImageView * imgLogo = [[UIImageView alloc]initWithFrame:CGRectMake((DEVICE_WIDTH/2)-(114/2), (64/2)-(24/7), 114, 27)];
    imgLogo.image = [UIImage imageNamed:Navigationlogo];
    [navview addSubview:imgLogo];
    
    UIButton * btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBack setFrame:CGRectMake(0, 20, 44, 44)];
    [btnBack setImage:[UIImage imageNamed:@"back-btn.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(btnBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    [navview addSubview:btnBack];
}

-(void)setFrame {
    imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
    imgBack.userInteractionEnabled = YES;
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((imgBack.frame.size.width/2)-(30/2), (imgBack.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicator.color = UIActivityIndicatorViewStyleWhiteLarge;;
    [imgBack addSubview:placeActivityIndicator];
    
    scrlContent = [[UIScrollView alloc]init];
    scrlContent.backgroundColor = [UIColor clearColor];
    [imgBack addSubview:scrlContent];
}

#pragma mark - Actions
-(void)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)btnAccepetClicked:(id)sender {
    
    NSString * strRight = [NSString stringWithFormat:@"piropazo si @%@",_strUsername];
    
    NSString * webServiceName = @"run/api";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    
    [parameter_dict setObject:strRight forKey:@"subject"];
    [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"YestoPeopel";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}

-(void)btnRejectClicked:(id)sender {
    
    NSString * strLeft = [NSString stringWithFormat:@"piropazo no @%@",_strUsername];
    
    NSString * webServiceName = @"run/api";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    
    [parameter_dict setObject:strLeft forKey:@"subject"];
    [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"NotoPeopel";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}

-(void)dataPassingTofilelds:(NSMutableDictionary *)dicDetails {
   
    int yy = 0;
    
    scrlContent.frame = CGRectMake(0, 0, imgBack.frame.size.width, imgBack.frame.size.height);
    
    yy = yy + 20;
    
    //*===================== User_Profile ==========================*//
    
    imgBorder = [[UIImageView alloc]initWithFrame:CGRectMake((scrlContent.frame.size.width/2)-(192/2), yy, 192, 192)];
    imgBorder.clipsToBounds=YES;
    imgBorder.layer.cornerRadius = imgBorder.frame.size.width/2;
    imgBorder.image = [UIImage imageNamed:@"female-circle.png"];
    imgBorder.layer.masksToBounds = NO;
    imgBorder.layer.shadowOffset = CGSizeMake(0.1, 0.1);
    imgBorder.layer.shadowRadius = 6.0;
    imgBorder.layer.shadowOpacity = 0.4;
    [scrlContent addSubview:imgBorder];

    NSString * strGender = @"";
    
    if ([dicDetails valueForKey:@"gender"]!=nil && [dicDetails valueForKey:@"gender"]!=[NSNull null]) {
        strGender = [dicDetails valueForKey:@"gender"];
    }
    if ([strGender isEqualToString:@"F"]) {
        imgBorder.image = [UIImage imageNamed:@"female-circle.png"];
    }
    else {
        imgBorder.image = [UIImage imageNamed:@"male-circle.png"];
    }
    
    imgProfile = [[UIImageView alloc]initWithFrame:CGRectMake((scrlContent.frame.size.width/2)-(172/2), yy+10, 172, 172)];
    imgProfile.clipsToBounds=YES;
    imgProfile.layer.cornerRadius = imgProfile.frame.size.width/2;
    [imgProfile setContentMode:UIViewContentModeScaleAspectFill];
    if ([dicDetails valueForKey:@"picture_public"]!=nil && [dicDetails valueForKey:@"picture_public"]!=[NSNull null] && ![[dicDetails valueForKey:@"picture_public"]isEqualToString:@""]){
        NSString * strPhoto = [dicDetails valueForKey:@"picture_public"];
//        imgProfile.imageURL = [NSURL URLWithString:strPhoto];
        if ([strGender isEqualToString:@"F"])
        {
            [imgProfile setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
        }else{
            [imgProfile setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
        }
        
    }else{
        if ([strGender isEqualToString:@"F"])
        {
            imgProfile.image = [UIImage imageNamed:@"female_avtar.png"];
        }
        else
        {
            imgProfile.image = [UIImage imageNamed:@"male_avtar.png"];
        }
    }
    [scrlContent addSubview:imgProfile];

    //*===============================================================================*//

    yy = yy + imgBorder.frame.size.height + 20;

    viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(30, yy,scrlContent.frame.size.width-60,200)];
    viewTransperent.backgroundColor = [UIColor whiteColor];
    viewTransperent.alpha = 0.9;
    viewTransperent.userInteractionEnabled  = YES;
    viewTransperent.layer.cornerRadius = 5;
    viewTransperent.clipsToBounds = YES;
    viewTransperent.layer.shadowColor = [UIColor grayColor].CGColor;
    viewTransperent.layer.shadowOffset = CGSizeMake(3, 3);
    viewTransperent.layer.shadowOpacity = 5.0;
    viewTransperent.layer.shadowRadius = 5.0;
    [scrlContent addSubview:viewTransperent];
    
    int zz= 20;
    //*===================== User_Name ==========================*//

    UILabel * lblUserName = [[UILabel alloc]initWithFrame:CGRectMake(0, zz,viewTransperent.frame.size.width, 22)];
    [lblUserName setTextColor:merunRed];
    [lblUserName setBackgroundColor:[UIColor clearColor]];
    [lblUserName setTextAlignment:NSTextAlignmentCenter];
    [lblUserName setFont:[UIFont systemFontOfSize:20]];
    if ([dicDetails valueForKey:@"username"]) {
        if (![[dicDetails valueForKey:@"username"] isEqual:[NSNull null]]) {
            lblUserName.text = [NSString stringWithFormat:@"@%@",[dicDetails valueForKey:@"username"]];
        }
    }
    [viewTransperent addSubview:lblUserName];
    //*===============================================================================*//

    zz = zz + lblUserName.frame.size.height +10;
    
    //*===================== Yes and No ==========================*//

    NSInteger width = viewTransperent.frame.size.width/2;
    
    UIButton * btnAccepet = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAccepet.frame = CGRectMake(width-45, zz, 45, 45);
    [btnAccepet setImage:[UIImage imageNamed:@"accept_People.png"] forState:UIControlStateNormal];
    [btnAccepet addTarget:self action:@selector(btnAccepetClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewTransperent addSubview:btnAccepet];
    
    UIButton * btnReject = [UIButton buttonWithType:UIButtonTypeCustom];
    btnReject.frame = CGRectMake(width, zz, 45, 45);
    [btnReject addTarget:self action:@selector(btnRejectClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnReject setImage:[UIImage imageNamed:@"cancel_People.png"] forState:UIControlStateNormal];
    [viewTransperent addSubview:btnReject];
    //*===============================================================================*//

    zz = zz + btnAccepet.frame.size.height +10;

    //*===================== About_User ==========================*//

    UILabel * lblFirstDivder = [[UILabel alloc]initWithFrame:CGRectMake(10, zz, viewTransperent.frame.size.width-20, 1)];
    lblFirstDivder.backgroundColor = darkGayColor;
    [viewTransperent addSubview:lblFirstDivder];
    
    zz = zz + lblFirstDivder.frame.size.height +10;

    UILabel * lblAboutMe = [[UILabel alloc]init];
    NSString * strAbout= @"";
    if ([dicDetails valueForKey:@"about_me"]!=nil && [dicDetails valueForKey:@"about_me"]!=[NSNull null] && ![[dicDetails valueForKey:@"about_me"]isEqualToString:@""]){
        strAbout = [dicDetails valueForKey:@"about_me"];
    }
    lblAboutMe.text = strAbout;
    lblAboutMe.textColor = darkGayColor;
    lblAboutMe.numberOfLines = 0;
    lblAboutMe.font =[UIFont systemFontOfSize:14.0];
    CGSize AboutmeSize = [APP_DELEGATE getSizeForText:lblAboutMe.text andWidth:viewTransperent.frame.size.width-20 andFontWeight:UIFontWeightRegular andFontSize:14];
    [lblAboutMe setFrame:CGRectMake(10, zz, viewTransperent.frame.size.width-20, AboutmeSize.height)];
    lblAboutMe.textAlignment = NSTextAlignmentCenter;
    [viewTransperent addSubview:lblAboutMe];
    //*===============================================================================*//

    zz = zz + lblAboutMe.frame.size.height +10;
    
    //*===================== User_intrest ==========================*//

    if ([dicDetails valueForKey:@"interests"]!=nil && [dicDetails valueForKey:@"interests"]!=[NSNull null]){
        NSString * strIntrst= @"";
        
        UILabel * lblIntrest = [[UILabel alloc]init];

        NSArray * arrtags = [dicDetails valueForKey:@"interests"];
        if ([arrtags count]>0){
            strIntrst = [arrtags componentsJoinedByString:@","];
            
            UILabel * lblSecondDivder = [[UILabel alloc]initWithFrame:CGRectMake(10, zz, viewTransperent.frame.size.width-20, 1)];
            lblSecondDivder.backgroundColor = darkGayColor;
            [viewTransperent addSubview:lblSecondDivder];
            
            zz = zz + lblSecondDivder.frame.size.height +10;
            
            UILabel * lblThingsmotivate = [[UILabel alloc]initWithFrame:CGRectMake(0, zz, viewTransperent.frame.size.width, 15)];
            lblThingsmotivate.text = @"Things that motivate me";
            lblThingsmotivate.textAlignment = NSTextAlignmentCenter;
            lblThingsmotivate.font = [UIFont systemFontOfSize:14];
            lblThingsmotivate.textColor = [UIColor grayColor];
            [viewTransperent addSubview:lblThingsmotivate];
            
            zz = zz + lblThingsmotivate.frame.size.height +5;
            
            lblIntrest.text = strIntrst;
            lblIntrest.textColor = darkGayColor;
            lblIntrest.numberOfLines = 0;
            lblIntrest.font =[UIFont systemFontOfSize:14.0];
            
            CGSize IntrestSize = [APP_DELEGATE getSizeForText:lblIntrest.text andWidth:viewTransperent.frame.size.width-20 andFontWeight:UIFontWeightRegular andFontSize:14];
            [lblIntrest setFrame:CGRectMake(10, zz, viewTransperent.frame.size.width-20, IntrestSize.height)];
            [lblIntrest setTextAlignment:NSTextAlignmentCenter];
            [viewTransperent addSubview:lblIntrest];
            
            NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] init];
            for (NSString * str in arrtags)
            {
                NSMutableAttributedString * textstr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@,",str] attributes:@{NSForegroundColorAttributeName : [self getRandomColor]}];
                
//
                
                    [attStr appendAttributedString:textstr];
                
            }
            
            [attStr deleteCharactersInRange:NSMakeRange([attStr length]-1, 1)];
            
            lblIntrest.attributedText = attStr;
            
            zz = zz + lblIntrest.frame.size.height +30;

        }
    }
      //*===============================================================================*//

    //*===================== Final frame set ==========================*//

    [viewTransperent setFrame:CGRectMake(viewTransperent.frame.origin.x, viewTransperent.frame.origin.y, viewTransperent.frame.size.width, zz)];

    [scrlContent setContentSize:CGSizeMake(scrlContent.frame.size.width, yy+zz)];
    //*===============================================================================*//

    //*===================== Yes or No response display ==========================*//

    lblStatus = [[UILabel alloc]initWithFrame:CGRectMake(80, imgBack.frame.size.height-50,imgBack.frame.size.width-60, 40)];
    lblStatus.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    lblStatus.textColor = [UIColor whiteColor];
    lblStatus.textAlignment = NSTextAlignmentCenter;
    lblStatus.hidden = YES;
    lblStatus.layer.masksToBounds = YES;
    lblStatus.opaque =YES;
    //lblStatus.layer.al
    lblStatus.layer.cornerRadius = 8.0;
    [imgBack addSubview:lblStatus];
    //*===============================================================================*//
}
-(UIColor *) getRandomColor{
    CGFloat redcolor = arc4random() % 255 / 255.0;CGFloat greencolor = arc4random() % 255 / 255.0;
    CGFloat bluencolor = arc4random() % 255 / 255.0;return [UIColor colorWithRed:redcolor green:greencolor blue:bluencolor alpha:1.0];
}
#pragma mark - WebserviceCalling
-(void)getProfileDetails {
    
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [placeActivityIndicator startAnimating];
        
        NSString * webServiceName = @"run/api";
        NSString * strSubject = [NSString stringWithFormat:@"perfil @%@",_strUsername];
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        [parameter_dict setObject:strSubject forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"ProfileDetails";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}

#pragma mark Response
- (void)onResult:(NSDictionary *)result {
    [placeActivityIndicator stopAnimating];
    
    NSLog(@"Result :%@",result);
    if([[result valueForKey:@"commandName"] isEqualToString:@"ProfileDetails"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if ([[result valueForKey:@"result"] valueForKey:@"profile"]!=nil && [[result valueForKey:@"result"] valueForKey:@"profile"]!=[NSNull null]) {
                NSMutableDictionary * dicDetails = [[result valueForKey:@"result"] valueForKey:@"profile"];
                [self dataPassingTofilelds:dicDetails];
            }
          }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"NotoPeopel"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"Rejected" object:nil];

            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"YestoPeopel"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"Accepted" object:nil];

            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"message"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:URBAlertAnimationTopToBottom];
    }
}

- (void)onError:(NSError *)error {
    NSLog(@"The error is...%@", error);
    [placeActivityIndicator stopAnimating];
}

-(void)HideLabel {
    lblStatus.hidden = YES;
}
#pragma mark - CleanUp
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
