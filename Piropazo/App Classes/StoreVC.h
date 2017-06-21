//
//  StoreVC.h
//  Piropazo
//
//  Created by Lubhna Shirvastava on 20/06/17.
//  Copyright © 2017 Oneclick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreCell.h"
@interface StoreVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView * navview;
    UIImageView * imgBack;

    UITableView * tblStore;
}
@end
