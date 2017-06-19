//
//  AFCollectionViewFlowLargeLayout.m
//  UICollectionViewFlowLayoutExample
//
//  Created by Ash Furrow on 2013-02-05.
//  Copyright (c) 2013 Ash Furrow. All rights reserved.
//

#import "AFCollectionViewFlowLargeLayout.h"

@implementation AFCollectionViewFlowLargeLayout

-(id)init
{
    if (!(self = [super init])) return nil;
    
    self.itemSize = CGSizeMake((DEVICE_WIDTH-30)/2,(DEVICE_HEIGHT-84)/3);
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.minimumInteritemSpacing = 0.0f;
    self.minimumLineSpacing = 0.0f;
    
    return self;
}

@end
