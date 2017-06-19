//
//  ValidateEmailCodeVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RegisterAccountVC.h"
#import "URLManager.h"
#import "URBAlertView.h"
@interface ValidateEmailCodeVC : UIViewController<UITextFieldDelegate,URLManagerDelegate>

{
    UITextField * txtPin;
    UITextField * txtCreatePin;
    
    UITextField *_passcodeField;
    UITextField *_firstField;
    UITextField *_thirdField;
    UITextField *_secondField;
    UITextField *_fourthField;
    
    UIView * navview;
    UIView *_shiftingPasscodeInputView;

    UIButton * btnAddPin;
    
    UIImageView * imgBack;
    
    NSInteger passEnterCount;
    
    UIButton * btnContinue;
    
    UIActivityIndicatorView * activityIndicator;
}

@end
