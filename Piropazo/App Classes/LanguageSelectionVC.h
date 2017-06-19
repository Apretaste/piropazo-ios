//
//  LanguageSelectionVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "LanguageSelectionCell.h"
#import "URBAlertView.h"
#import "ValidateEmailVC.h"
#import "NIDropDown.h"
#import "QuartzCore/QuartzCore.h"

@interface LanguageSelectionVC : UIViewController<NIDropDownDelegate>
{

    UILabel * lblSelectLanguage;
    
    UIButton * btnSelect;
    
    UIImageView * imgDDicon;
    
    NIDropDown *dropDown;

}

@end
