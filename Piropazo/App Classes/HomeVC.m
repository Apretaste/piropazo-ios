//
//  HomeVC.m
//  DatingApp
//
//  Created by Oneclick IT Solution on 1/12/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC
@synthesize strFirst;
#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Edit = NO;

//    NSString *languageSyatem = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
//    if ([languageSyatem isEqualToString:@"es"]) {
//        [TSLanguageManager setSelectedLanguage:kLMSpanish];
//    }
//    else{
//        [TSLanguageManager setSelectedLanguage:kLMEnglish];
//    }
//    changeLanguage = NO;
    
 

    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    arrayPeople = [[NSMutableArray alloc] init];

    [self SetNavigationbar];
    
    [self setFrame];
    
    [self setMainCardViewBGFrame];

    [self upDatewebserviceCalling];

    if ([strFirst isEqualToString:@"isFromFirstTime"])
    {
        [self infoScreen];
        
    }
    else{
        
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    if ([arrayPeople count]>0)
    {
        
    }
    else
    {
        BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
        if (isNetAvaliable == NO)
        {
        }else{
            [self CallwebServiceforGetPeopel];
        }
    }

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Accepted" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotificationforAprrove:)
                                                 name:@"Accepted"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Rejected" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotificationforReject:)
                                                 name:@"Rejected"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Refresh" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(RefershCalled:)
                                                 name:@"Refresh"
                                               object:nil];
   // [APP_DELEGATE showTabBar:self.tabBarController];

}
#pragma mark - notificationMethods
-(void)receiveNotificationforAprrove:(NSNotification *)notification
{
    if ([arrayPeople count]>0)
    {
        [firstCardView mdc_swipe:MDCSwipeDirectionRight];

    }
}
-(void)receiveNotificationforReject:(NSNotification*)notification
{
    if ([arrayPeople count]>0)
    {
        [firstCardView mdc_swipe:MDCSwipeDirectionLeft];
    }
}
-(void)RefershCalled:(NSNotification*)notification
{
    [self CallwebServiceforGetPeopel];
}
-(void)infoScreen
{
    viewInfo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    
    viewInfo.backgroundColor = [UIColor clearColor];
    
    [appDelegate.window addSubview:viewInfo];
    
    scrlContentInfo =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH,DEVICE_HEIGHT) ];
    scrlContentInfo.delegate=self;
    scrlContentInfo.bounces= NO;
    scrlContentInfo.pagingEnabled =YES;
    [viewInfo addSubview:scrlContentInfo];

    
    int xx=0;
    for(int i=0; i<3 ;i++)
    {
        UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(xx, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        firstView.backgroundColor =[UIColor clearColor];
        [scrlContentInfo addSubview:firstView];
        
        UIImageView * imgSplash = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, firstView.frame.size.width, firstView.frame.size.height)];
        if (i==0) {
            
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish])
            {
                if (IS_IPHONE_4)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info1-english_ip4.png"]];
                }
                else if (IS_IPHONE_5)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info1-english_ip5.png"]];
                    
                }
                else if (IS_IPHONE_6)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info1-english_ip6.png"]];
                    
                }
                else{
                    [imgSplash setImage:[UIImage imageNamed:@"info1-english_ip6+.png"]];
                }
            }
            else
            {
                if (IS_IPHONE_4)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info1-spanish_ip4.png"]];
                }
                else if (IS_IPHONE_5)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info1-spanish_ip5.png"]];
                    
                }
                else if (IS_IPHONE_6)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info1-spanish_ip6.png"]];
                    
                }
                else{
                    [imgSplash setImage:[UIImage imageNamed:@"info1-spanish_ip6+.png"]];
                }
            }
        }
        else if(i==1)
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish])
            {
                if (IS_IPHONE_4)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info2-english_ip4.png"]];
                }
                else if (IS_IPHONE_5)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info2-english_ip5.png"]];
                    
                }
                else if (IS_IPHONE_6)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info2-english_ip6.png"]];
                    
                }
                else{
                    [imgSplash setImage:[UIImage imageNamed:@"info2-english_ip6+.png"]];
                }
 
            }
            else
            {
                if (IS_IPHONE_4)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info2-spanish_ip4.png"]];
                }
                else if (IS_IPHONE_5)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info2-spanish_ip5.png"]];
                    
                }
                else if (IS_IPHONE_6)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info2-spanish_ip6.png"]];
                    
                }
                else{
                    [imgSplash setImage:[UIImage imageNamed:@"info2-spanish_ip6+.png"]];
                }
                
            }
            
        }
        else if(i==2)
        {
            if ([[TSLanguageManager selectedLanguage] isEqualToString:kLMEnglish])
            {
                if (IS_IPHONE_4) {
                    [imgSplash setImage:[UIImage imageNamed:@"info3-english_ip4.png"]];
                }
                else if (IS_IPHONE_5)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info3-english_ip5.png"]];
                    
                }
                else if (IS_IPHONE_6)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info3-english_ip6.png"]];
                    
                }
                else{
                    [imgSplash setImage:[UIImage imageNamed:@"info3-english_ip6+.png"]];
                }

            }
            else
            {
                if (IS_IPHONE_4) {
                    [imgSplash setImage:[UIImage imageNamed:@"info3-spanish_ip4.png"]];
                }
                else if (IS_IPHONE_5)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info3-spanish_ip5.png"]];
                    
                }
                else if (IS_IPHONE_6)
                {
                    [imgSplash setImage:[UIImage imageNamed:@"info3-spanish_ip6.png"]];
                    
                }
                else{
                    [imgSplash setImage:[UIImage imageNamed:@"info3-spanish_ip6+.png"]];
                }
            }
        }
        [firstView addSubview:imgSplash];
        
        xx= xx+DEVICE_WIDTH;
    }
    [scrlContentInfo setContentSize:CGSizeMake(xx, DEVICE_HEIGHT)];
    
    pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(100,DEVICE_HEIGHT-140,DEVICE_WIDTH-200,40);
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    pageControl.userInteractionEnabled=NO;
    [viewInfo addSubview:pageControl];
    
    BtnNext=[UIButton buttonWithType:UIButtonTypeSystem];
    BtnNext.frame=CGRectMake((DEVICE_WIDTH/2)-(80/2), DEVICE_HEIGHT-100, 80, 40);
    [BtnNext setTitle:[TSLanguageManager localizedString:@"Next"] forState:UIControlStateNormal];
    [BtnNext setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [BtnNext addTarget:self action:@selector(btnNextClickedClicked:) forControlEvents:UIControlEventTouchUpInside];
    BtnNext.titleLabel.font=[UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
    [BtnNext setBackgroundColor:infoButtonColor];
    BtnNext.layer.cornerRadius=4.0;
    BtnNext.clipsToBounds = NO;
    BtnNext.layer.shadowColor = [[UIColor grayColor] CGColor];
    BtnNext.layer.shadowOffset = CGSizeMake(2,2);
    BtnNext.layer.shadowOpacity = 0.5;
    [viewInfo addSubview:BtnNext];
    
}
-(void)btnNextClickedClicked:(id)sender
{
    if(pageControl.currentPage==0)
    {
        [scrlContentInfo setContentOffset:CGPointMake(DEVICE_WIDTH, 0) animated:YES];
        
    }
    else if (pageControl.currentPage==1)
    {
        [scrlContentInfo setContentOffset:CGPointMake(DEVICE_WIDTH*2, 0) animated:YES];

    }
    else{
//        [scrlContentInfo setContentOffset:CGPointMake(DEVICE_WIDTH*3, 0) animated:YES];
        viewInfo.hidden = YES;
    }
}
#pragma mark - Navigation Frame
-(void)SetNavigationbar
{
    navview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 64)];
    navview.backgroundColor =navigationBackgroundcolor;
    navview.userInteractionEnabled=YES;
    [self.view addSubview:navview];
    
    UIImageView * imgLogo = [[UIImageView alloc]initWithFrame:CGRectMake((DEVICE_WIDTH/2)-(114/2), (64/2)-(24/7), 114, 27)];
    imgLogo.image = [UIImage imageNamed:Navigationlogo];
    [navview addSubview:imgLogo];
    
}
#pragma mark - Frame Settings
-(void)setFrame
{
    imgBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64-49)];
    imgBack.userInteractionEnabled = YES;
    imgBack.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] stringForKey:@"backGroundimage"]];
    [self.view addSubview:imgBack];
    
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((imgBack.frame.size.width/2)-(30/2), (imgBack.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicator.color = UIActivityIndicatorViewStyleWhiteLarge;;
    [imgBack addSubview:placeActivityIndicator];
    
    lblError  = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64-50)];
    lblError.text =@"Work in progress..";
    lblError.font = [UIFont boldSystemFontOfSize:15.0];
    lblError.textColor = [UIColor blackColor];
    lblError.textAlignment=NSTextAlignmentCenter;
    //[self.view addSubview:lblError];
    lblError.hidden=NO;
}
-(void)setMainCardViewBGFrame
{

    NSLog(@"%s",__FUNCTION__);
    [firstCardView removeFromSuperview];
    [secondCardView removeFromSuperview];
    [thirdCardView removeFromSuperview];
    [viewCardContainer removeFromSuperview];
    
    firstCardView = nil;
    secondCardView = nil;
    thirdCardView = nil;
    viewCardContainer = nil;
    
    viewCardContainer=[[UIView alloc]initWithFrame:CGRectMake(0, 64, DEVICE_WIDTH, DEVICE_HEIGHT-64-49)];
    viewCardContainer.backgroundColor= [UIColor clearColor];
    viewCardContainer.clipsToBounds=YES;
    
//    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(viewCardContainer.frame.size.width/2-15, viewCardContainer.frame.size.height/2-15, 30, 30)];
//    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    [viewCardContainer addSubview:placeActivityIndicator];
    
    firstCardView = [self popPersonViewWithFrame:[self firstCardViewFrame]];
    firstCardView.backgroundColor = [UIColor whiteColor];
    [viewCardContainer addSubview:firstCardView];
    
    secondCardView = [self popPersonViewWithFrame:[self secondCardViewFrame]];
    secondCardView.backgroundColor = [UIColor whiteColor];
    [viewCardContainer insertSubview:secondCardView belowSubview:firstCardView];
    
    thirdCardView =[self popPersonViewWithFrame:[self thirdCardViewFrame]];
    thirdCardView.backgroundColor = [UIColor whiteColor];
    [viewCardContainer insertSubview:thirdCardView belowSubview:secondCardView];
    
    [self.view addSubview:viewCardContainer];
    
    lblStatus = [[UILabel alloc]initWithFrame:CGRectMake(80, viewCardContainer.frame.size.height-50,viewCardContainer.frame.size.width-160, 40)];
    if (IS_IPHONE_5 || IS_IPHONE_4)
    {
        lblStatus.frame = CGRectMake(40, viewCardContainer.frame.size.height-50,viewCardContainer.frame.size.width-80, 40);
    }
    lblStatus.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
    lblStatus.textColor = [UIColor whiteColor];
    lblStatus.textAlignment = NSTextAlignmentCenter;
    lblStatus.hidden = YES;
    lblStatus.layer.masksToBounds = YES;
    lblStatus.opaque =YES;
    //lblStatus.layer.al
    lblStatus.layer.cornerRadius = 8.0;
    [viewCardContainer addSubview:lblStatus];
    //headerView.layer.zPosition = 1;
    
    /*UIView * viewBottom = [[UIView alloc] initWithFrame:CGRectMake(0, viewCardContainer.frame.size.height-90, viewCardContainer.frame.size.width, 90)];
    [viewBottom setBackgroundColor:[UIColor clearColor]];
    [viewCardContainer addSubview:viewBottom];
    
    btnReject = [[UIButton alloc] initWithFrame:CGRectMake(viewBottom.frame.size.width/2-95, 20, 50, 50)];
    [btnReject setBackgroundColor:[UIColor clearColor]];
    [btnReject setImage:[UIImage imageNamed:@"cancel_btn_icon.png"] forState:UIControlStateNormal];
    [btnReject addTarget:self action:@selector(btnRejectClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewBottom addSubview:btnReject];
    
    btnReload = [[UIButton alloc] initWithFrame:CGRectMake(viewBottom.frame.size.width/2-25, 20, 50, 50)];
    [btnReload setBackgroundColor:[UIColor clearColor]];
    [btnReload setImage:[UIImage imageNamed:@"refresh_btn_icon.png"] forState:UIControlStateNormal];
    [btnReload addTarget:self action:@selector(btnReloadClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewBottom addSubview:btnReload];
    
    btnAccept = [[UIButton alloc] initWithFrame:CGRectMake(viewBottom.frame.size.width/2+45, 20, 50, 50)];
    [btnAccept setBackgroundColor:[UIColor clearColor]];
    [btnAccept setImage:[UIImage imageNamed:@"like_btn_icon.png"] forState:UIControlStateNormal];
    [btnAccept addTarget:self action:@selector(btnAcceptClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewBottom addSubview:btnAccept];*/
}
/*-(void)addTempRecords
{
    [arrayPersons removeAllObjects];
    NSLog(@"%s",__FUNCTION__);
    NSMutableDictionary * dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setObject:@"1" forKey:@"title"];
    [dict1 setObject:@"1.1" forKey:@"subtitle"];
    [dict1 setObject:@"img1.jpg" forKey:@"image"];
    [arrayPersons addObject:dict1];
    
    NSMutableDictionary * dict2 = [[NSMutableDictionary alloc]init];
    [dict2 setObject:@"2" forKey:@"title"];
    [dict2 setObject:@"2.1" forKey:@"subtitle"];
    [dict2 setObject:@"img2.jpg" forKey:@"image"];
    [arrayPersons addObject:dict2];
    
    NSMutableDictionary * dict3 = [[NSMutableDictionary alloc]init];
    [dict3 setObject:@"3" forKey:@"title"];
    [dict3 setObject:@"3.1" forKey:@"subtitle"];
    [dict3 setObject:@"img3.jpg" forKey:@"image"];
    [arrayPersons addObject:dict3];
    
    NSMutableDictionary * dict4 = [[NSMutableDictionary alloc]init];
    [dict4 setObject:@"4" forKey:@"title"];
    [dict4 setObject:@"4.1" forKey:@"subtitle"];
    [dict4 setObject:@"img4.jpg" forKey:@"image"];
    [arrayPersons addObject:dict4];
    
    NSMutableDictionary * dict5 = [[NSMutableDictionary alloc]init];
    [dict5 setObject:@"5" forKey:@"title"];
    [dict5 setObject:@"5.1" forKey:@"subtitle"];
    [dict5 setObject:@"img5.jpg" forKey:@"image"];
    [arrayPersons addObject:dict5];
}*/
#pragma mark - Internal Methods
- (ChoosePersonView *)popPersonViewWithFrame:(CGRect)frame2
{
    if ([arrayPeople
         count] == 0) {
    }
    
   // NSLog(@"selectedIndex===>>>%ld",(long)selectedIndex);
//NSLog(@"arrayImages count===>>>%lu",(unsigned long)[arrayPeople count]);
    if (selectedIndex >= [arrayPeople count]){
        return nil;
    }

    
    // UIView+MDCSwipeToChoose and MDCSwipeToChooseView are heavily customizable.
    // Each take an "options" argument. Here, we specify the view controller as
    // a delegate, and provide a custom callback that moves the back card view
    // based on how far the user has panned the front card view.
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.threshold = 160.f;
    options.onPan = ^(MDCPanState *state)
    {
        CGRect frame = [self secondCardViewFrame];
        CGRect frame1 = [self thirdCardViewFrame];
        
        secondCardView.frame = CGRectMake(frame.origin.x-10.0f, frame.origin.y - (state.thresholdRatio * 10.f), frame.size.width+20.0f, CGRectGetHeight(frame));
        thirdCardView.frame = CGRectMake(frame1.origin.x-10.0f, frame1.origin.y - (state.thresholdRatio * 11.f), frame1.size.width+20.0f, CGRectGetHeight(frame1));
    };
    

    // Create a personView with the top person in the people array, then pop that person off the stack.
    personView = [[ChoosePersonView alloc] initWithFrame:frame2 options:options withDetail:[arrayPeople objectAtIndex:selectedIndex]];
    personView.backgroundColor = [UIColor whiteColor];
    
    [personView.btnTap addTarget:self action:@selector(cardTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    selectedIndex++;
    return personView;
}

-(void)cardTapped:(id)sender
{
    
    if ([arrayPeople count]>0)
    {
        NSLog(@"tapped record ===%@",[arrayPeople objectAtIndex:0]);
        
        UserDetailVC * details = [[UserDetailVC alloc] init];
        details.strUsername = [[arrayPeople objectAtIndex:0]valueForKey:@"username"];
        //details.detailDict = [arrayPeople objectAtIndex:0];
        [self.navigationController pushViewController:details animated:YES];
    }
}

#pragma mark - Set Card Frames
- (CGRect)firstCardViewFrame
{
    //    CGRect frontFrame = CGRectMake(20, 20, viewCardContainer.frame.size.width-40, viewCardContainer.frame.size.height-140);
    CGRect frontFrame = CGRectMake(30, 60, viewCardContainer.frame.size.width-60, viewCardContainer.frame.size.height-120);
    
    if (IS_IPHONE_4)
    {
        frontFrame = CGRectMake(30, 10, viewCardContainer.frame.size.width-60, viewCardContainer.frame.size.height-20);

    }
    else if (IS_IPHONE_5)
    {
        frontFrame = CGRectMake(20, 40, viewCardContainer.frame.size.width-40, viewCardContainer.frame.size.height-100);
 
    }
    
    else if (IS_IPHONE_6plus)
    {
        frontFrame = CGRectMake(20, 80, viewCardContainer.frame.size.width-40, viewCardContainer.frame.size.height-180);
        
    }
    else if (IS_IPHONE_6)
    {
        frontFrame = CGRectMake(20, 40, viewCardContainer.frame.size.width-40, viewCardContainer.frame.size.height-140);

    }
    
    return frontFrame;
}

- (CGRect)secondCardViewFrame
{
    CGRect frontFrame = [self firstCardViewFrame];
    return CGRectMake(frontFrame.origin.x+10.0f, frontFrame.origin.y + 10.f, frontFrame.size.width-20.0f, CGRectGetHeight(frontFrame));
}

- (CGRect)thirdCardViewFrame
{
    CGRect frontFrame = [self firstCardViewFrame];
    return CGRectMake(frontFrame.origin.x+20.0f, frontFrame.origin.y +20.f, frontFrame.size.width-40.0f, CGRectGetHeight(frontFrame));
}
#pragma mark - MDCSwipeToChooseDelegate Protocol Methods
// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view
{
    NSLog(@"%s",__FUNCTION__);
    CGRect frontFrame = [self firstCardViewFrame];
    secondCardView.frame = CGRectMake(frontFrame.origin.x+10.0f, frontFrame.origin.y + 10.f, frontFrame.size.width-20.0f, CGRectGetHeight(frontFrame));
    
    CGRect frontFrame1 = [self firstCardViewFrame];
    thirdCardView.frame = CGRectMake(frontFrame1.origin.x+20.0f, frontFrame1.origin.y + 20.f, frontFrame1.size.width-40.0f, CGRectGetHeight(frontFrame1));
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction
{
    // MDCSwipeToChooseView shows "NOPE" on swipes to the left, and "LIKED" on swipes to the right.
    NSLog(@"did swipe in direction: %zd", direction);
    NSLog(@"record ==== %@",[arrayPeople objectAtIndex:0]);
    

    
    if (direction == MDCSwipeDirectionLeft)
    {
     //NSLog(@"")
    
//        NSLog(@"Left")
        strLeftSideUserName = [[arrayPeople objectAtIndex:0]valueForKey:@"username"];

        [self CallwebServiceNotoPeopel:strLeftSideUserName];
        

    }
    else  if (direction == MDCSwipeDirectionRight)
    {
        strRightSideUserName = [[arrayPeople objectAtIndex:0]valueForKey:@"username"];
        //        NSLog(@"Right")
        
        [self CallwebServiceYestoPeopel:strRightSideUserName];

    }
    else  if (direction == MDCSwipeDirectionUP)
    {
        
    }
    
    ;
  //  NSLog(@"Name===>%@",[[arrayPeople objectAtIndex:selectedIndex]valueForKey:@"username"]);
    [arrayPeople removeObjectAtIndex:0];
    lblStatus.hidden = YES;
    selectedIndex--;
    
    if ([arrayPeople count] == 0)
    {
        lblStatus.hidden = YES;

        [self CallwebServiceforGetPeopel];
    }
    
    
    // MDCSwipeToChooseView removes the view from the view hierarchy
    // after it is swiped (this behavior can be customized via the
    // MDCSwipeOptions class). Since the front card view is gone, we
    // move the back card to the front, and create a new back card.
    
    firstCardView = secondCardView;
    firstCardView.frame =[self firstCardViewFrame];
    
    secondCardView = thirdCardView;
    secondCardView.frame=[self secondCardViewFrame];
    
    if ((thirdCardView = [self popPersonViewWithFrame:[self thirdCardViewFrame]]))
    {
        // Fade the back card into view.
        thirdCardView.alpha = 0.f;
        [viewCardContainer insertSubview:secondCardView belowSubview:firstCardView];
        [viewCardContainer insertSubview:thirdCardView belowSubview:secondCardView];
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            thirdCardView.alpha = 1.f;
        } completion:nil];
    }
}
#pragma mark - page Controller

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 3 ) / pageWidth) + 1; //this provide you the page number
    pageControl.currentPage = page;// this displays the white dot as current page
    
    if(pageControl.currentPage==0 )
    {
        [BtnNext setTitle:[TSLanguageManager localizedString:@"Next"] forState:UIControlStateNormal];
    }
    else if (pageControl.currentPage==1)
    {
        [BtnNext setTitle:[TSLanguageManager localizedString:@"Next"] forState:UIControlStateNormal];

    }
    else{
        [BtnNext setTitle:[TSLanguageManager localizedString:@"Go!"] forState:UIControlStateNormal];
    }
}
#pragma mark - Webservicecalling
#pragma mark - Web Service Call
-(void)CallwebServiceforGetPeopel
{
//    [APP_DELEGATE endHudProcess];
//    [APP_DELEGATE startHudProcess:nil];
    
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        [placeActivityIndicator startAnimating];
        
        [arrayPeople removeAllObjects];
        selectedIndex = 0;
        [self setMainCardViewBGFrame];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:@"piropazo 20" forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
//        [parameter_dict setObject:@"3805a2cfd481280abaee16a08363f175" forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"GettingPeopels";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
    
}

#pragma mark - Web Service Call
-(void)CallwebServiceYestoPeopel:(NSString*)strName
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        NSString * strRight = [NSString stringWithFormat:@"piropazo si @%@",strName];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strRight forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"YestoPeopel";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}
#pragma mark - Web Service Call
-(void)CallwebServiceNotoPeopel:(NSString*)strName
{
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        NSString * strLeft = [NSString stringWithFormat:@"piropazo no @%@",strName];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strLeft forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"NotoPeopel";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}
#pragma mark - WebserviceCalling
-(void)upDatewebserviceCalling
{
    Edit = YES;
    NSString * webServiceName = @"run/api";
    
    NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
    
    [parameter_dict setObject:@"piropazo profile" forKey:@"subject"];
    [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
//    [parameter_dict setObject:@"3805a2cfd481280abaee16a08363f175" forKey:@"token"];

    
    URLManager *manager = [[URLManager alloc] init];
    manager.delegate = self;
    manager.commandName = @"Editprofile";
    [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
}

#pragma mark Response
- (void)onResult:(NSDictionary *)result
{
    if (Edit == YES) {
        
    }
    else{
        [placeActivityIndicator stopAnimating];
    }

    NSLog(@"Result :%@",result);
    
    if([[result valueForKey:@"commandName"] isEqualToString:@"GettingPeopels"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSMutableArray * arrTemp = [[result valueForKey:@"result"] valueForKey:@"people"];

            if ([arrTemp count]>0) {
                arrayPeople = [arrTemp mutableCopy];
            }
            selectedIndex = 0;
            [self setMainCardViewBGFrame];
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
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"NotoPeopel"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if ([arrayPeople count]>0)
            {
                lblStatus.hidden = NO;
                
                NSString*str = [TSLanguageManager localizedString:@"You said No to"];
                lblStatus.text = [NSString stringWithFormat:@"%@ %@",str,strLeftSideUserName];

                [self performSelector:@selector(HideLabel) withObject:nil afterDelay:1.0];
            }
            NSLog(@"Left==>");
        }
    }
    else if ([[result valueForKey:@"commandName"] isEqualToString:@"YestoPeopel"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if ([arrayPeople count]>0)
            {
                lblStatus.hidden = NO;
                
                NSString*str = [TSLanguageManager localizedString:@"You said Yes to"];

                lblStatus.text = [NSString stringWithFormat:@"%@ %@",str,strRightSideUserName];
                
                [self performSelector:@selector(HideLabel) withObject:nil afterDelay:1.0];
            }
            NSLog(@"Right==>");
        }
    }
    else if([[result valueForKey:@"commandName"] isEqualToString:@"Editprofile"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            if([[result valueForKey:@"result"] valueForKey:@"profile"])
            {
                if ([[result valueForKey:@"result"] valueForKey:@"profile"]!=nil && [[result valueForKey:@"result"] valueForKey:@"profile"]!=[NSNull null])
                {
                    
                    NSMutableDictionary * dicDetails = [[NSMutableDictionary alloc]init];

                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                    
                    NSString * strGenderSave = [NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"gender"]];
                    
                    NSString * strImage = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",[[dicDetails valueForKey:@"profile"]valueForKey:@"picture_public"]]];
                    
                    if (strGenderSave!=nil && ![strGenderSave isEqualToString:@"(null)"]) {
                        [userDefaults setObject:strGenderSave forKey:@"GENDER_STATUS"];
                    }
                    else{
                        [userDefaults setObject:@"" forKey:@"GENDER_STATUS"];
                    }
                    
                    if (strImage!=nil && ![strImage isEqualToString:@"(null)"]) {
                        [userDefaults setObject:strImage forKey:@"USER_IMAGE"];
                    }
                    else{
                        [userDefaults setObject:@"" forKey:@"USER_IMAGE"];
                    }
                    
                    [userDefaults synchronize];
                    
                    
                    
                    
                    NSString * strGender = [[[result valueForKey:@"result"] valueForKey:@"profile"]valueForKey:@"gender"];
                    if (![strGender isEqualToString:@""] && strGender !=nil && ![strGender isEqualToString:@"(null)"]  )
                    {
                        if ([strGender isEqualToString:@"F"])
                        {
                            UITabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:2];// item index is the tab index which starts from 0
                            item.image = [UIImage imageNamed:@"female.png"];
                            item.selectedImage = [[UIImage imageNamed:@"active_female.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                        }
                        else
                        {
                            UITabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:2];// item index is the tab index which starts from 0
                            item.image = [UIImage imageNamed:@"user.png"];
                            item.selectedImage = [[UIImage imageNamed:@"active_user.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                        }
                    }
                }
            }
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
-(void)HideLabel
{
    lblStatus.hidden = YES;
}
- (void)onError:(NSError *)error
{
    [placeActivityIndicator stopAnimating];

    if (Edit == YES) {
        
    }
    else{
        [placeActivityIndicator stopAnimating];
    }
    NSLog(@"The error is...%@", error);
}
#pragma mark - CleanUp
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
