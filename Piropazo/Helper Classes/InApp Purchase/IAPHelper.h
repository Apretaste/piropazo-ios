//
//  IAPHelper.h
//  In App Rage
//
//  Created by Ray Wenderlich on 9/5/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

#import <StoreKit/StoreKit.h>



@protocol completionTranDelegate <NSObject>

- (void)productPurchasedCoins:(NSString *)notification;

@end

typedef void(^IAPHelperCallBack)(NSString * result);

typedef void (^RequestProductsCompletionHandler)(BOOL success, NSArray * products);

@interface IAPHelper : NSObject
{
    id<completionTranDelegate>   delegate;
    int counnnt;
}

@property(nonatomic,readwrite,assign)id<completionTranDelegate> delegate;


- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers;
- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler;
- (void)buyProduct:(SKProduct *)product;
- (BOOL)productPurchased:(NSString *)productIdentifier;
- (void)restoreCompletedTransactions;

+(instancetype) sharedInstance;
-(void) resultCallBack:(IAPHelperCallBack)throwCall;
@end