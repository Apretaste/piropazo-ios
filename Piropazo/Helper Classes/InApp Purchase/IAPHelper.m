//
//  IAPHelper.m
//  In App Rage
//
//  Created by Ray Wenderlich on 9/5/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

// 1
#import "IAPHelper.h"
#import <StoreKit/StoreKit.h>

NSString *const IAPHelperProductPurchasedNotification = @"IAPHelperProductPurchasedNotification";

//IAPHelper *instance = nil;

// 2
@interface IAPHelper () <SKProductsRequestDelegate, SKPaymentTransactionObserver>
@end

// 3
@implementation IAPHelper
{
    SKProductsRequest * _productsRequest;
    RequestProductsCompletionHandler _completionHandler;
    IAPHelperCallBack _helperCallBack;
    NSSet * _productIdentifiers;
    NSMutableSet * _purchasedProductIdentifiers;
}

-(id)init{
    if (self = [super init]) {
        counnnt = 0;
    }
    return self;
}

+(instancetype) sharedInstance{
    static id instance = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken,^{
        instance = [[self alloc] init];
    });
    
    return instance;
}
//-(void) resultCallBack:(IAPHelperCallBack)throwCall{
//    _helperCallBack = [throwCall copy];
//}
- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers {
    
    if ((self = [super init]))
    {
        // Store product identifiers
        _productIdentifiers = productIdentifiers;
        
        // Check for previously purchased products
        _purchasedProductIdentifiers = [NSMutableSet set];
        for (NSString * productIdentifier in _productIdentifiers)
        {
            BOOL productPurchased = [[NSUserDefaults standardUserDefaults] boolForKey:productIdentifier];
            if (productPurchased) {
                [_purchasedProductIdentifiers addObject:productIdentifier];
                NSLog(@"Previously purchased: %@", productIdentifier);
            } else {
                NSLog(@"Not purchased: %@", productIdentifier);
            }
        }
        
        // Add self as transaction observer
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    }
    return self;
}

- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler
{
    // 1
    _completionHandler = [completionHandler copy];
    
    // 2
    _productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:_productIdentifiers];
    _productsRequest.delegate = self;
    [_productsRequest start];
}

- (BOOL)productPurchased:(NSString *)productIdentifier
{
    return [_purchasedProductIdentifiers containsObject:productIdentifier];
}

- (void)buyProduct:(SKProduct *)product
{
    NSLog(@"Buying %@...", product.productIdentifier);
    
    SKPayment * payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

#pragma mark - SKProductsRequestDelegate
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSLog(@"Loaded list of products...");
    _productsRequest = nil;
    
    NSArray * skProducts = response.products;
    NSLog(@"skProducts=====%@",skProducts);
    
    for (SKProduct * skProduct in skProducts)
    {
        NSLog(@"Found product: %@ %@ %0.2f",
              skProduct.productIdentifier,
              skProduct.localizedTitle,
              skProduct.price.floatValue);
    }
    if ([skProducts count]>0) {
        _completionHandler(YES, skProducts);
    }
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    
    NSLog(@"Failed to load list of products.");
    _productsRequest = nil;
    
    _completionHandler(NO, nil);
    _completionHandler = nil;
}

#pragma mark SKPaymentTransactionOBserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction * transaction in transactions) {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
            default:
                break;
        }
    };
}

- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    NSLog(@"completeTransaction...%@",transaction.payment.productIdentifier);
    
//    if (_helperCallBack) {
//        NSLog(@"entered");
//        _helperCallBack(transaction.payment.productIdentifier);
//        _helperCallBack = nil;
//    }

    [self provideContentForProductIdentifier:transaction.payment.productIdentifier];
    
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

- (void)restoreTransaction:(SKPaymentTransaction *)transaction {
    NSLog(@"restoreTransaction...");
//    if (_helperCallBack) {
//        NSLog(@"entered");
//        _helperCallBack(transaction.originalTransaction.payment.productIdentifier);
//        _helperCallBack = nil;
//    }

    [self provideContentForProductIdentifier:transaction.originalTransaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    NSLog(@"failedTransaction...");
    NSLog(@"transaction.error.code==%d",transaction.error.code);
   /* if (transaction.error.code != SKErrorPaymentCancelled)
    {
        NSLog(@"Transaction error: %@", transaction.error.localizedDescription);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IAPHelperProductPurchasedErrorNotification" object:transaction.error.localizedDescription userInfo:nil];
    }*/
    
     [[NSNotificationCenter defaultCenter] postNotificationName:@"IAPHelperProductPurchasedErrorNotification" object:transaction.error.localizedDescription userInfo:nil];
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void)provideContentForProductIdentifier:(NSString *)productIdentifier
{
    NSLog(@"ProductIdetifierProvide:%@",productIdentifier);
//    [_purchasedProductIdentifiers addObject:productIdentifier];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:productIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"IAPHelperProductPurchasedNotification" object:productIdentifier userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:IAPHelperProductPurchasedNotification object:productIdentifier userInfo:nil];

    
    counnnt = counnnt +1;
    NSLog(@"counttmethod:%d",counnnt);
    
//    if ([_delegate respondsToSelector:@selector(productPurchasedCoins:)]) {
////        [_delegate performSelector:@selector(productPurchasedCoins:) withObject:self];
//        [_delegate productPurchasedCoins:productIdentifier];
//    }
    //[_delegate productPurchasedCoins:productIdentifier];
}

- (void)restoreCompletedTransactions
{
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

@end