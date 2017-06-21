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
    
    [self setNavigationViewFrames];
    
    [self setFrame];
    // Do any additional setup after loading the view.
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

    tblStore = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,viewTransperent.frame.size.width,viewTransperent.frame.size.height) style:UITableViewStylePlain];
    
    //tblStore.frame = CGRectMake(0, 0, viewTransperent.frame.size.width, viewTransperent.frame.size.height);
    tblStore.delegate = self;
    tblStore.dataSource = self;
//    tblStore.style = UITableViewStylePlain;
    tblStore.separatorStyle = UITableViewCellSeparatorStyleNone;
    [viewTransperent addSubview:tblStore];
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellID";
    
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:
                               cellIdentifier];
    if (cell == nil)
    {
        cell = [[StoreCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.imgFlowrIcon.hidden = NO;
    return cell;
    
}
#pragma mark - Actions
-(void)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
