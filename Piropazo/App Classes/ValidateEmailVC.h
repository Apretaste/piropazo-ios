//
//  ValidateEmailVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ValidateEmailCodeVC.h"

#import "URLManager.h"

@interface ValidateEmailVC : UIViewController<UITextFieldDelegate,URLManagerDelegate>
{
    UITextField * txtEmail;
    
    UIImageView * navview;
    
    UIActivityIndicatorView * activityIndicator;
    
    UIButton * btnContinue;
}

@end
