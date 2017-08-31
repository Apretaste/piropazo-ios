//
//  ValidateEmailCodeVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "ValidateEmailCodeVC.h"
#import "TSLanguageManager.h"
#import <UserNotifications/UserNotifications.h>
#import <Firebase.h>
#import <FirebaseInstanceID/FirebaseInstanceID.h>
#import <FirebaseMessaging/FirebaseMessaging.h>
@interface ValidateEmailCodeVC ()

@end

@implementation ValidateEmailCodeVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    changeLanguage = NO;

    [self setFrame];
    [self setNavigationViewFrames];

    [self setShiftingPasscodeView];
    [self registerForKeyboardNotifications];
    [self hideLockView:NO];
    // Do any additional setup after loading the view.
}

#pragma mark - Frame Settings
-(void)setNavigationViewFrames
{
    self.navigationController.navigationBarHidden = YES;
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
    
    UIButton * btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBack setFrame:CGRectMake(0, 20, 44, 44)];
    //[btnBack setBackgroundColor:[UIColor clearColor]];
    [btnBack setImage:[UIImage imageNamed:@"back-btn.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(btnBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    [navview addSubview:btnBack];
    
}

-(void)setFrame {
    
   imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
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
    
     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self                                                                       action:@selector(dismissKeyboard)];
    [viewTransperent addGestureRecognizer:tap];
    int yy = 40;
    
    
    UILabel * lblTiltle = [[UILabel alloc]initWithFrame:CGRectMake(10, yy, viewTransperent.frame.size.width-20, 60)];
    lblTiltle.text = [TSLanguageManager localizedString:@"ValidEmailCode"];
    lblTiltle.numberOfLines = 3;
    lblTiltle.textAlignment = NSTextAlignmentCenter;
    lblTiltle.textColor = lightGayColor;
    lblTiltle.font = [UIFont systemFontOfSize:20];
    [viewTransperent addSubview:lblTiltle];
    
    yy = yy+60+20;
    
/*UIColor * color = darkGayColor;
    txtPin=[[UITextField alloc]initWithFrame:CGRectMake(30, yy, viewTransperent.frame.size.width-60, 40)];
    txtPin.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"* * * *" attributes:@{NSForegroundColorAttributeName: color}];
    txtPin.textAlignment=NSTextAlignmentCenter;
    txtPin.delegate=self;
    txtPin.font = [UIFont systemFontOfSize:20];
    txtPin.textColor = [UIColor blackColor ];
    txtPin.secureTextEntry = YES;
    [viewTransperent addSubview:txtPin];*/
    
    
    UIImageView *CreatePinView=[[UIImageView alloc]initWithFrame:CGRectMake(10,yy, viewTransperent.frame.size.width-20, 40)];
    CreatePinView.backgroundColor =[UIColor whiteColor];
    CreatePinView.clipsToBounds = NO;
    CreatePinView.layer.shadowColor = [[UIColor grayColor] CGColor];
    CreatePinView.userInteractionEnabled=YES;
    [viewTransperent addSubview:CreatePinView];
    
    txtCreatePin=[[UITextField alloc]initWithFrame:CGRectMake(40, 0, CreatePinView.frame.size.width-80, CreatePinView.frame.size.height)];
    txtCreatePin.keyboardType=UIKeyboardTypeDefault;
    txtCreatePin.delegate=self;
    txtCreatePin.returnKeyType=UIReturnKeyDone;
    txtCreatePin.font=[UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
    txtCreatePin.textColor= [UIColor blackColor];
    txtCreatePin.layer.borderColor=[UIColor clearColor].CGColor;
    txtCreatePin.userInteractionEnabled=NO;
    txtCreatePin.layer.borderWidth=0.0;
    [CreatePinView addSubview:txtCreatePin];
    
    _firstField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, txtCreatePin.frame.size.width/4, txtCreatePin.frame.size.height)];
    _firstField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _firstField.keyboardType = UIKeyboardTypeDecimalPad;
    _firstField.textAlignment = NSTextAlignmentCenter;
    [_firstField setDelegate:self];
    [_firstField setFont:[UIFont fontWithName:@"Arial" size:18]];
    [_firstField setTextColor:[UIColor blackColor]];
    [txtCreatePin addSubview:_firstField];
    
    _secondField = [[UITextField alloc] initWithFrame:CGRectMake(txtCreatePin.frame.size.width/4, 0, txtCreatePin.frame.size.width/4, txtCreatePin.frame.size.height)];
    _secondField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _secondField.textAlignment = NSTextAlignmentCenter;
    _secondField.keyboardType = UIKeyboardTypeDecimalPad;
    [_secondField setDelegate:self];
    [_secondField setFont:[UIFont fontWithName:@"Arial" size:18]];
    [_secondField setTextColor:[UIColor blackColor]];
    [txtCreatePin addSubview:_secondField];
    
    _thirdField = [[UITextField alloc] initWithFrame:CGRectMake(2*txtCreatePin.frame.size.width/4, 0, txtCreatePin.frame.size.width/4, txtCreatePin.frame.size.height)];
    _thirdField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _thirdField.keyboardType = UIKeyboardTypeDecimalPad;
    _thirdField.textAlignment = NSTextAlignmentCenter;
    [_thirdField setDelegate:self];
    [_thirdField setFont:[UIFont fontWithName:@"Arial" size:18]];
    [_thirdField setTextColor:[UIColor blackColor]];
    [txtCreatePin addSubview:_thirdField];
    
    _fourthField = [[UITextField alloc] initWithFrame:CGRectMake(3*txtCreatePin.frame.size.width/4, 0, txtCreatePin.frame.size.width/4, txtCreatePin.frame.size.height)];
    _fourthField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _fourthField.keyboardType = UIKeyboardTypeDecimalPad;
    _fourthField.textAlignment = NSTextAlignmentCenter;
    [_fourthField setDelegate:self];
    [_fourthField setFont:[UIFont fontWithName:@"Arial" size:18]];
    [_fourthField setTextColor:[UIColor blackColor]];
    [txtCreatePin addSubview:_fourthField];
    
    [_firstField setText:@""];
    [_secondField setText:@""];
    [_thirdField setText:@""];
    [_fourthField setText:@""];
    
    [self addTextFieldBottomColorr:_firstField];
    [self addTextFieldBottomColorr:_secondField];
    [self addTextFieldBottomColorr:_thirdField];
    [self addTextFieldBottomColorr:_fourthField];
    
    _firstField.userInteractionEnabled=NO;
    _secondField.userInteractionEnabled=NO;
    _thirdField.userInteractionEnabled=NO;
    _fourthField.userInteractionEnabled=NO;
    
    
    btnAddPin = [[UIButton alloc] initWithFrame:CGRectMake(40, 0, CreatePinView.frame.size.width-40, CreatePinView.frame.size.height)];
    btnAddPin.tag=1;
    [btnAddPin addTarget:self action:@selector(openPinKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    [CreatePinView addSubview:btnAddPin];
 
    yy = yy+40+40;
    
    btnContinue= [UIButton buttonWithType:UIButtonTypeCustom];
    btnContinue.frame = CGRectMake(30,yy,  viewTransperent.frame.size.width-60,45);
    [btnContinue setTitle:[TSLanguageManager localizedString:@"ContinueText"] forState:UIControlStateNormal];
    [btnContinue setBackgroundImage:[APP_DELEGATE imageFromColor:violetgreenColor] forState:UIControlStateNormal];
    btnContinue.layer.cornerRadius = 5.0;
    btnContinue.titleLabel.font = [UIFont systemFontOfSize:20];
    [btnContinue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnContinue.clipsToBounds = YES;
    [btnContinue addTarget:self action:@selector(btnContinueClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewTransperent addSubview:btnContinue];
    
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activityIndicator setFrame:CGRectMake(btnContinue.frame.size.width-40, 5, 30, 30)];
    [btnContinue addSubview:activityIndicator];
    //[APP_DELEGATE addTextFieldBottomColorr:txtEmail];
}

-(void)openPinKeyboard:(id)sender
{
    [_passcodeField setText:@""];
    [_firstField setText:@""];
    [_secondField setText:@""];
    [_thirdField setText:@""];
    [_fourthField setText:@""];
    [self hideLockView:NO];
}

-(void)hideLockView:(BOOL)isHide
{
    if (isHide == YES)
    {
        [_passcodeField resignFirstResponder];
        [_firstField resignFirstResponder];
        [_secondField resignFirstResponder];
        [_thirdField resignFirstResponder];
        [_fourthField resignFirstResponder];
        // animations settings
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.250000];
        [UIView setAnimationCurve:7];
        // set views with new info
        // commit animations
        [UIView commitAnimations];
    }
    else
    {
        [_passcodeField becomeFirstResponder];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.250000];
        [UIView setAnimationCurve:7];
        // set views with new info
        // commit animations
        [UIView commitAnimations];
    }
}
#pragma mark - hide-show passcode view
-(void)showLockWithDelay:(id)sender
{
    [self hideLockView:NO];
}

-(void)hideLockWithDelay:(id)sender
{
    [self hideLockView:YES];
}
- (void) addTextFieldBottomColorr:(UITextField *)textField {
    UIColor *borderColor = violetgreenColor;
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(5.0f, textField.frame.size.height - 1,textField.frame.size.width-10, 1.0f);
    bottomBorder.backgroundColor = borderColor.CGColor;
    [textField.layer addSublayer:bottomBorder];
}
#pragma mark - setShiftingPasscodeView
-(void)setShiftingPasscodeView
{
    [_shiftingPasscodeInputView removeFromSuperview];
    _shiftingPasscodeInputView = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT, DEVICE_WIDTH, 40)];
    [_shiftingPasscodeInputView setBackgroundColor:[UIColor whiteColor]];
    [imgBack addSubview:_shiftingPasscodeInputView];
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 40)];
    [backView setBackgroundColor:[UIColor whiteColor]];
    [_shiftingPasscodeInputView addSubview:backView];
    [backView setAlpha:0.7];
    
    _passcodeField = [[UITextField alloc] initWithFrame:CGRectMake(0, 296, DEVICE_WIDTH, 30)];
    _passcodeField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passcodeField.keyboardType = UIKeyboardTypeDecimalPad;
    //    _passcodeField.keyboardAppearance = UIKeyboardAppearanceDark;
    //    _passcodeField.borderStyle = UITextBorderStyleRoundedRect;
    [_passcodeField setDelegate:self];
    [_passcodeField setFont:[UIFont fontWithName:@"Arial" size:18]];
    [_passcodeField setTextColor:violetgreenColor];
    [imgBack addSubview:_passcodeField];
    [_passcodeField setHidden:YES];
    
//    UIButton * btnOK = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnOK setBackgroundColor:[UIColor clearColor]];
//    [btnOK setFrame:CGRectMake(250, 0, 60, 35)];
//    btnOK.titleLabel.font = [UIFont systemFontOfSize:14];
//    [btnOK setTitle:@"OK" forState:UIControlStateNormal];
//    btnOK.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    [btnOK setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnOK addTarget:self action:@selector(btnOKClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [_shiftingPasscodeInputView addSubview:btnOK];
    
    UIButton * btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setBackgroundColor:[UIColor clearColor]];
    [btnCancel setFrame:CGRectMake(DEVICE_WIDTH-70, 0, 60, 35)];
    btnCancel.titleLabel.font = [UIFont systemFontOfSize:17];
    [btnCancel setTitle:@"OK" forState:UIControlStateNormal];
    btnCancel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btnCancel setTitleColor:violetgreenColor forState:UIControlStateNormal];
    [btnCancel addTarget:self action:@selector(btnCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_shiftingPasscodeInputView addSubview:btnCancel];
    
}
-(void)btnOKClicked:(id)sender
{
    [self performSelector:@selector(checkPasscode) withObject:nil afterDelay:0];
}
#pragma mark - checkPasscode
- (void)checkPasscode
{
    [self hideLockView:YES];
   // [self WebserviceCreatePin];
}

-(void)btnCancelClicked:(id)sender
{

    [self hideLockView:YES];
}
#pragma mark - Action Clicked
-(void)btnContinueClicked:(id)sender
{
    NSLog(@"password==>%@",[_passcodeField text]);
    [self hideKeyboard];
    if ([_passcodeField text].length<=3)
    {
        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[TSLanguageManager localizedString:@"Please enter the code we sent to your email"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
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
            [self CallwebServiceforCode];
        }
//        [APP_DELEGATE endHudProcess];
//        [APP_DELEGATE startHudProcess:nil];
        
        //RegisterAccountVC * code = [[RegisterAccountVC alloc]init];
       // [self.navigationController pushViewController:code animated:YES];
    }
}
-(void)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITextField Delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL retVal = YES;
    
    if ([[_passcodeField text] length] == 4)
    {
        if ((range.length == 1) && [string isEqualToString:@""])
        {
            retVal = YES;
        }
        else
        {
            retVal = NO;
        }
    }
    return retVal;
}

- (void)textDidChange:(NSNotification *)note
{
    if (passEnterCount<100) {
        
        
        NSUInteger length = [[_passcodeField text] length];
        if (length == 0)
        {
            [_firstField setText:@""];
            [_secondField setText:@""];
            [_thirdField setText:@""];
            [_fourthField setText:@""];

            
        }
        else if (length == 1)
        {
            [_firstField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(0, 1)]]];

            [_secondField setText:@""];
            [_thirdField setText:@""];
            [_fourthField setText:@""];
            
        }
        else if (length == 2)
        {
            [_firstField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(0, 1)]]];
            [_secondField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(1, 1)]]];
            
            [_thirdField setText:@""];
            [_fourthField setText:@""];
        }
        else if (length == 3)
        {
            [_firstField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(0, 1)]]];
            [_secondField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(1, 1)]]];
            [_thirdField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(2, 1)]]];
            [_fourthField setText:@""];

            
        }
        else if (length == 4)
        {
            [_firstField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(0, 1)]]];
            [_secondField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(1, 1)]]];
            [_thirdField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(2, 1)]]];
            [_fourthField setText:[NSString stringWithFormat:@"%@", [[_passcodeField text] substringWithRange:NSMakeRange(3, 1)]]];

        }
    }
    else
    {
        [_passcodeField setText:@""];
        [_firstField setText:@""];
        [_secondField setText:@""];
        [_thirdField setText:@""];
        [_fourthField setText:@""];
        
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"" message:@"You had reached maximum attempts of password entry, Please try after some time !" delegate:nil cancelButtonTitle:@"Thanks!" otherButtonTitles:nil, nil];
        [al show];
    }
}

#pragma mark  - Uitextfield Delegates
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - Hide Keyboard
-(void)hideKeyboard {
    
    [txtPin resignFirstResponder];
}
#pragma mark - Web Service Call
-(void)CallwebServiceforCode
{
//    [APP_DELEGATE endHudProcess];
//    [APP_DELEGATE startHudProcess:nil];
    
    [btnContinue setEnabled:NO];
    [activityIndicator startAnimating];
    
    if ([deviceTokenStr isEqualToString:@"(null)"] || deviceTokenStr == nil || [deviceTokenStr isEqualToString:@""] ) {
            NSString *fcmToken = [FIRMessaging messaging].FCMToken;
            deviceTokenStr = fcmToken;
    }
    
//    NSString *fcmToken = [FIRMessaging messaging].FCMToken;
//    deviceTokenStr = fcmToken;
    
    NSString * webServiceName = @"api/auth";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    
    [parameter_dict setObject:CURRENT_USER_EMAIL forKey:@"email"];
    [parameter_dict setObject:[_passcodeField text] forKey:@"pin"];
    if (deviceTokenStr !=nil) {
        [parameter_dict setObject:deviceTokenStr forKey:@"appid"];
    }
    [parameter_dict setObject:@"Piropazo" forKey:@"appname"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"sendCodeByEmail";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}

#pragma mark - WebserviceCalling
-(void)callWebapiForLanguage {
    NSString * webServiceName = @"run/api";
    
    // Checking user logged in or not
    NSLog(@"userToken==%@",CURRENT_USER_ACCESS_TOKEN);
    [[NSBundle mainBundle] preferredLocalizations];
    NSString *languageSyatem = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    
    NSString * strLang = @"";
    NSLog(@"language==>%@",languageSyatem);
    if ([languageSyatem isEqualToString:@"es"]) {
        strLang= @"es";
        
    }else{
        strLang= @"en";
    }
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    NSString * strLangusgae = [NSString stringWithFormat:@"perfil LANG %@",strLang];
    
    [parameter_dict setObject:strLangusgae forKey:@"subject"];
    [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"Languagechange";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}
#pragma mark Response
- (void)onResult:(NSDictionary *)result
{
    [btnContinue setEnabled:YES];
    [activityIndicator stopAnimating];
    if([[result valueForKey:@"commandName"] isEqualToString:@"sendCodeByEmail"])
    {
        NSLog(@"Result :%@",result);
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSString * strUserToken = [[result valueForKey:@"result"] valueForKey:@"token"];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:strUserToken forKey:@"CURRENT_USER_ACCESS_TOKEN"];
            [userDefaults synchronize];
            
            if([CURRENT_USER_ACCESS_TOKEN isEqual:[NSNull null]] || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@""] || CURRENT_USER_ACCESS_TOKEN == nil || [CURRENT_USER_ACCESS_TOKEN isEqualToString:@"(null)"])
            {
            }else{
                [self callWebapiForLanguage];
            }
            
          if ([NEW_USER_STATUS isEqualToString:@"false"])
            {
                [APP_DELEGATE setUpTabBarController:@"NO"];
            }
            else
            {

                RegisterAccountVC * code = [[RegisterAccountVC alloc]init];
                [self.navigationController pushViewController:code animated:YES];
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
    }else if ([[result valueForKey:@"commandName"] isEqualToString:@"Languagechange"]){
        
    }
  
//    else
//    {
//        URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:[[result valueForKey:@"result"] valueForKey:@"msg"] cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
//        [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
//        [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
//            [alertView hideWithCompletionBlock:^{
//                
//            }];
//        }];
//        [alertView showWithAnimation:URBAlertAnimationTopToBottom];
//    }
    
}
#pragma mark - KeyBoard Notification
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:_passcodeField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - Keyboard Notifications
- (void) keyboardWillShow: (NSNotification *)notification
{
    UIViewAnimationCurve animationCurve = [[[notification userInfo] valueForKey: UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval animationDuration = [[[notification userInfo] valueForKey: UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardBounds = [(NSValue *)[[notification userInfo] objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationDuration:animationDuration];
    [_shiftingPasscodeInputView setFrame:CGRectMake(0.0f, imgBack.frame.size.height - keyboardBounds.size.height - _shiftingPasscodeInputView.frame.size.height,_shiftingPasscodeInputView.frame.size.width, _shiftingPasscodeInputView.frame.size.height)];
    [UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note
{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    CGRect keyboardBounds;
    keyboardBounds = [imgBack convertRect:keyboardBounds toView:nil];
    CGRect containerFrame = _shiftingPasscodeInputView.frame;
    if (IS_IPAD)
    {
        containerFrame.origin.y = imgBack.bounds.size.height - (containerFrame.size.height - 120);
    }
    else
    {
        containerFrame.origin.y = imgBack.bounds.size.height - (containerFrame.size.height - 80);
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    _shiftingPasscodeInputView.frame = containerFrame;
    [UIView commitAnimations];
}

#pragma mark - Dissmiss KeyBoard
-(void)dismissKeyboard
{
    [txtCreatePin resignFirstResponder];
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
