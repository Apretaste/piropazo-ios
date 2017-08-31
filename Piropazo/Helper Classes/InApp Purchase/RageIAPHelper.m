//
//  RageIAPHelper.m
//  In App Rage
//
//  Created by Ray Wenderlich on 9/5/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

#import "RageIAPHelper.h"

@implementation RageIAPHelper

+ (RageIAPHelper *)sharedInstance
{
    static dispatch_once_t once;
    static RageIAPHelper * sharedInstance;
    dispatch_once(&once, ^{
//        NSSet * productIdentifiers = [NSSet setWithObjects:
//                                      @"com.oneclick.oneclickslots.product1",
//                                      @"com.oneclick.oneclickslots.product2",
//                                      @"com.oneclick.oneclickslots.product3",
//                                      @"com.oneclick.oneclickslots.product4",
//                                      nil];
        NSSet * productIdentifiers = [NSSet setWithObjects:@"com.pragres.Piropazo.Threeflowers",@"com.pragres.Piropazo.OneCrown",@"com.pragres.Piropazo.FiveFlowersandOneCrown",@"com.pragres.Piropazo.TenFlowersandTwoCrown",@"com.pragres.Piropazo.FifteenFlowersandThreeCrown",nil];
        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
    });
    return sharedInstance;
}

@end
