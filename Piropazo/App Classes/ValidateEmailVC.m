//
//  ValidateEmailVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "ValidateEmailVC.h"
#import "TSLanguageManager.h"
@interface ValidateEmailVC ()

@end

@implementation ValidateEmailVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    changeLanguage = NO;
    [self setFrame];

    [self SetNavigationbar];

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated {
    //isForCrashLogout = NO;
}
#pragma mark - Content Frame
-(void)SetNavigationbar
{
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
    

    NSLog(@"Language==>%@",[[NSUserDefaults standardUserDefaults]
                            stringForKey:@"CURRENT_USER_LANGUAGE"]);
    
    NSLog(@"backGroundimage==>%@",[[NSUserDefaults standardUserDefaults]
                            stringForKey:@"backGroundimage"]);
}

#pragma mark - Frame Settings
-(void)setFrame {
    
    UIImageView * imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
    imgBack.userInteractionEnabled = YES;
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
    UIView * viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(20, 40, DEVICE_WIDTH-40,imgBack.frame.size.height-40-40)];
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
    
    int yy = 40;
    
    UILabel * lblTiltle = [[UILabel alloc]initWithFrame:CGRectMake(0, yy, viewTransperent.frame.size.width, 60)];
    //lblTiltle.text = @"Please select\nyour language";
    lblTiltle.text = [TSLanguageManager localizedString:@"ValidEmail"];
    lblTiltle.numberOfLines = 2;
    lblTiltle.textAlignment = NSTextAlignmentCenter;
    lblTiltle.textColor = lightGayColor;
    lblTiltle.font = [UIFont systemFontOfSize:20];
    [viewTransperent addSubview:lblTiltle];
    
    yy = yy+60+20;
    
    UIView * addressView = [[UIView alloc] initWithFrame:CGRectMake(30,yy, (viewTransperent.frame.size.width)-60, 40)];
    addressView.userInteractionEnabled = YES;
    [viewTransperent addSubview:addressView];

    UIColor * color = violetgreenColor;
    txtEmail=[[UITextField alloc]initWithFrame:CGRectMake(0,0, addressView.frame.size.width, 40)];
    txtEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[TSLanguageManager localizedString:@"PlaceholderEmail"] attributes:@{NSForegroundColorAttributeName: color}];
    [txtEmail setKeyboardType:UIKeyboardTypeEmailAddress];
    txtEmail.textAlignment=NSTextAlignmentLeft;
    txtEmail.delegate=self;
//txtEmail.font = [UIFont systemFontOfSize:15];
    txtEmail.textColor = [UIColor blackColor ];
    txtEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    txtEmail.keyboardType = UIKeyboardTypeEmailAddress;
    txtEmail.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [addressView addSubview:txtEmail];

    yy = yy+60+20;
    
    btnContinue= [UIButton buttonWithType:UIButtonTypeCustom];
    btnContinue.frame = CGRectMake(30,yy,  viewTransperent.frame.size.width-60,45);
    [btnContinue setTitle:[TSLanguageManager localizedString:@"ContinueText"] forState:UIControlStateNormal];
    [btnContinue setBackgroundImage:[APP_DELEGATE imageFromColor:violetgreenColor] forState:UIControlStateNormal];
    btnContinue.layer.cornerRadius = 5.0;
    [btnContinue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     btnContinue.clipsToBounds = YES;
    [btnContinue addTarget:self action:@selector(btnContinueClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnContinue.titleLabel.font = [UIFont systemFontOfSize:20];
    [viewTransperent addSubview:btnContinue];
    
    [APP_DELEGATE addTextFieldBottomColorr:txtEmail];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator setFrame:CGRectMake(btnContinue.frame.size.width-40, 5, 30, 30)];
    [btnContinue addSubview:activityIndicator];
}

#pragma mark - Action Clicked
-(void)btnContinueClicked:(id)sender
{
    [self hideKeyboard];
    if ([txtEmail.text isEqualToString:@""])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:[TSLanguageManager localizedString:@"Please type your email address"]] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else if (![APP_DELEGATE validateEmail:txtEmail.text])
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Please enter valid email address" cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:12]];
        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
            [alertView hideWithCompletionBlock:^{
            }];
        }];
        [alertView showWithAnimation:Alert_Animation_Type];
    }
    else
    {
        BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
        if (isNetAvaliable == NO)
        {
        }else{
            [self CallwebServiceforEmail];
        }
    }
}
#pragma mark  - Uitextfield Delegates
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Hide Keyboard
-(void)hideKeyboard {
    
    [txtEmail resignFirstResponder];
}
#pragma mark - Web Service Call
-(void)CallwebServiceforEmail
{
//    [APP_DELEGATE endHudProcess];
//    [APP_DELEGATE startHudProcess:nil];
    [btnContinue setEnabled:NO];

    [activityIndicator startAnimating];
    
    NSString * webServiceName = @"api/start";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    
    [parameter_dict setObject:txtEmail.text forKey:@"email"];
    [parameter_dict setObject:[TSLanguageManager selectedLanguage] forKey:@"lang"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"sendCodeByEmail";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    
}
#pragma mark Response
- (void)onResult:(NSDictionary *)result
{
    [btnContinue setEnabled:YES];
    [activityIndicator stopAnimating];//    [APP_DELEGATE endHudProcess];
    
    NSLog(@"Result :%@",result);
    if([[result valueForKey:@"commandName"] isEqualToString:@"sendCodeByEmail"])
    {
        NSLog(@"Inside==>");
        
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSString * strUserstatus = [[result valueForKey:@"result"] valueForKey:@"newuser"];
            
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:txtEmail.text forKey:@"CURRENT_USER_EMAIL"];
            [userDefaults setObject:strUserstatus forKey:@"NEW_USER_STATUS"];
            
            [userDefaults synchronize];
            
            ValidateEmailCodeVC * code = [[ValidateEmailCodeVC alloc]init];
            [self.navigationController pushViewController:code animated:YES];
            
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

- (void)onError:(NSError *)error
{
    [btnContinue setEnabled:YES];
    [activityIndicator stopAnimating];
    NSLog(@"The error is...%@", error);
}

#pragma mark - CleanUp
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
