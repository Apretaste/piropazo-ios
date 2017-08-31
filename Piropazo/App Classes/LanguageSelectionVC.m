//
//  LanguageSelectionVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "LanguageSelectionVC.h"
#import "TSLanguageManager.h"

@interface LanguageSelectionVC ()

@end

@implementation LanguageSelectionVC

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setFrame];
}

#pragma mark - FramesSetting
-(void)setFrame {
    
    UIImageView * imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
    imgBack.userInteractionEnabled = YES;
    imgBack.backgroundColor = [UIColor clearColor];
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
   /* UIView * viewTransperent = [[UIView alloc]initWithFrame:CGRectMake(40, 40, DEVICE_WIDTH-80,imgBack.frame.size.height-40-50)];
    viewTransperent.backgroundColor = [UIColor whiteColor];
    viewTransperent.alpha = 0.9;
    viewTransperent.userInteractionEnabled  = YES;
    viewTransperent.layer.cornerRadius = 3;*/
    
    UIImageView * imgBackTrans = [[UIImageView alloc]initWithFrame:CGRectMake(40, 40, DEVICE_WIDTH-80,imgBack.frame.size.height-40-50)];
    imgBackTrans.userInteractionEnabled = YES;
    imgBackTrans.backgroundColor = [UIColor clearColor];
    imgBackTrans.image = [UIImage imageNamed:@"Transperent-box.png"];
    [imgBack addSubview:imgBackTrans];
    
    int yy = 20;
    
    UILabel * lblTiltle = [[UILabel alloc]initWithFrame:CGRectMake(0, yy, imgBackTrans.frame.size.width, 60)];
    lblTiltle.text = @"Please select\nyour language";
     lblTiltle.numberOfLines = 2;
    lblTiltle.textAlignment = NSTextAlignmentCenter;
    lblTiltle.textColor = lightGayColor;
    lblTiltle.font = [UIFont systemFontOfSize:23];
    [imgBackTrans addSubview:lblTiltle];
  
    yy = yy+60+20;

    lblSelectLanguage = [[UILabel alloc]initWithFrame:CGRectMake(30, yy, imgBackTrans.frame.size.width-60, 40)];
    lblSelectLanguage.text  = @"Select your language";
    lblSelectLanguage.backgroundColor = [UIColor whiteColor];
    lblSelectLanguage.textColor = darkGayColor;
    lblSelectLanguage.userInteractionEnabled = YES;
    lblTiltle.font = [UIFont systemFontOfSize:23];
    [imgBackTrans addSubview:lblSelectLanguage ];
    
    btnSelect = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSelect .frame = CGRectMake(30, yy, imgBackTrans.frame.size.width-60, 40);
//    btnSelect.backgroundImage=;
    [btnSelect setBackgroundImage:[APP_DELEGATE imageFromColor:[UIColor clearColor]] forState:UIControlStateNormal];
//    [btnSelect setTitle:@"▼" forState:UIControlStateNormal];
    [btnSelect addTarget:self action:@selector(btnLangugeSelect:) forControlEvents:UIControlEventTouchUpInside];
    [imgBackTrans addSubview:btnSelect];
    
     imgDDicon = [[UIImageView alloc]initWithFrame:CGRectMake(lblSelectLanguage.frame.size.width-30, (lblSelectLanguage.frame.size.height/2)-(15/2), 15, 15)];
    imgDDicon.backgroundColor = [UIColor redColor];
    imgDDicon.image = [UIImage imageNamed:@"▼"];
    [lblSelectLanguage addSubview:imgDDicon];
    
    yy = yy+40+80+20;
    
    UIButton * btnContinue= [UIButton buttonWithType:UIButtonTypeCustom];
    btnContinue.frame = CGRectMake(30,yy,  imgBackTrans.frame.size.width-60,40);
    [btnContinue setTitle:@"Continue" forState:UIControlStateNormal];
//    [btnContinue setBackgroundColor:violetgreenColor];
    [btnContinue setBackgroundImage:[APP_DELEGATE imageFromColor:violetgreenColor] forState:UIControlStateNormal];
    btnContinue.layer.cornerRadius = 0.5;
    [btnContinue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnContinue addTarget:self action:@selector(btnContinueClicked:) forControlEvents:UIControlEventTouchUpInside];
    [imgBackTrans addSubview:btnContinue];
 
}
#pragma mark - ActionClicked
-(void)btnLangugeSelect:(UIButton *)sender {
    
    /*if ([sender tag] == 0) {
        sender.tag = 1;
        tblListview.hidden = NO;
        imgDDicon.image = [UIImage imageNamed:@"▲"];
    }
    else {
        sender.tag = 0;
       tblListview.hidden = YES;
       imgDDicon.image = [UIImage imageNamed:@"▼"];
    }*/
    {
        NSArray * arr = [[NSArray alloc] init];
        arr = [NSArray arrayWithObjects:@"Spanish", @"English",nil];
        NSArray * arrImage = [[NSArray alloc] init];
        arrImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"Cuba.png"], [UIImage imageNamed:@"United_States_of_America.png"],  nil];
        if(dropDown == nil) {
            CGFloat f = 200;
            dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
            dropDown.delegate = self;
        }
        else {
            [dropDown hideDropDown:sender];
            [self rel];
         
        }
    }
}

-(void)btnContinueClicked:(id)sender {
    
    if ([lblSelectLanguage.text isEqualToString:@""] && [lblSelectLanguage.text isEqualToString:@"Select your language"] ) {
        URBAlertView * alert =[[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Please Select language" cancelButtonTitle:OK_BTN otherButtonTitles:nil, nil];
        [alert showWithAnimation:URBAlertAnimationTopToBottom];
    }
    else {
        ValidateEmailVC * Email = [[ValidateEmailVC alloc]init];
        [self.navigationController pushViewController:Email animated:YES];
    }
}
#pragma mark-Delegate
- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    NSLog(@"%@", btnSelect.titleLabel.text);
    [self rel];
    
    lblSelectLanguage .text  = btnSelect.titleLabel.text;
    imgDDicon.backgroundColor = [UIColor greenColor];

    //    btnSelect.titleLabel.text = nil;
}
-(void)rel{
    dropDown = nil;
}
#pragma mark - CleanUp
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
