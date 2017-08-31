//
//  ChatVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "ChatVC.h"
//#define messageWidth 280
//#define kInputHeight 60.0f
//#define kLineHeight 30.0f
//#define kButtonWidth 78.0f

@interface ChatVC ()

@end

@implementation ChatVC

#pragma mark - Life Cycle
@synthesize dicUserdetails,last_inseted_chat_id,isFromChat,StrNameOtherUser,dicOtherUserProfile;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    changeLanguage = NO;
    //imgUnreadMessageCount.hidden = YES;
    //lblUnreadCount.hidden = YES;
    last_inseted_chat_id = @"-1";

    NSLog(@"dicUserdetails==>%@",dicUserdetails);
    
    arrayGetMessages = [[NSMutableArray alloc]init];
    
    [self GetMessagesWebapi];

    [self setFrame];
    [self setNavigationViewFrames];

    [self registerNotification];
    [self setUpTextFieldforIphone];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated {
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    appDelegate.isOnChatScreen = YES;
    isfromResponse = NO;
    TextStartChange = NO;
    //FromPushnotification = YES;

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CallwebapiforgetMessage" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CallwebapiforgetMessage:) name:@"CallwebapiforgetMessage" object:nil];

//    [timerLoadChatContinuosly invalidate];
//    timerLoadChatContinuosly = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(GetMessagesEveryAfterDelay) userInfo:nil repeats:YES];
}
-(void)CallwebapiforgetMessage:(NSNotification *)notification{
    if ([notification.name isEqualToString:@"CallwebapiforgetMessage"]) {
        NSLog(@"object==>%@",notification.object);
        
 if ([notification.object valueForKey:@"gcm.notification.message_data"]) {
     
     NSString * myDict = [notification.object valueForKey:@"gcm.notification.message_data"];
     //    NSLog(@"newPush==>%@",[myDict valueForKey:@"notification_type"]);
     NSData *data= [myDict dataUsingEncoding:NSUTF8StringEncoding];//viral
     id response=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//viral
     dicUserdetails = [response mutableCopy];
     if([response valueForKey:@"from_username"])
     {
         
         if ([response valueForKey:@"from_username"]!=nil && [response valueForKey:@"from_username"]!=[NSNull null]) {
             NSLog(@"MessageBody==>%@", response);

             FromPushnotification = YES;
             dicOtherUserProfile = [response mutableCopy];
             StrNameOtherUser = [response valueForKey:@"from_username"];
//             StrOtherUserProfile = [response valueForKey:@"from_user_image"];
             [self GetMessagesWebapi];
         }
     }
 }
    }
}
-(void)viewDidDisappear:(BOOL)animated {
    [textView resignFirstResponder];
    appDelegate.isOnChatScreen = NO;
    FromPushnotification = NO;
    isFromChat = @"NO";
    TextStartChange = NO;
    [timerLoadChatContinuosly invalidate];
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
    
    if ([isFromChat isEqualToString:@"YES"]) {
       UIButton * btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
        btnClose.frame=CGRectMake(DEVICE_WIDTH-100, 20, 90,44);
        [btnClose addTarget:self action:@selector(btnCloseClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btnClose setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnClose setTitle:[TSLanguageManager localizedString:@"Close"] forState:UIControlStateNormal];
        [navview addSubview:btnClose];
    }else{
        UIButton * btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnBack setFrame:CGRectMake(0, 20, 44, 44)];
        [btnBack setImage:[UIImage imageNamed:@"back-btn.png"] forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(btnBackClicked:) forControlEvents:UIControlEventTouchUpInside];
        [navview addSubview:btnBack];
    }
}
-(void)setFrame {
    imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64)];
    imgBack.userInteractionEnabled = YES;
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
    viewTransperent = [[UIView alloc]init];
    viewTransperent.frame = CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64);
    [self.view addSubview:viewTransperent];
    
    UIView * viewTranstemp = [[UIView alloc]init];
    viewTranstemp.frame = CGRectMake(0, 0, viewTransperent.frame.size.width,viewTransperent.frame.size.height);
    viewTranstemp.backgroundColor = [UIColor whiteColor];
    viewTranstemp.alpha = 0.5;
    viewTranstemp.userInteractionEnabled  = YES;
    //    viewTransperent.layer.cornerRadius = 5;
    viewTranstemp.clipsToBounds = YES;
    viewTranstemp.layer.shadowColor = [UIColor grayColor].CGColor;
    viewTranstemp.layer.shadowOffset = CGSizeMake(2, 2);
    viewTranstemp.layer.shadowOpacity = 3.0;
    viewTranstemp.layer.shadowRadius = 5.0;
//    viewTranstemp.frame = viewTranstemp.frame;
    [viewTransperent addSubview:viewTranstemp];
    
    tblContent = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,0, 0) style:UITableViewStylePlain];
    tblContent.frame = CGRectMake(0, 0,viewTransperent.frame.size.width, viewTransperent.frame.size.height-60);
    tblContent.showsVerticalScrollIndicator = YES;
    [tblContent setBackgroundColor:[UIColor clearColor]];
    tblContent.showsVerticalScrollIndicator = NO;
    tblContent.clipsToBounds = YES;
    [tblContent setDelegate:self];
    [tblContent setDataSource:self];
    [tblContent setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tblContent.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [viewTransperent addSubview:tblContent];
    
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((imgBack.frame.size.width/2)-(30/2), (imgBack.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
     placeActivityIndicator.color = violetgreenColor;

    [viewTransperent addSubview:placeActivityIndicator];
}

#pragma mark - TextView frame Setting
-(void)setUpTextFieldforIphone
{
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0,DEVICE_HEIGHT-60, DEVICE_WIDTH, 60)];
    containerView.backgroundColor = [UIColor clearColor];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    //[self.view addSubview:containerView];
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(5,10,containerView.frame.size.width-70, 40)];
    textView.returnKeyType = UIReturnKeyDefault; //just as an example
    textView.font = [UIFont systemFontOfSize:16.0f];
    [textView setText:@"Type message here"];
    textView.delegate = self;
    textView.backgroundColor = [UIColor whiteColor];
    [textView setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textView setTextColor:[UIColor grayColor]];
    textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [containerView addSubview:textView];
    
    tempTextView = [[UITextView alloc] init];
    tempTextView.font = textView.font;
    tempTextView.text = @"";
    CGSize size = [tempTextView sizeThatFits:CGSizeMake(textView.frame.size.width, FLT_MAX)];
    currentKeyBoardHight = size.height;
    [self.view addSubview:containerView];
    
    btnSend = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSend.frame = CGRectMake(containerView.frame.size.width - 62,(textView.frame.origin.y+textView.frame.size.height/2)-(44/2), 60, 44);
    btnSend.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    [btnSend setEnabled:NO];
    btnSend.userInteractionEnabled = NO;
    [btnSend addTarget:self action:@selector(btnSendClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnSend setImage:[UIImage imageNamed:@"chat_btn.png"] forState:UIControlStateNormal];
    
    [containerView addSubview:btnSend];
    
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;

}

#pragma mark - Actions
-(void)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnCloseClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)btnSendClicked:(id)sender {
    if ([textView.text length]>0 && ![textView.text isEqualToString:@"Type message here"])
    {
        NSString *rawString = [textView text];
        NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
        
        if ([trimmed length] != 0)
        {
        [self SendMessageWebapi:trimmed];
        }
        else{
            [btnSend setEnabled:NO];
            
            URBAlertView *alertView = [[URBAlertView alloc] initWithTitle:ALERT_TITLE message:@"Please enter message...!" cancelButtonTitle:OK_BTN otherButtonTitles: nil, nil];
            [alertView setMessageFont:[UIFont fontWithName:@"Arial" size:14]];
            [alertView setHandlerBlock:^(NSInteger buttonIndex, URBAlertView *alertView) {
                [alertView hideWithCompletionBlock:^{
                    
                }];
            }];
            [alertView showWithAnimation:URBAlertAnimationTopToBottom];
        }
        
//[viewMessagePopUp removeFromSuperview];
    }
}
-(void)btnFirstTimeClicked:(id)sender {
    UserDetailVC * user = [[UserDetailVC alloc]init];
    NSString * strName = @"";
    
    if ([dicUserdetails valueForKey:@"username"]!=nil && [dicUserdetails valueForKey:@"username"]!=[NSNull null]) {
        strName = [NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"username"]];
    }
    user.strUsername = strName;
    [self.navigationController pushViewController:user animated:YES];
}
-(void)btnUserProfileClicked:(id)sender {
    EditProfileVC * edit = [[EditProfileVC alloc]init];
    edit.strisFrom = @"YES";
    [self.navigationController pushViewController:edit animated:YES];
}
-(void)btnOtherUserProfileClicked:(id)sender {
    UserDetailVC * user = [[UserDetailVC alloc]init];
    if ([arrayGetMessages count]>0) {
        user.strUsername =  [[arrayGetMessages objectAtIndex:[sender tag]]valueForKey:@"username"];
        user.isFromMatchesandChat = @"YES";

        [self.navigationController pushViewController:user animated:YES];
    }
}
#pragma mark - Notification
-(void)registerNotification
{
    [self removeNotification];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"InvalidateChatTimer" object:nil];
}

-(void) keyboardWillShow:(NSNotification *)note
{
    if (arrayGetMessages.count>2)
    {
        [self performSelector:@selector(scrollTableviewAtTop) withObject:nil afterDelay:0.0];
    }
    // get keyboard size and loctaion
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    // get a rect for the textView frame
    CGRect containerFrame = containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
    
    
    currentKeyBoardHight = keyboardBounds.size.height;
    NSLog(@"currentKeyBoardHight===%ld",(long)currentKeyBoardHight);
    CGRect tableviewframe=tblContent.frame;
    
//    tableviewframe.size.height=self.view.bounds.size.height - (keyboardBounds.size.height + 64+60);
    
    tableviewframe.size.height=self.view.bounds.size.height - (keyboardBounds.size.height + 60)-64;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    containerView.frame = containerFrame;
    tblContent.frame=tableviewframe;
    btnSend.frame = CGRectMake(btnSend.frame.origin.x, (textView.frame.origin.y+textView.frame.size.height/2)-(44/2), btnSend.frame.size.width,btnSend.frame.size.height);
    [UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note
{
//    if (arrayGetMessages.count>2)
//    {
//        [self performSelector:@selector(scrollTableviewAtTop) withObject:nil afterDelay:0.0];
//    }
    //[self performSelector:@selector(scrollTableviewAtNone) withObject:nil afterDelay:0.0];

    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    // get a rect for the textView frame
    CGRect containerFrame = containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
    CGRect tableviewframe=tblContent.frame;
    //    tableviewframe.size.height+=260;
    //    tableviewframe.size.height=self.view.bounds.size.height - containerFrame.size.height-100;
//    if(TextStartChange){
//        tableviewframe.size.height=self.view.bounds.size.height -64-80;
//
//    }else{
        tableviewframe.size.height=self.view.bounds.size.height -64-60;
//    }
    currentKeyBoardHight = keyboardBounds.size.height;
    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    // set views with new info
    tblContent.frame=tableviewframe;
    containerView.frame = containerFrame;
    btnSend.frame = CGRectMake(btnSend.frame.origin.x, (textView.frame.origin.y+textView.frame.size.height/2)-(44/2), btnSend.frame.size.width,btnSend.frame.size.height);
    
    [UIView commitAnimations];
}
#pragma mark - Change Scroll Offset
-(void)scrollTableviewAtTop
{
    if ([arrayGetMessages count]>0)
    {
        [tblContent reloadData];
        long lastSection=[tblContent numberOfSections]-1;
        long lastRowNumber =[tblContent numberOfRowsInSection:lastSection]-1;
        
        NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:lastSection];
        
        [tblContent scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

-(void)scrollTableviewAtNone
{
    if ([arrayGetMessages count]>0)
    {
        [tblContent reloadData];
        long lastSection=[tblContent numberOfSections]-1;
        long lastRowNumber =[tblContent numberOfRowsInSection:lastSection]-1;
        
        NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:lastSection];
        
        [tblContent scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
}
#pragma mark - uitableviewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([arrayGetMessages count]==0) {
        if(isfromResponse){
            return 1;
        }else{
            return 0;
        }
    }
    return [arrayGetMessages count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([arrayGetMessages count]==0) {
        if (isfromResponse) {
            return  tblContent.frame.size.height;

        }else{
            return 0;
        }
    }
    else{
        NSInteger yy = 10;
        NSInteger heightMessage = 0;
        
        if ([arrayGetMessages count]>0)
        {
            if ([[arrayGetMessages objectAtIndex:indexPath.row] valueForKey:@"text"] != [NSNull null])
            {
                if ([[arrayGetMessages objectAtIndex:indexPath.row] valueForKey:@"text"] != [NSNull null])
                {
                    NSString * strUserText = [NSString stringWithFormat:@"%@",[[arrayGetMessages objectAtIndex:indexPath.row] valueForKey:@"text"]];
                    
                    CGSize messageSize;
                    messageSize = [self getSizeForText:strUserText andWidth:viewTransperent.frame.size.width-80  andFontName:@"Helvetica" andFontSize:16];
                    heightMessage = messageSize.height;
                    
                    yy = yy+heightMessage+20;
                    
                    //                    if (yy<65)
                    //                    {
                    //                        yy = 65;
                    //                    }
                }
                
            }
        }
        
        return yy;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = nil;
    
    ChatMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ChatMessageCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([arrayGetMessages count]==0) {
        
        imgBorderFirstTime.hidden = NO;
        imgProfileFirstTime.hidden = NO;
        btnFirstTime.hidden = NO;
        lblMessageFirstTime.hidden = NO;
        cell.imgUser.hidden = YES;
        cell.imgBorder.hidden = YES;
        cell.imgOtherUser.hidden = YES;
        cell.imgOtherUserBorder.hidden = YES;
        cell.viewMessagePopUp.hidden = YES;
        cell.btnUserProfile.hidden = YES;
        cell.btnOtherUserProfile.hidden = YES;
        
        imgBorderFirstTime = [[UIImageView alloc]initWithFrame:CGRectMake((viewTransperent.frame.size.width/2)-(172/2), 80, 172, 172)];
        imgBorderFirstTime.clipsToBounds=YES;
        imgBorderFirstTime.layer.cornerRadius = imgBorderFirstTime.frame.size.width/2;
        imgBorderFirstTime.image = [UIImage imageNamed:@"female-circle.png"];
        imgBorderFirstTime.layer.masksToBounds = NO;
        imgBorderFirstTime.layer.shadowOffset = CGSizeMake(0.1, 0.1);
        imgBorderFirstTime.layer.shadowRadius = 6.0;
        imgBorderFirstTime.layer.shadowOpacity = 0.4;
        [viewTransperent addSubview:imgBorderFirstTime];
        
        NSString * strGender = @"";
        
        if ([dicUserdetails valueForKey:@"gender"]!=nil && [dicUserdetails valueForKey:@"gender"]!=[NSNull null]) {
            strGender = [dicUserdetails valueForKey:@"gender"];
        }
        if ([strGender isEqualToString:@"F"]) {
            imgBorderFirstTime.image = [UIImage imageNamed:@"female-circle.png"];
        }
        else {
            imgBorderFirstTime.image = [UIImage imageNamed:@"male-circle.png"];
        }
        
        imgProfileFirstTime = [[UIImageView alloc]initWithFrame:CGRectMake((viewTransperent.frame.size.width/2)-(152/2), 80+10, 152, 152)];
        imgProfileFirstTime.clipsToBounds=YES;
        imgProfileFirstTime.layer.cornerRadius = imgProfileFirstTime.frame.size.width/2;
        [imgProfileFirstTime setContentMode:UIViewContentModeScaleAspectFill];
        if ([dicUserdetails valueForKey:@"picture_public"]!=nil && [dicUserdetails valueForKey:@"picture_public"]!=[NSNull null] && ![[dicUserdetails valueForKey:@"picture_public"]isEqualToString:@""]){
            NSString * strPhoto = [dicUserdetails valueForKey:@"picture_public"];
            
            if ([strGender isEqualToString:@"F"])
            {
                [imgProfileFirstTime setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
            }else{
                [imgProfileFirstTime setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            }
            
        }else{
            if ([strGender isEqualToString:@"F"])
            {
                imgProfileFirstTime.image = [UIImage imageNamed:@"female_avtar.png"];
            }
            else
            {
                imgProfileFirstTime.image = [UIImage imageNamed:@"male_avtar.png"];
            }
        }
        [viewTransperent addSubview:imgProfileFirstTime];
        
        btnFirstTime = [UIButton buttonWithType:UIButtonTypeCustom];
        btnFirstTime.frame = imgProfileFirstTime.frame;
        btnFirstTime.backgroundColor = [UIColor clearColor];
        [btnFirstTime addTarget:self action:@selector(btnFirstTimeClicked:) forControlEvents:UIControlEventTouchUpInside];
        [viewTransperent addSubview:btnFirstTime];
        
        NSString * strName = @"";
        
        if ([dicUserdetails valueForKey:@"username"]!=nil && [dicUserdetails valueForKey:@"username"]!=[NSNull null]) {
            strName = [NSString stringWithFormat:@"@%@",[dicUserdetails valueForKey:@"username"]];
        }
        
        lblMessageFirstTime = [[UILabel alloc]initWithFrame:CGRectMake(20,300,viewTransperent.frame.size.width-40, 100)];
        lblMessageFirstTime.numberOfLines = 0;
        lblMessageFirstTime.textColor = [UIColor blackColor];
        lblMessageFirstTime.backgroundColor = [UIColor clearColor];
        lblMessageFirstTime.text = @"";
        lblMessageFirstTime.textAlignment = NSTextAlignmentCenter;
        [viewTransperent addSubview:lblMessageFirstTime];
        
        lblMessageFirstTime.text = [NSString stringWithFormat:@"Write the first text to start a conversation with %@",strName];
        
        NSRange range = [lblMessageFirstTime.text rangeOfString:strName];
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]  initWithString:lblMessageFirstTime.text];
        [attributedString addAttribute:NSForegroundColorAttributeName value:violetgreenColor range:range];
        lblMessageFirstTime.attributedText = attributedString;
        
        tblContent.scrollEnabled = NO;
    }
    else{
        
        imgBorderFirstTime.hidden = YES;
        imgProfileFirstTime.hidden = YES;
        btnFirstTime.hidden = YES;
        lblMessageFirstTime.hidden = YES;
        cell.viewMessagePopUp.hidden = NO;
        
        tblContent.scrollEnabled = YES;
        
        if ([[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"text"] != [NSNull null] && [[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"text"]!=nil)
        {
            NSString * strUserText = [NSString stringWithFormat:@"%@",[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"text"]];
            
            CGSize messageSize;
            NSString *strMessage;
            NSInteger heightMessage;
            strMessage = strUserText;
            messageSize = [self getSizeForText:strMessage andWidth:viewTransperent.frame.size.width-80 andFontName:@"Helvetica" andFontSize:16];
            heightMessage = messageSize.height;
            
            if ([[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"username"] isEqualToString:CURRENT_USER_FIRST_NAME])
            {
                cell.imgUser.hidden = NO;
                cell.imgBorder.hidden = NO;
                cell.imgOtherUserBorder.hidden = YES;
                cell.imgOtherUser.hidden = YES;
                cell.btnUserProfile.hidden = NO;
                cell.btnOtherUserProfile.hidden = YES;
                
                if ([arrayGetMessages count]>0) {
                    if (indexPath.row >0) {
                        if ([[[arrayGetMessages objectAtIndex:indexPath.row-1 ]valueForKey:@"username"]isEqualToString:[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"username"]]) {
                            cell.imgUser.hidden = YES;
                            cell.imgBorder.hidden = YES;
                        }else{
                            cell.imgUser.hidden = NO;
                            cell.imgBorder.hidden = NO;
                        }
                    }
                    
                    [cell.lblMessage setTextAlignment:NSTextAlignmentRight];
                    [cell.lblMessage setFrame:CGRectMake(viewTransperent.frame.origin.x+17, 12,  viewTransperent.frame.size.width-80, heightMessage+5)];
                    [cell.viewMessagePopUp setFrame:CGRectMake(viewTransperent.frame.origin.x+10, 5, viewTransperent.frame.size.width-67, heightMessage+20)];
                    [cell.imgBorder setFrame:CGRectMake(self.view.frame.size.width-50, 12+heightMessage-2-35+10, 40, 40)];
                    
                    [cell.imgUser setFrame:CGRectMake(self.view.frame.size.width-49, 13+heightMessage-2-35+10, 38, 38)];
                    cell.imgBorder.layer.cornerRadius = cell.imgBorder.frame.size.width/2;
                    cell.imgUser.layer.cornerRadius = cell.imgUser.frame.size.width/2;
                    cell.btnUserProfile.frame = cell.imgBorder.frame;
                }
                
                cell.imgBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
                
                if (![USER_IMAGE isEqualToString:@""]) {
                    
                    if ([GENDER_STATUS isEqualToString:@"M"]) {
                        
                        cell.imgBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
                        
                        //                        [cell.imgUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
                        cell.imgUser.image = [UIImage imageNamed:@"male_avtar.png"];
                        cell.imgUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",USER_IMAGE]];
                        
                    }else{
                        
                        cell.imgBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
                        
                        //                        [cell.imgUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
                        
                        cell.imgUser.image = [UIImage imageNamed:@"female_avtar.png"];
                        cell.imgUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",USER_IMAGE]];
                        
                    }
                    
                }else{
                    if ([GENDER_STATUS isEqualToString:@"M"]) {
                        cell.imgBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
                    }
                    else if([GENDER_STATUS isEqualToString:@"F"])
                    {
                        cell.imgBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
                    }
                }
            }
            else
            {
                cell.imgUser.hidden = YES;
                cell.viewMessagePopUp.hidden = NO;
                cell.imgBorder.hidden = YES;
                cell.imgOtherUserBorder.hidden = NO;
                cell.imgOtherUser.hidden = NO;
                cell.btnUserProfile.hidden = YES;
                cell.btnOtherUserProfile.hidden = NO;
                
                if ([arrayGetMessages count]>0) {
                    
                    if (indexPath.row >0) {
                        if ([[[arrayGetMessages objectAtIndex:indexPath.row-1 ]valueForKey:@"username"]isEqualToString:[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"username"]]) {
                            cell.imgOtherUser.hidden = YES;
                            cell.imgOtherUserBorder.hidden = YES;
                        }else{
                            cell.imgOtherUserBorder.hidden = NO;
                            cell.imgOtherUserBorder.hidden = NO;
                        }
                    }
                }
                
                [cell.lblMessage setTextAlignment:NSTextAlignmentLeft];
                
                [cell.lblMessage setFrame:CGRectMake(70, 12, viewTransperent.frame.size.width-80, heightMessage+5)];
                [cell.viewMessagePopUp setFrame:CGRectMake(60, 5,viewTransperent.frame.size.width-70, heightMessage+20)];
                
                [cell.imgOtherUserBorder setFrame:CGRectMake(10, 12+heightMessage-35+10, 40, 40)];
                
                [cell.imgOtherUser setFrame:CGRectMake(11, 13+heightMessage-35+10, 38, 38)];
                
                cell.imgOtherUserBorder.layer.cornerRadius = cell.imgOtherUserBorder.frame.size.width/2;
                cell.imgOtherUser.layer.cornerRadius = cell.imgOtherUser.frame.size.width/2;
                
                cell.btnOtherUserProfile.frame = cell.imgOtherUserBorder.frame;
                
                NSString * strGender = @"";
                if ([isFromChat isEqualToString:@"YES"] || FromPushnotification) {
                    if ([dicOtherUserProfile valueForKey:@"from_user_gender"]!=nil && [dicOtherUserProfile valueForKey:@"from_user_gender"]!=[NSNull null]) {
                        strGender = [dicOtherUserProfile valueForKey:@"from_user_gender"];
                    }
                    if ([strGender isEqualToString:@"F"]) {
                        cell.imgOtherUserBorder.image = [UIImage imageNamed:@"female-circle.png"];
                    }
                    else {
                        cell.imgOtherUserBorder.image = [UIImage imageNamed:@"male-circle.png"];
                    }
                    if ([dicOtherUserProfile valueForKey:@"from_user_image"]!=nil && [dicOtherUserProfile valueForKey:@"from_user_image"]!=[NSNull null] && ![[dicOtherUserProfile valueForKey:@"from_user_image"]isEqualToString:@""]){
                        NSString * strPhoto = [dicOtherUserProfile valueForKey:@"from_user_image"];
                        
                        if ([strGender isEqualToString:@"F"])
                        {
                            
                            //                        [cell.imgOtherUser setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
                            
                            cell.imgOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
                            
                            cell.imgOtherUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[dicOtherUserProfile valueForKey:@"from_user_image"]]];
                            
                        }else{
                            //                        [cell.imgOtherUser setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
                            cell.imgOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];
                            
                            cell.imgOtherUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[dicOtherUserProfile valueForKey:@"from_user_image"]]];
                            
                        }
                        
                    }else{
                        if ([strGender isEqualToString:@"F"])
                        {
                            cell.imgOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
                        }
                        else
                        {
                            cell.imgOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];
                        }
                    }
                    
                }else{
                    if ([dicUserdetails valueForKey:@"gender"]!=nil && [dicUserdetails valueForKey:@"gender"]!=[NSNull null]) {
                        strGender = [dicUserdetails valueForKey:@"gender"];
                    }
                    if ([strGender isEqualToString:@"F"]) {
                        cell.imgOtherUserBorder.image = [UIImage imageNamed:@"female-circle.png"];
                    }
                    else {
                        cell.imgOtherUserBorder.image = [UIImage imageNamed:@"male-circle.png"];
                    }
                    if ([dicUserdetails valueForKey:@"picture_public"]!=nil && [dicUserdetails valueForKey:@"picture_public"]!=[NSNull null] && ![[dicUserdetails valueForKey:@"picture_public"]isEqualToString:@""]){
                        NSString * strPhoto = [dicUserdetails valueForKey:@"picture_public"];
                        
                        if ([strGender isEqualToString:@"F"])
                        {
                            
                            //                        [cell.imgOtherUser setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
                            
                            cell.imgOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
                            
                            cell.imgOtherUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"picture_public"]]];
                            
                        }else{
                            //                        [cell.imgOtherUser setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
                            cell.imgOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];
                            
                            cell.imgOtherUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"picture_public"]]];
                            
                        }
                        
                    }else{
                        if ([strGender isEqualToString:@"F"])
                        {
                            cell.imgOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
                        }
                        else
                        {
                            cell.imgOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];
                        }
                    }
                    
                }
 
                }
                cell.lblMessage.text = [NSString stringWithFormat:@"%@",strMessage];
            
            [cell.btnUserProfile addTarget:self action:@selector(btnUserProfileClicked:) forControlEvents:UIControlEventTouchUpInside];
            cell.btnOtherUserProfile.tag = indexPath.row;
            [cell.btnOtherUserProfile addTarget:self action:@selector(btnOtherUserProfileClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return cell;
}
/*{
     NSString *cellIdentifier = nil;
    
    ChatMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:
                         cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[ChatMessageCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([arrayGetMessages count]==0) {
        
        imgBorderFirstTime.hidden = NO;
        imgProfileFirstTime.hidden = NO;
        btnFirstTime.hidden = NO;
        lblMessageFirstTime.hidden = NO;
        cell.imgUser.hidden = YES;
        cell.imgBorder.hidden = YES;
        cell.imgOtherUser.hidden = YES;
        cell.imgOtherUserBorder.hidden = YES;
        cell.viewMessagePopUp.hidden = YES;
        cell.btnUserProfile.hidden = YES;
        cell.btnOtherUserProfile.hidden = YES;
        
        imgBorderFirstTime = [[UIImageView alloc]initWithFrame:CGRectMake((viewTransperent.frame.size.width/2)-(172/2), 80, 172, 172)];
        imgBorderFirstTime.clipsToBounds=YES;
        imgBorderFirstTime.layer.cornerRadius = imgBorderFirstTime.frame.size.width/2;
        imgBorderFirstTime.image = [UIImage imageNamed:@"female-circle.png"];
        imgBorderFirstTime.layer.masksToBounds = NO;
        imgBorderFirstTime.layer.shadowOffset = CGSizeMake(0.1, 0.1);
        imgBorderFirstTime.layer.shadowRadius = 6.0;
        imgBorderFirstTime.layer.shadowOpacity = 0.4;
        [viewTransperent addSubview:imgBorderFirstTime];
        
        NSString * strGender = @"";
        
        if ([dicUserdetails valueForKey:@"gender"]!=nil && [dicUserdetails valueForKey:@"gender"]!=[NSNull null]) {
            strGender = [dicUserdetails valueForKey:@"gender"];
        }
        if ([strGender isEqualToString:@"F"]) {
            imgBorderFirstTime.image = [UIImage imageNamed:@"female-circle.png"];
        }
        else {
            imgBorderFirstTime.image = [UIImage imageNamed:@"male-circle.png"];
        }
        
        imgProfileFirstTime = [[UIImageView alloc]initWithFrame:CGRectMake((viewTransperent.frame.size.width/2)-(152/2), 80+10, 152, 152)];
        imgProfileFirstTime.clipsToBounds=YES;
        imgProfileFirstTime.layer.cornerRadius = imgProfileFirstTime.frame.size.width/2;
        [imgProfileFirstTime setContentMode:UIViewContentModeScaleAspectFill];
        if ([dicUserdetails valueForKey:@"picture_public"]!=nil && [dicUserdetails valueForKey:@"picture_public"]!=[NSNull null] && ![[dicUserdetails valueForKey:@"picture_public"]isEqualToString:@""]){
            NSString * strPhoto = [dicUserdetails valueForKey:@"picture_public"];

            if ([strGender isEqualToString:@"F"])
            {
                [imgProfileFirstTime setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
            }else{
                [imgProfileFirstTime setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
            }
            
        }else{
            if ([strGender isEqualToString:@"F"])
            {
                imgProfileFirstTime.image = [UIImage imageNamed:@"female_avtar.png"];
            }
            else
            {
                imgProfileFirstTime.image = [UIImage imageNamed:@"male_avtar.png"];
            }
        }
        [viewTransperent addSubview:imgProfileFirstTime];
        
        btnFirstTime = [UIButton buttonWithType:UIButtonTypeCustom];
        btnFirstTime.frame = imgProfileFirstTime.frame;
        btnFirstTime.backgroundColor = [UIColor clearColor];
        [btnFirstTime addTarget:self action:@selector(btnFirstTimeClicked:) forControlEvents:UIControlEventTouchUpInside];
        [viewTransperent addSubview:btnFirstTime];
 
        NSString * strName = @"";
        
        if ([dicUserdetails valueForKey:@"username"]!=nil && [dicUserdetails valueForKey:@"username"]!=[NSNull null]) {
            strName = [NSString stringWithFormat:@"@%@",[dicUserdetails valueForKey:@"username"]];
        }
        
        lblMessageFirstTime = [[UILabel alloc]initWithFrame:CGRectMake(20,300,viewTransperent.frame.size.width-40, 100)];
        lblMessageFirstTime.numberOfLines = 0;
        lblMessageFirstTime.textColor = [UIColor blackColor];
        lblMessageFirstTime.backgroundColor = [UIColor clearColor];
        lblMessageFirstTime.text = @"";
        lblMessageFirstTime.textAlignment = NSTextAlignmentCenter;
        [viewTransperent addSubview:lblMessageFirstTime];
        
        lblMessageFirstTime.text = [NSString stringWithFormat:@"Write the first text to start a conversation with %@",strName];
        
        NSRange range = [lblMessageFirstTime.text rangeOfString:strName];
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]  initWithString:lblMessageFirstTime.text];
        [attributedString addAttribute:NSForegroundColorAttributeName value:violetgreenColor range:range];
        lblMessageFirstTime.attributedText = attributedString;
        
        tblContent.scrollEnabled = NO;
    }
    else{
        
        imgBorderFirstTime.hidden = YES;
        imgProfileFirstTime.hidden = YES;
        btnFirstTime.hidden = YES;
        lblMessageFirstTime.hidden = YES;
        cell.viewMessagePopUp.hidden = NO;
       
        tblContent.scrollEnabled = YES;
        
        if ([[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"text"] != [NSNull null] && [[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"text"]!=nil)
        {
            NSString * strUserText = [NSString stringWithFormat:@"%@",[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"text"]];
            
            CGSize messageSize;
            NSString *strMessage;
            NSInteger heightMessage;
            strMessage = strUserText;
            messageSize = [self getSizeForText:strMessage andWidth:viewTransperent.frame.size.width-60 andFontName:@"Helvetica" andFontSize:16];
            heightMessage = messageSize.height;
            
            if ([[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"username"] isEqualToString:CURRENT_USER_FIRST_NAME])
            {
                cell.imgUser.hidden = NO;
                cell.imgBorder.hidden = NO;
                cell.imgOtherUserBorder.hidden = YES;
                cell.imgOtherUser.hidden = YES;
                cell.btnUserProfile.hidden = NO;
                cell.btnOtherUserProfile.hidden = YES;
                
                if ([arrayGetMessages count]>0) {
                    
                    if (indexPath.row >0) {
                        if ([[[arrayGetMessages objectAtIndex:indexPath.row-1 ]valueForKey:@"username"]isEqualToString:[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"username"]]) {
                            cell.imgUser.hidden = YES;
                            cell.imgBorder.hidden = YES;
                        }else{
                            cell.imgUser.hidden = NO;
                            cell.imgBorder.hidden = NO;
                        }
                    }
                   
                    [cell.lblMessage setTextAlignment:NSTextAlignmentRight];
                    [cell.lblMessage setFrame:CGRectMake(viewTransperent.frame.origin.x+20, 12,  viewTransperent.frame.size.width-85, heightMessage+5)];
                    [cell.viewMessagePopUp setFrame:CGRectMake(viewTransperent.frame.origin.x+10, 5, viewTransperent.frame.size.width-65, heightMessage+20)];
                    [cell.imgBorder setFrame:CGRectMake(self.view.frame.size.width-45, 12+heightMessage-2-33+10, 48, 48)];

                    [cell.imgUser setFrame:CGRectMake(self.view.frame.size.width-44, 13+heightMessage-2-33+10, 45, 45)];
                    cell.imgBorder.layer.cornerRadius = cell.imgBorder.frame.size.width/2;
                    cell.imgUser.layer.cornerRadius = cell.imgUser.frame.size.width/2;
                    cell.btnUserProfile.frame = cell.imgBorder.frame;
                }
                
                cell.imgBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
                
                if (![USER_IMAGE isEqualToString:@""]) {
                    
                    if ([GENDER_STATUS isEqualToString:@"M"]) {
                        
                        cell.imgBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
                        
//                        [cell.imgUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
                        cell.imgUser.image = [UIImage imageNamed:@"male_avtar.png"];
                          cell.imgUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",USER_IMAGE]];
                        
                    }else{
                        
                        cell.imgBorder.image = [UIImage imageNamed:@"female-circle_small.png"];

//                        [cell.imgUser setImageWithURL:[NSURL URLWithString:USER_IMAGE] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
                        
                        cell.imgUser.image = [UIImage imageNamed:@"female_avtar.png"];
                        cell.imgUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",USER_IMAGE]];
                        
                    }
                    
                }else{
                    if ([GENDER_STATUS isEqualToString:@"M"]) {
                        cell.imgBorder.image = [UIImage imageNamed:@"male-circle_small.png"];
                    }
                    else if([GENDER_STATUS isEqualToString:@"F"])
                    {
                        cell.imgBorder.image = [UIImage imageNamed:@"female-circle_small.png"];
                    }
                }
            }
            else
            {
                cell.imgUser.hidden = YES;
                cell.viewMessagePopUp.hidden = NO;
                cell.imgBorder.hidden = YES;
                cell.imgOtherUserBorder.hidden = NO;
                cell.imgOtherUser.hidden = NO;
                cell.btnUserProfile.hidden = YES;
                cell.btnOtherUserProfile.hidden = NO;

                if ([arrayGetMessages count]>0) {

                    if (indexPath.row >0) {
                        if ([[[arrayGetMessages objectAtIndex:indexPath.row-1 ]valueForKey:@"username"]isEqualToString:[[arrayGetMessages objectAtIndex:indexPath.row ] valueForKey:@"username"]]) {
                            cell.imgOtherUser.hidden = YES;
                            cell.imgOtherUserBorder.hidden = YES;
                        }else{
                            cell.imgOtherUserBorder.hidden = NO;
                            cell.imgOtherUserBorder.hidden = NO;
                        }
                    }
                }

                [cell.lblMessage setTextAlignment:NSTextAlignmentLeft];
                
                [cell.lblMessage setFrame:CGRectMake(80, 12, viewTransperent.frame.size.width-100, heightMessage+5)];
                    [cell.viewMessagePopUp setFrame:CGRectMake(70, 5,viewTransperent.frame.size.width-80, heightMessage+20)];

                [cell.imgOtherUserBorder setFrame:CGRectMake(10, 10+heightMessage-33+8, 48, 48)];

                [cell.imgOtherUser setFrame:CGRectMake(11, 11+heightMessage-33+8, 45, 45)];
                
                cell.imgOtherUserBorder.layer.cornerRadius = cell.imgOtherUserBorder.frame.size.width/2;
                cell.imgOtherUser.layer.cornerRadius = cell.imgOtherUser.frame.size.width/2;

                cell.btnOtherUserProfile.frame = cell.imgOtherUserBorder.frame;

                NSString * strGender = @"";
                
                if ([dicUserdetails valueForKey:@"gender"]!=nil && [dicUserdetails valueForKey:@"gender"]!=[NSNull null]) {
                    strGender = [dicUserdetails valueForKey:@"gender"];
                }
                if ([strGender isEqualToString:@"F"]) {
                    cell.imgOtherUserBorder.image = [UIImage imageNamed:@"female-circle.png"];
                }
                else {
                    cell.imgOtherUserBorder.image = [UIImage imageNamed:@"male-circle.png"];
                }
                if ([dicUserdetails valueForKey:@"picture_public"]!=nil && [dicUserdetails valueForKey:@"picture_public"]!=[NSNull null] && ![[dicUserdetails valueForKey:@"picture_public"]isEqualToString:@""]){
                    NSString * strPhoto = [dicUserdetails valueForKey:@"picture_public"];
                    
                    if ([strGender isEqualToString:@"F"])
                    {
                        
//                        [cell.imgOtherUser setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"female_avtar.png"]];
                        
                        cell.imgOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];

                        cell.imgOtherUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"picture_public"]]];

                    }else{
//                        [cell.imgOtherUser setImageWithURL:[NSURL URLWithString:strPhoto] placeholderImage:[UIImage imageNamed:@"male_avtar.png"]];
                        cell.imgOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];

                        cell.imgOtherUser.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"picture_public"]]];

                    }
                    
                }else{
                    if ([strGender isEqualToString:@"F"])
                    {
                        cell.imgOtherUser.image = [UIImage imageNamed:@"female_avtar.png"];
                    }
                    else
                    {
                        cell.imgOtherUser.image = [UIImage imageNamed:@"male_avtar.png"];
                    }
                }

            }
            cell.lblMessage.text = [NSString stringWithFormat:@"%@",strMessage];
            
            [cell.btnUserProfile addTarget:self action:@selector(btnUserProfileClicked:) forControlEvents:UIControlEventTouchUpInside];
            cell.btnOtherUserProfile.tag = indexPath.row;
            [cell.btnOtherUserProfile addTarget:self action:@selector(btnOtherUserProfileClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return cell;
}*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [textView resignFirstResponder];
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.25];
//    containerView.frame = CGRectMake(containerView.frame.origin.x, DEVICE_HEIGHT-currentKeyBoardHight-containerView.frame.size.height, containerView.frame.size.width,containerView.frame.size.height);
//    tblContent.frame=CGRectMake(tblContent.frame.origin.x, tblContent.frame.origin.y, tblContent.frame.size.width,tblContent.frame.size.height-currentKeyBoardHight);
//    [UIView commitAnimations];
//    [self scrollTableviewAtNone];
}
#pragma mark - TextView delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return textView.text.length + (text.length - range.length) <= 145;
}

-(void)textViewDidBeginEditing:(UITextView *)textView1
{
    if (textView1==textView)
    {
        if ([textView.text isEqualToString:@"Type message here"]) {
            textView.text = @"";
            [textView setTextColor:[UIColor darkGrayColor]];
            [btnSend setEnabled:NO];
            btnSend.userInteractionEnabled = NO;
        }else{
            [textView setTextColor:[UIColor blackColor]];
            [btnSend setEnabled:YES];
            btnSend.userInteractionEnabled = YES;
        }
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView1
{
    if (textView1==textView)
    {
        if ([textView.text isEqualToString:@""])
        {
            [textView setText:@"Type message here"];
            [textView setTextColor:[UIColor lightGrayColor]];
            [btnSend setEnabled:NO];
            btnSend.userInteractionEnabled = NO;
        }
    }
//    containerView.frame = CGRectMake(0,DEVICE_HEIGHT-60, DEVICE_WIDTH, 60+textView.frame.size.height);
}

- (void)textViewDidChange:(UITextView *)textView1
{
    if (textView1==textView)
    {
        if ([textView1.text length]>0) {
            [btnSend setEnabled:YES];
            btnSend.userInteractionEnabled = YES;
        }else{
            [btnSend setEnabled:NO];
            btnSend.userInteractionEnabled = NO;
        }
        
        CGFloat maxHeight = 100.0f;
        CGFloat fixedWidth = textView1.frame.size.width;
        CGSize newSize = [textView1 sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
        CGRect newFrame = textView1.frame;
        newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), fminf(newSize.height, maxHeight));
        
        textView1.frame = newFrame;
        TextStartChange = YES;
        containerView.frame = CGRectMake(0.0f, DEVICE_HEIGHT - textView1.frame.size.height-currentKeyBoardHight-20, containerView.frame.size.width, textView1.frame.size.height+20 );
        
        btnSend.frame = CGRectMake(btnSend.frame.origin.x, (textView1.frame.origin.y+textView1.frame.size.height/2)-(44/2), btnSend.frame.size.width,btnSend.frame.size.height);
        
       // [tblContent beginUpdates];
//        [tblContent endUpdates];
    }
}
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
// replacementText:(NSString *)text
//{
//    
//    textView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);//prabhu
//    
//    
//    
//    if ([text isEqualToString:@"\n"])
//    {
//        [txtMessage resignFirstResponder];
//    }
//    return YES;
//}
#pragma mark - webServiceCalling
-(void)GetMessagesWebapi
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        if ([arrayGetMessages count]>0) {
            
        }else{
            [placeActivityIndicator startAnimating];
  
        }
        NSString * strLastid = @"";

        if (![last_inseted_chat_id isEqualToString:@"-1"]) {
            strLastid = last_inseted_chat_id;
        }else{
            strLastid = @"";
        }
        
        NSString * strName = @"";
        if ([isFromChat isEqualToString:@"YES"] || FromPushnotification) {
//            strName = [NSString stringWithFormat:@"%@",StrNameOtherUser];
            strLastid = @"";
        }//else{
//            if ([dicUserdetails valueForKey:@"username"]!=nil && [dicUserdetails valueForKey:@"username"]!=[NSNull null]) {
//                strName = [NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"username"]];
//            }
//        }
        if (StrNameOtherUser!=nil ) {
            strName = [NSString stringWithFormat:@"%@",StrNameOtherUser];
        }else{
            strName =@"";
        }

        NSString * strUserName = [NSString stringWithFormat:@"nota get @%@ %@",strName,strLastid];

        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strUserName forKey:@"subject"];
        if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
        {
            [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        }
        else
        {
            [parameter_dict setObject:@"" forKey:@"token"];
        }
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"GetMessages";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
        }
}

-(void)addWebapiCall {
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
       // [placeActivityIndicator startAnimating];
        NSString * strLastid = @"";
  
        if (![last_inseted_chat_id isEqualToString:@"-1"]) {
            strLastid = last_inseted_chat_id;
        }else{
            strLastid = @"";
        }
        
        
        NSString * strName = @"";
        if ([isFromChat isEqualToString:@"YES"] || FromPushnotification) {
//            strName = [NSString stringWithFormat:@"%@",StrNameOtherUser];
        }//else{
//            if ([dicUserdetails valueForKey:@"username"]!=nil && [dicUserdetails valueForKey:@"username"]!=[NSNull null]) {
//                strName = [NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"username"]];
//            }
//        }
        if (StrNameOtherUser!=nil ) {
            strName = [NSString stringWithFormat:@"%@",StrNameOtherUser];
        }else{
            strName =@"";
        }

        NSString * strUserName = [NSString stringWithFormat:@"nota get @%@ %@",strName,strLastid];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strUserName forKey:@"subject"];
        if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
        {
            [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        }
        else
        {
            [parameter_dict setObject:@"" forKey:@"token"];
        }
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"addWebpiCall";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}
-(void)SendMessageWebapi:(NSString *)srtMessage {
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
       
        if (srtMessage.length >0) {
            
            NSString * strName = @"";
            textView.text = @"";
            //[textView resignFirstResponder];

//            if ([isFromChat isEqualToString:@"YES"] || FromPushnotification) {
//                strName = [NSString stringWithFormat:@"%@",StrNameOtherUser];
//            }else{
//                if ([dicUserdetails valueForKey:@"username"]!=nil && [dicUserdetails valueForKey:@"username"]!=[NSNull null]) {
//                    strName = [NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"username"]];
//                }
//            }
            if (StrNameOtherUser!=nil ) {
                strName = [NSString stringWithFormat:@"%@",StrNameOtherUser];
            }else{
               strName =@"";
            }

            NSString * strUserName = [NSString stringWithFormat:@"nota post @%@ %@",strName,srtMessage];
            
            NSString * webServiceName = @"run/api";
            
            NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
            
            [parameter_dict setObject:strUserName forKey:@"subject"];
            if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
            {
                [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
            }
            else
            {
                [parameter_dict setObject:@"" forKey:@"token"];
            }
            URLManager *manager = [[URLManager alloc] init];
            manager.delegate = self;
            manager.commandName = @"SendMessages";
            [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
            
            
            
           // [self textViewDidChange:textView];
            
        }else{
 
        }
  
    }
}
/*-(void)GetMessagesEveryAfterDelay
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        //[placeActivityIndicator startAnimating];
        NSString * strLastid = @"";
        
        if (![last_inseted_chat_id isEqualToString:@"-1"]) {
            strLastid = last_inseted_chat_id;
        }else{
            strLastid = @"";
        }
        
        NSString * strName = @"";
        //        if ([isFromChat isEqualToString:@"YES"] || FromPushnotification) {
        //            strName = [NSString stringWithFormat:@"%@",StrNameOtherUser];
        //        }else{
        if ([dicUserdetails valueForKey:@"username"]!=nil && [dicUserdetails valueForKey:@"username"]!=[NSNull null]) {
            strName = [NSString stringWithFormat:@"%@",[dicUserdetails valueForKey:@"username"]];
        }
        //        }
        
        NSString * strUserName = [NSString stringWithFormat:@"nota get @%@ %@",strName,strLastid];
        NSString * webServiceName = @"run/api";
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strUserName forKey:@"subject"];
        if (CURRENT_USER_ACCESS_TOKEN != nil || CURRENT_USER_ACCESS_TOKEN != [NSNull null])
        {
            [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        }
        else
        {
            [parameter_dict setObject:@"" forKey:@"token"];
        }
        NSLog(@"CallingFiveSeconds");
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"getAftermesages";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];

        /*if (![last_inseted_chat_id isEqualToString:@"-1"] && last_inseted_chat_id != nil  && ![last_inseted_chat_id isEqualToString:@""] ) {
                 }*/

    //}
//}*/
#pragma mark Response
- (void)onResult:(NSDictionary *)result {
    
    NSLog(@"Result :%@",result);
    [placeActivityIndicator stopAnimating];
    [btnSend setEnabled:YES];

    if([[result valueForKey:@"commandName"] isEqualToString:@"GetMessages"])
    {
        NSString * StrCode = [NSString stringWithFormat:@"%@",[[result valueForKey:@"result"] valueForKey:@"code"]];
        if ([StrCode isEqualToString:@"ok"])
        {
            isfromResponse = YES;
            //[self SetupTableview];
            if ([[result valueForKey:@"result"] valueForKey:@"last_id"]!=nil && [[result valueForKey:@"result"] valueForKey:@"last_id"]!=[NSNull null])
            {
                if ([[result valueForKey:@"result"] valueForKey:@"chats"]) {
                    if ([[result valueForKey:@"result"] valueForKey:@"chats"]!=nil && [[result valueForKey:@"result"] valueForKey:@"chats"]!=[NSNull null]) {
                        
                        arrayGetMessages = [[result valueForKey:@"result"] valueForKey:@"chats"];
                        
                        
                        last_inseted_chat_id = @"-1";

                        last_inseted_chat_id = [NSString stringWithFormat:@"%@",[[result valueForKey:@"result"] valueForKey:@"last_id"]];
                        
                        NSLog(@"last_inseted_chat_id==%@",last_inseted_chat_id);
                        
                        arrayGetMessages=[[[arrayGetMessages reverseObjectEnumerator] allObjects] mutableCopy];

                        
                        NSLog(@"arrayGetMessages==>%@",arrayGetMessages);
                        if ([arrayGetMessages count]>0)
                        {
                            [tblContent reloadData];
                            
                            long lastSection=[tblContent numberOfSections]-1;
                            long lastRowNumber =[tblContent numberOfRowsInSection:lastSection]-1;
                            
                            NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:lastSection];
                            
                            [tblContent scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionNone animated:NO];
                        }
                        else{
                            
                        }
                        
                        [tblContent reloadData];
                    }
                }
            }
        }else if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"error"]){
            
            //[self CallWebapiForLogout];
            [APP_DELEGATE CallWebapiForLogout];
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"SendMessages"]){
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            [self addWebapiCall];
        }
    } else if ([[result valueForKey:@"commandName"] isEqualToString:@"addWebpiCall"]){
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if ([[[result valueForKey:@"result"]valueForKey:@"chats"]count]>0) {
                [arrayGetMessages addObject:[[[result valueForKey:@"result"]valueForKey:@"chats"]objectAtIndex:0]];
                last_inseted_chat_id = [NSString stringWithFormat:@"%@",[[result valueForKey:@"result"] valueForKey:@"last_id"]];
                
                NSLog(@"arrayGetMessagesafteraddding==>%@",arrayGetMessages);
                if ([arrayGetMessages count]>0)
                {
                    [tblContent reloadData];
                    
                    long lastSection=[tblContent numberOfSections]-1;
                    long lastRowNumber =[tblContent numberOfRowsInSection:lastSection]-1;
                    
                    NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:lastSection];
                    [tblContent scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionNone animated:NO];
                }
                else{
                    
                }
                [tblContent reloadData];
            }
           
        }
    }  else if ([[result valueForKey:@"commandName"] isEqualToString:@"getAftermesages"]){
        
        if ([[result valueForKey:@"result"] valueForKey:@"chats"]) {
            if ([[result valueForKey:@"result"] valueForKey:@"chats"]!=nil && [[result valueForKey:@"result"] valueForKey:@"chats"]!=[NSNull null]) {
                
                NSMutableArray * Temparray = [[NSMutableArray alloc]init];
                Temparray = [[result valueForKey:@"result"] valueForKey:@"chats"];
                //arrayGetMessages = [[result valueForKey:@"result"] valueForKey:@"chats"];
               // last_inseted_chat_id = @"-1";
                if ([Temparray count]>0) {
                    
                    [arrayGetMessages addObject:[[[result valueForKey:@"result"]valueForKey:@"chats"]objectAtIndex:0]];
                    
                    last_inseted_chat_id = [NSString stringWithFormat:@"%@",[[result valueForKey:@"result"] valueForKey:@"last_id"]];
                    
                    NSLog(@"last_inseted_chat_idAfter5seconds==%@",last_inseted_chat_id);
                    //NSLog(@"arrayGetMessages==>%@",arrayGetMessages);
                    
                    //arrayGetMessages=[[[arrayGetMessages reverseObjectEnumerator] allObjects] mutableCopy];
                    
                    if ([arrayGetMessages count]>0)
                    {
                        [tblContent reloadData];

                        long lastSection=[tblContent numberOfSections]-1;
                        long lastRowNumber =[tblContent numberOfRowsInSection:lastSection]-1;
                        
                        NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:lastSection];
                        
                        [tblContent scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionNone animated:NO];
                    }
                }
                else{
                }
            }
        }
    }
}
- (void)onError:(NSError *)error
{
    [placeActivityIndicator stopAnimating];
    [btnSend setEnabled:YES];
    NSLog(@"The error is...%@", error);
    [self GetMessagesWebapi];
}
#pragma mark - helper Methods
-(CGSize)getSizeForText:(NSString*)givenText andWidth:(CGFloat)givenWidth andFontName:(NSString*)fontName andFontSize:(CGFloat)fontSize
{
    CGSize constraint = CGSizeMake(givenWidth, CGFLOAT_MAX);
    
    CGSize boundingBox = [givenText boundingRectWithSize:constraint options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:fontName size:fontSize]} context:nil].size;
    
    CGSize size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size;
}

#pragma mark - CleanUp
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
