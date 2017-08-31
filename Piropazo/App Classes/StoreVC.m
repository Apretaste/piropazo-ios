//
//  StoreVC.m
//  Piropazo
//
//  Created by Lubhna Shirvastava on 20/06/17.
//  Copyright © 2017 Oneclick. All rights reserved.
//

#import "StoreVC.h"

@interface StoreVC ()

@end

@implementation StoreVC

#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
       /*--------------InAppPurchaseInitialization--------------*/
    //    [self InAppPurchaseInitialization];
    
    
    if ([validProducts count] == 0) {
        [self getProductsFromiTunes];
    }
    /*-------------------------------------------------------*/
    
    
    [self setFrame];
    
    [self setNavigationViewFrames];


    // Do any additional setup after loading the view.
}
-(instancetype)init
{
    if (self)
    {
        self.hidesBottomBarWhenPushed=YES;
    }return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [HUD hide:YES];
    
    [placeActivityIndicator stopAnimating];
    
     //[buttonPurchase setUserInteractionEnabled:YES];
    
    [super viewWillAppear:YES];
    
    //imgUnreadMessageCount.hidden = YES;
    //lblUnreadCount.hidden = YES;
    //[imgUnreadMessageCount removeFromSuperview];
    //[lblUnreadCount removeFromSuperview];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
-(void)viewDidDisappear:(BOOL)animated {
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
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
    
    UIButton * btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBack setFrame:CGRectMake(0, 20, 44, 44)];
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

    UIImageView * imgBG = [UIImageView new];
    [self.view addSubview:imgBG];

    
    [tblStore removeFromSuperview];
    tblStore =[[UITableView alloc]initWithFrame:CGRectMake(0,0,viewTransperent.frame.size.width,viewTransperent.frame.size.height)style:UITableViewStyleGrouped];
    tblStore.backgroundColor = [UIColor clearColor];
    tblStore.delegate=self;
    tblStore.dataSource=self;
    tblStore.separatorStyle=normal;
    tblStore.layer.masksToBounds=YES;
    tblStore.layer.borderColor=[UIColor whiteColor].CGColor;
    [viewTransperent addSubview:tblStore];
    
    placeActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((imgBack.frame.size.width/2)-(30/2), (imgBack.frame.size.height/2)-(30/2), 30, 30)];
    [placeActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    placeActivityIndicator.color = violetgreenColor;
    [imgBack addSubview:placeActivityIndicator];
}

#pragma mark - Table view data source
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 116;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewForSection = [[UIView alloc] init];
    viewForSection.frame = CGRectMake(0, 0,tblStore.frame.size.width, 116);
    viewForSection.backgroundColor = [UIColor clearColor];
    
    UIImageView * imgStore = [[UIImageView alloc]initWithFrame:CGRectMake((viewForSection.frame.size.width/2)-(54/2), 8, 54, 49)];
    imgStore.image = [UIImage imageNamed:@"Store_cart_icon.png"];
    [viewForSection addSubview:imgStore];
    
    UIImageView * imgFlowrIcon = [[UIImageView alloc]initWithFrame:CGRectMake(12,viewForSection.frame.size.height-61, 23, 36)];
    imgFlowrIcon.image = [UIImage imageNamed:@"Store_flower_icon.png"];
    [viewForSection addSubview:imgFlowrIcon];

    UIImageView * imgMulitipleIcon = [[UIImageView alloc]initWithFrame:CGRectMake(imgFlowrIcon.frame.origin.x+imgFlowrIcon.frame.size.width+12, (imgFlowrIcon.frame.origin.y+imgFlowrIcon.frame.size.height/2)-(13/2), 13, 14)];
    imgMulitipleIcon.image = [UIImage imageNamed:@"Store_multiple_icon.png"];
    [viewForSection addSubview:imgMulitipleIcon];
    
    
    UILabel * lblNumberone = [[UILabel alloc]initWithFrame:CGRectMake(imgMulitipleIcon.frame.origin.x+imgMulitipleIcon.frame.size.width+12, viewForSection.frame.size.height-60, 13, 32)];
    lblNumberone.text = @"3";
    lblNumberone.font = [UIFont systemFontOfSize:20];
    lblNumberone.textColor = [UIColor grayColor];
    [viewForSection addSubview:lblNumberone];

    UILabel * lblItemsName = [[UILabel alloc]initWithFrame:CGRectMake(12,viewForSection.frame.size.height-21,310, 13)];
    lblItemsName.textColor = [UIColor grayColor];
    lblItemsName.text = @"Three Flowers";
    [viewForSection addSubview:lblItemsName];
    
    UIButton * btnCost = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCost.frame = CGRectMake(tblStore.frame.size.width-80,viewForSection.frame.size.height-42, 60, 20);
    btnCost.backgroundColor = violetgreenColor;
    btnCost.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    btnCost.layer.cornerRadius = 3;
    [btnCost setTitle:@"$5" forState:UIControlStateNormal];
    [btnCost addTarget:self action:@selector(btnCostClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnCost.tag = 5;
    [viewForSection addSubview:btnCost];
    
    UILabel * lbseperator = [[UILabel alloc]initWithFrame:CGRectMake(0,116-0.5,DEVICE_WIDTH, 0.5)];
    lbseperator.backgroundColor = [UIColor lightGrayColor];
    [viewForSection addSubview:lbseperator];

    return viewForSection;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *cellIdentifier = @"cellID";
//    static NSString *cellIdentifier = nil;

    
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:
                               cellIdentifier];
    if (cell == nil)
    {
        cell = [[StoreCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.btnCost.frame = CGRectMake(tblStore.frame.size.width-80,(64/2)-(20/2), 60, 20);
    cell.lblSave.frame = CGRectMake(tblStore.frame.size.width-75, cell.btnCost.frame.origin.y+cell.btnCost.frame.size.height+4, 60, 11);
    cell.lblSave.textColor = [APP_DELEGATE colorWithHexString:light_red_color];
    if(indexPath.row == 0)
    {
        cell.imgCrownIcon.frame = CGRectMake(8, 8, 52, 34);
        cell.imgFlowrIcon.hidden = YES;
        cell.imgCrownIcon.hidden = NO;
        cell.lblNumberone.hidden = NO;
        cell.lblSave.hidden = YES;
        cell.imgMulitipleIcon.hidden = NO;
        cell.lblItemsName.text = @"One Crown";
        cell.imgAddIcon.hidden = YES;
        cell.lbseperator.hidden = NO;
        [cell.btnCost setTitle:@"$6" forState:UIControlStateNormal];
    }
    else if(indexPath.row == 1){
        cell.imgCrownIcon.frame = CGRectMake(cell.imgAddIcon.frame.origin.x+cell.imgAddIcon.frame.size.width+12, 8, 52, 34);
        cell.imgFlowrIcon.hidden = NO;
        cell.imgCrownIcon.hidden = NO;
        cell.lblSave.hidden = NO;
        cell.imgMulitipleIcon.hidden = YES;
        cell.imgAddIcon.hidden = NO;
        cell.lbseperator.hidden = NO;
        cell.lblNumberone.hidden = YES;
        cell.lblSave.text = @"Save $4";
        cell.lblItemsName.text = @"5 Flowers + 1 Crown";
        [cell.btnCost setTitle:@"$10" forState:UIControlStateNormal];
    }
    else if(indexPath.row == 2){
        cell.imgCrownIcon.frame = CGRectMake(cell.imgAddIcon.frame.origin.x+cell.imgAddIcon.frame.size.width+12, 8, 52, 34);
        cell.imgFlowrIcon.hidden = NO;
        cell.imgCrownIcon.hidden = NO;
        cell.lblSave.hidden = NO;
        cell.lblNumberone.hidden = YES;
        cell.imgMulitipleIcon.hidden = YES;
        cell.lblSave.text = @"Save $13";
        cell.imgAddIcon.hidden = NO;
        cell.lbseperator.hidden = NO;
        cell.lblItemsName.text = @"10 Flowers + 2 Crown";
        [cell.btnCost setTitle:@"$15" forState:UIControlStateNormal];
    }
    else if(indexPath.row == 3){
        cell.imgCrownIcon.frame = CGRectMake(cell.imgAddIcon.frame.origin.x+cell.imgAddIcon.frame.size.width+12, 8, 52, 34);
        cell.imgFlowrIcon.hidden = NO;
        cell.imgCrownIcon.hidden = NO;
        cell.lblSave.hidden = NO;
        cell.imgAddIcon.hidden = NO;
        cell.lblNumberone.hidden = YES;
        cell.imgMulitipleIcon.hidden = YES;
        cell.lblSave.text = @"Save $20";
        cell.lblItemsName.text = @"15 Flowers + 3 Crown";
        cell.lbseperator.hidden = YES;
         [cell.btnCost setTitle:@"$20" forState:UIControlStateNormal];
    }
    cell.btnCost.tag = indexPath.row;
    [cell.btnCost addTarget:self action:@selector(btnCostClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
#pragma mark - Actions
-(void)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnCostClicked:(id)sender {
    
   // buttonPurchase = (UIButton*)sender;
    
    if ([sender tag] == 5) {
        selectedPlan = 5;
    }else{
        if ([sender tag] == 0) {
            selectedPlan = 1;
        }else if ([sender tag]==1){
            selectedPlan = 2;
        }else if ([sender tag]==2){
            selectedPlan = 3;
        }else if ([sender tag]==3){
            selectedPlan = 4;
        }
    }
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }
    else
    {
        [self paymentWithInAppPurchase];
    }
}
#pragma mark - In-App Purchase
//===================== IN-APP PURCHASE ======================//
-(void)getProductsFromiTunes
{
    //    [HUD show:YES];
        [placeActivityIndicator setHidden:NO];
    
    [placeActivityIndicator startAnimating];
    
    //[buttonPurchase setUserInteractionEnabled:NO];
    
    [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products)
     {
         //         [HUD hide:YES];
         [placeActivityIndicator stopAnimating];
         
          //[buttonPurchase setUserInteractionEnabled:YES];
         
         if (success)
         {
             validProducts = [products copy];
             NSLog(@"products ==> %@",validProducts);
             
             for (int i=0; i<[products count]; i++)
             {
                 SKProduct *product = (SKProduct *)validProducts[i];
                 NSLog(@"product.productIdentifier====>>>%@",product.productIdentifier);
             }
         }
     }];
}
-(void)paymentWithInAppPurchase
{
    [placeActivityIndicator startAnimating];
    
     //[buttonPurchase setUserInteractionEnabled:NO];
    
    if (selectedPlan>0)
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [self InAppPurchaseInitialization];
        if (selectedPlan==5)
        {
            for (int i=0; i<[validProducts count]; i++)
            {
                SKProduct *product = (SKProduct *)validProducts[i];
                if ([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.Threeflowers"]) {
                    NSLog(@"Buying %@...", product.productIdentifier);
                    [[RageIAPHelper sharedInstance] buyProduct:product];
                    break;
                }
                NSLog(@"product.productIdentifier====%@",product.productIdentifier);
            }
        }
        
        else if (selectedPlan==1)
        {
            for (int i=0; i<[validProducts count]; i++)
            {
                SKProduct *product = (SKProduct *)validProducts[i];
                if ([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.OneCrown"]) {
                    NSLog(@"Buying %@...", product.productIdentifier);
                    [[RageIAPHelper sharedInstance] buyProduct:product];
                    break;
                }
                NSLog(@"product.productIdentifier====%@",product.productIdentifier);
            }
        }
        else if (selectedPlan == 2)
        {
            for (int i=0; i<[validProducts count]; i++)
            {
                SKProduct *product = (SKProduct *)validProducts[i];
                if ([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.FiveFlowersandOneCrown"]) {
                    NSLog(@"Buying %@...", product.productIdentifier);
                    [[RageIAPHelper sharedInstance] buyProduct:product];
                    break;
                }
                NSLog(@"product.productIdentifier====%@",product.productIdentifier);
            }
        }
        else if (selectedPlan == 3)
        {
            for (int i=0; i<[validProducts count]; i++)
            {
                SKProduct *product = (SKProduct *)validProducts[i];
                if ([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.TenFlowersandTwoCrown"]) {
                    NSLog(@"Buying %@...", product.productIdentifier);
                    [[RageIAPHelper sharedInstance] buyProduct:product];
                    break;
                }
                NSLog(@"product.productIdentifier====%@",product.productIdentifier);
            }
        }
        else if (selectedPlan == 4)
        {
            for (int i=0; i<[validProducts count]; i++)
            {
                SKProduct *product = (SKProduct *)validProducts[i];
                if ([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.FifteenFlowersandThreeCrown"]) {
                    NSLog(@"Buying %@...", product.productIdentifier);
                    [[RageIAPHelper sharedInstance] buyProduct:product];
                    break;
                }
                NSLog(@"product.productIdentifier====%@",product.productIdentifier);
            }
        }
        else
        {
            //            [HUD hide:YES];
             [placeActivityIndicator stopAnimating];
            
           // [buttonPurchase setUserInteractionEnabled:YES];
            
            UIAlertView *message= [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Something goes wrong, Please try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [message show];
        }
        //            SKProduct *product = _products[selectedPlan];
        //            //    SKProduct *product = (SKProduct *)_products[buyButton.tag];
        //            NSLog(@"Buying %@...", product.productIdentifier);
        //            [[RageIAPHelper sharedInstance] buyProduct:product];
    }
    else
    {
        //        [HUD hide:YES];
         [placeActivityIndicator stopAnimating];
        
       // [buttonPurchase setUserInteractionEnabled:YES];
        
        UIAlertView *message= [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Something goes wrong, Please try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
    }
}

-(void)ErrorItuneconnect:(NSNotification *)notification
{
    //[buttonPurchase setUserInteractionEnabled:YES];
    //    [HUD hide:YES];
    [placeActivityIndicator stopAnimating];
    
    NSString * errorFind = notification.object;
    NSLog(@"errorFind===%@",errorFind);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self InAppPurchaseInitialization];
    
    if (![errorFind isEqualToString:@"Cannot connect to iTunes Store"])
    {
        UIAlertView *message= [[UIAlertView alloc] initWithTitle:@"Message" message:errorFind delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
    }
}

#pragma mark - InAppPurchase
-(void)InAppPurchaseInitialization
{
    //    iaobj = [[IAPHelper alloc]init];
    //    iaobj.delegate = self;
    
    //    _products=[[NSArray alloc]init];
    
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"IAPHelperProductPurchasedErrorNotification" object:nil];
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"IAPHelperProductPurchasedNotification" object:nil];
    //
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ErrorItuneconnect:) name:@"IAPHelperProductPurchasedErrorNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchasedCoins:) name:@"IAPHelperProductPurchasedNotification" object:nil];
    
    //    [self getProductsFromiTunes];
}
- (void)productPurchasedCoins:(NSNotification *)notification
{
    [placeActivityIndicator stopAnimating];
    
    //[buttonPurchase setUserInteractionEnabled:YES];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //    [_products enumerateObjectsUsingBlock:^(SKProduct * product, NSUInteger idx, BOOL *stop) {
    //        if ([product.productIdentifier isEqualToString:productIdentifier]) {
    //            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:idx inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    //            *stop = YES;
    //        }
    //    }];
    
    NSString * productIdentifier = notification.object;
    [validProducts enumerateObjectsUsingBlock:^(SKProduct * product, NSUInteger idx, BOOL *stop)
     {
         if ([product.productIdentifier isEqualToString:productIdentifier])
         {    if([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.Threeflowers"])
         {
             strPurchasePlan = @"3FLOWERS";
             [self SendConformationtoServer:strPurchasePlan];
         }
             
         else if([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.OneCrown"])
         {
             strPurchasePlan = @"1CROWN";

             [self SendConformationtoServer:strPurchasePlan];
         }
         else  if([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.FiveFlowersandOneCrown"])
         {
             strPurchasePlan = @"PACK_SMALL";

             [self SendConformationtoServer:strPurchasePlan];
         }
         else  if([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.TenFlowersandTwoCrown"])
         {
             strPurchasePlan = @"PACK_MEDIUM";

             [self SendConformationtoServer:strPurchasePlan];
         }
         else  if([product.productIdentifier isEqualToString:@"com.pragres.Piropazo.FifteenFlowersandThreeCrown"])
         {
             strPurchasePlan = @"PACK_LARGE";

             [self SendConformationtoServer:strPurchasePlan];
         }
         else
         {
             // [HUD hide:YES];
         }
             //             [[NSNotificationCenter defaultCenter] removeObserver:self];
             //             *stop = YES;
         }
     }];
}
#pragma mark - WebserviceCalling
-(void)SendConformationtoServer:(NSString *)StrPurchasePlan {
    
    NSLog(@"Strplan==>%@",StrPurchasePlan);
    BOOL isNetAvaliable = [(AppDelegate *)[[UIApplication sharedApplication]delegate] getInternetStatus];
    if (isNetAvaliable == NO)
    {
    }else{
        
        /*NSString * webServiceName = @"run/api";
        NSString * strSubject = [NSString stringWithFormat:@"piropazo confirm %@",StrPurchasePlan];
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        [parameter_dict setObject:strSubject forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"ConformationtoServer";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];*/
        
        
        NSString * strSubject = [NSString stringWithFormat:@"piropazo confirm %@",StrPurchasePlan];
        
        NSString * webServiceName = @"run/api";
        
        NSMutableDictionary *parameter_dict = [[NSMutableDictionary alloc]init];
        
        [parameter_dict setObject:strSubject forKey:@"subject"];
        [parameter_dict setObject:CURRENT_USER_ACCESS_TOKEN forKey:@"token"];
        
        URLManager *manager = [[URLManager alloc] init];
        manager.delegate = self;
        manager.commandName = @"ConformationtoServer";
        [manager postUrlCall:[NSString stringWithFormat:@"%@%@",WEB_SERVICE_URL,webServiceName] withParameters:parameter_dict];
    }
}

#pragma mark Response
- (void)onResult:(NSDictionary *)result {
    
    NSLog(@"Result :%@",result);
    if([[result valueForKey:@"commandName"] isEqualToString:@"ConformationtoServer"])
    {
        if ([[[result valueForKey:@"result"] valueForKey:@"code"]isEqualToString:@"ok"])
        {
            NSLog(@"Suceess==>");
            [self.navigationController popViewControllerAnimated:YES];

        }
    }
}

- (void)onError:(NSError *)error {
    NSLog(@"The error is...%@", error);
}
#pragma mark - Dealloc
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //    iaobj.delegate = nil;
    //    iaobj = nil;
}

#pragma mark - cleanUp
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
