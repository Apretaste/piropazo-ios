//
//  EditProfileVC.h
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSLanguageManager.h"
#import "IntrestCell.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

@interface EditProfileVC : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,URLManagerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    AppDelegate * appDelegate;

    UIImageView * navview;
    
    UILabel * lblError;
    UILabel * lblInterst;
    
    UIScrollView * scrlContent;
    
    
    UIImageView * imgProfile;
    UIImageView * imgBack;
    UIImageView * imgBorder;
    
    UIImageView * nameviewTextBox;
    UIImageView * imgLanguageTextBox;
    UIImageView * imgSexTextBox;
    UIImageView * imgSexOrienationTextBox;
    UIImageView * imgBirthdayTextBox;
    UIImageView * imgBodyTextBox;
    UIImageView * imgEyesTextBox;
    UIImageView * imgHairTextBox;
    UIImageView * imgSkinTextBox;
    UIImageView * imgCivilStatusTextBox;
    UIImageView * imgShoolLevelTextBox;
    UIImageView * imgProfessionTextbox;
    UIImageView * imgCityTextBox;
    UIImageView * imgCountryTextBox;
    UIImageView * imgInterstTextBox;
    UIImageView * imgReligionTextBox;
    UIImageView * imgStateTextBox;
    UIImageView * imageStateDropdown;
    //UIImageView * imgHairTextBox;

    
    UITextField * txtfname;
    UITextField * txtLanguage;
    UITextField * txtSex;
    UITextField * txtSexOrientation;
    UITextField * txtBirthDay;
    UITextField * txtEyes;
    UITextField * txtHair;
    UITextField * txtSkin;
    UITextField * txtCivilStatus;
    UITextField * txtSchool;
    UITextField * txtCivilProvision;
    UITextField * txtCity;
    UITextField * txtCountry;
    UITextField * txtState;
    //UITextField * txtinterst;
    UITextField * txtReligion;
    UITextField * txtBody;
    UITextField * txtAddIntrest;
    
    UIImageView * imgInfo;
    UILabel * lblUserName;
    UIImageView *imgFlowerCount;
    UIImageView *imgFlower;
    UIImageView *imgSmallCrown;
    UIImageView *imgSmallCrownCount;
    UIButton * btnFlower;
    UIButton * btnCrown;
    UILabel * lblFlowerCount;
    UILabel * lblCrwonCount;
    UIButton *btnReligion;
    UIButton *btnIntrest;
    
    UIActivityIndicatorView * placeActivityIndicator;
    UIActivityIndicatorView * activityIndicatorForSave;
    UIActivityIndicatorView * activityIndicatorForlogout;
    
    UIButton * btnContinue;
    UIButton * btnStoreButton;
    UIButton * btnlogoutButton;
    UIButton * btnChangeLanguage;
    UIButton *btnSex;
    UIButton *btnSexOrient;
    UIButton *btnDate;
    UIButton *btnBody;
    UIButton *btnEyes;
    UIButton *btnHair;
    UIButton *btnSkin;
    UIButton *btnCivilStatus;
    UIButton *btnSchool;
    UIButton *btnCountry;
    UIButton *btnProvience;

    NSMutableArray * arrSex;
    NSMutableArray * arrGendorOreintation;
    NSMutableArray * arrBody;
    NSMutableArray * arrEyes;
    NSMutableArray * arrHair;
    NSMutableArray * arrSkin;
    NSMutableArray * arrCivilStatus;
    NSMutableArray * arrSchool;
    NSMutableArray * arrCountry;
    NSMutableArray * arrProvience;
    NSMutableArray * arrStates;
    NSMutableArray * arrReligion;
    NSMutableArray * arrInterstSelection;
    NSMutableArray * arrinvite;

    UIView * viewGendor;
    UIPickerView * PickerGendor;
    UIView * viewGendorOrentation;
    UIPickerView * PickerGendorOrientation;
    UIView * viewBirthday;
    UIDatePicker * datePicker;
    UIView * viewBody;
    UIPickerView * PickerBody;
    UIView * viewEyes;
    UIPickerView * PickerEye;
    UIView * viewSkin;
    UIPickerView * PickerSkin;
    UIView * viewHair;
    UIPickerView * PickerHair;
    UIView * viewCivilstatus;
    UIPickerView * PickerCivilStatus;
    UIView * viewSchoolstatus;
    UIPickerView * PickerSchoolstatus;
    UIView * viewCountrys;
    UIPickerView * PickerCountry;
    UIView * viewProvilence;
    UIPickerView * PickerProvilence;
    UIView * viewStates;
    UIPickerView * PickerStates;
    UIView * viewReligion;
    UIPickerView * PickerReligion;
    UIView * backView;
    UIView * intrestView;
    UIView * viewTransperent;
    UIView * viewTransperentCrown;

    NSString * selectedDate;
    NSInteger intselectedGendor;
    
    UIImageView * imgSexDownArrow;
    UIImageView * imgSexorientaionDownArrow;
    UIImageView * imgBirthDownArrow;
    UIImageView * imageBodyDropdown;
    UIImageView * imageEyeDropdown;
    UIImageView * imageHairDropdown;
    UIImageView * imageSkinDropdown;
    UIImageView * imageCivilStatusDropdown;
    UIImageView * imageSchoolDropdown;
    UIImageView * imageCountryDropdown;
    UIImageView * imageprovienceDropdown;
    UIImageView * imageStatesDropdown;
    UIImageView * imageReligionDropdown;
    UIImageView * imgCrownProfile;

    NSInteger selectedSexHeight;
    NSInteger selectedBirthdayHeight;
    NSInteger selectedSexualOrientationHeight;
    NSInteger selectedBodyHeight;
    NSInteger selectedEyeHeight;
    NSInteger selectedHairHeight;
    NSInteger selectedSkinHeight;
    NSInteger selectedCivilstatusHeight;
    NSInteger selectedSchoolHeight;
    NSInteger selectedProvisionHeight;
    NSInteger selectedCountryHeight;
    NSInteger selectedPrivienceHeight;
    NSInteger selectedReligionHeight;
    NSInteger StartForStateandProvience;
    NSInteger StartForIntrest;
    NSInteger selectedCityHeight;
    
    
    NSString * strSexkeyWord;
    NSString * strSexOrinetationkeyWord;
    NSString * strBodykeyWord;
    NSString * strEyekeyWord;
    NSString * strHairkeyWord;
    NSString * strSkinkeyWord;
    NSString * strCivilstatusKeyWord;
    NSString * strSchoolKeyWord;
    NSString * strCountryKeyWord;
    NSString * strProvienceKeyWord;
    NSString * strStateKeyWord;
    NSString * strRelogionKeyWord;
    NSString * strImageUrl;


    BOOL isShow;
    BOOL clearTable;
    BOOL states;
    BOOL isFromimagePicker;
    BOOL ImageSelected;


    UITableView * tblIntrests;
}
@property (nonatomic, strong) NSString * strisFrom;

@end
