//
//  StoreVC.h
//  Piropazo
//
//  Created by Lubhna Shirvastava on 20/06/17.
//  Copyright © 2017 Oneclick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreCell.h"

//In-App-Purchase
#import "IAPHelper.h"
#import "RageIAPHelper.h"
#import <StoreKit/StoreKit.h>
#import "MBProgressHUD.h"


@interface StoreVC : UIViewController<UITableViewDataSource,UITableViewDelegate,SKProductsRequestDelegate,SKPaymentTransactionObserver,MBProgressHUDDelegate,URLManagerDelegate>
{
    UIImageView * navview;
    UIImageView * imgBack;

    UITableView * tblStore;
    
    SKProductsRequest *productsRequest;
    NSArray *validProducts;
    
    NSInteger selectedPlan;
    
    MBProgressHUD * HUD;
    
    UIActivityIndicatorView * placeActivityIndicator;

    UIButton *buttonPurchase;
    
    NSString * strPurchasePlan;

}
@end
