//
//  RegisterAccountVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AsyncImageView.h"
#import "ACFloatingTextField.h"
#import "URLManager.h"

@interface RegisterAccountVC : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,URLManagerDelegate>
{
    
    UIImageView * navview;
    UIImageView * imgFirstnameDownArrow;
    UIImageView * imgSexDownArrow;
    UIImageView * imgSexorientationDownArrow;
    UIImageView * imgBirthDownArrow;
    UIImageView * imgCityDownArrow;
    UIImageView * imgProvinceDownArrow;
    UIImageView * imgStatesDownArrow;

    
    UIScrollView * scrlContent;
    
    UIImageView * imgProfile;
    
    UITextField * txtFirstname;
    UITextField * txtSex;
    UITextField * txtSexorientation;
    UITextField * txtBirthday;
    UITextField * txtCityname;
    UITextField * txtProvince;
    UITextField * txtStates;
    
    UIButton * btnMale;
    UIButton * btnFemale;

    BOOL BoolMALE;
    BOOL BoolFemaLE;
    BOOL ImageSelected;
    
    NSMutableArray *arrGendor;
    NSMutableArray *arrGendorOreintation;
    NSMutableArray *arrCountry;
    NSMutableArray *arrProvilence;
    NSMutableArray *arrStates;

    UIView * viewBirthday;
    UIView *viewGendor;
    UIView *viewGendorOrentation;
    UIView * viewTransperent;
    UIView * viewCountry;
    UIView * viewProvilence;
    UIView * viewStates;

    UIDatePicker * datePicker;
    UIPickerView *PickerGendor;
    UIPickerView *PickerGendorOrientation;
    UIPickerView *PickerCountry;
    UIPickerView *PickerProvilence;
    UIPickerView *PickerStates;

    NSString * selectedDate;
    NSString * selectedGender;
    NSString * selectedCountry;
    NSString * selectedProvilence;
    NSString * selectedState;
//
    NSInteger selectedSexHeight;
    NSInteger selectedBirthdayHeight;
    NSInteger selectedSexualOrientationHeight;
    NSInteger selectedCountryHeight;
    NSInteger intselectedGendor;
    
    int p;
    
    UILabel * firstLine;
    UILabel * SecondLine;
    
    UIButton *btnCityname;
    UIButton *btnProvince;
    UIButton *btnStatesp;
    UIButton * btnContinue;
    
    
    NSString * strSexkeyWord;
    NSString * strSexOrinetationkeyWord;
    NSString * strCountrykeyWord;
    NSString *strProvincekeyWord;
    NSString *strStatekeyWord;
    
    UIActivityIndicatorView *activityIndicator;

}

@end
