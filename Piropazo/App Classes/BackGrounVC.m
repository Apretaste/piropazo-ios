//
//  BackGrounVC.m
//  DatingApp
//
//  Created by Lubhna Shirvastava on 20/05/17.
//  Copyright © 2017 One Click IT Consultancy Pvt Ltd. All rights reserved.
//

#import "BackGrounVC.h"

@interface BackGrounVC ()

@end

@implementation BackGrounVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContentViewFrames];
    // Do any additional setup after loading the view.
}
#pragma mark - setFrames
-(void)setContentViewFrames
{
    //appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    if (IS_IPHONE_4)
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone4BackgroundImage]];
    }
    else if (IS_IPHONE_5 || IS_IPHONE_6)
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone6BackgroundImage]];
    }
    else if (IS_IPHONE_6plus)
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone6PlusBackgroundImage]];
    }
    else
    {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:IPhone6PlusBackgroundImage]];
    }
}
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
