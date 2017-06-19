//
//  AFCollectionViewCell.h
//  UICollectionViewFlowLayoutExample
//
//  Created by Ash Furrow on 2013-02-05.
//  Copyright (c) 2013 Ash Furrow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFCollectionViewCell : UICollectionViewCell
{
    
}
@property (nonatomic, strong) UIImageView *imgBorderUser;
@property (nonatomic, strong) UIImageView *imgProfileUserlike;

@property (nonatomic, strong) UIImageView *imgBorderOtherUser;
@property (nonatomic, strong) UIImageView *imgProfileOtherUserlike;

@property (nonatomic, strong) UIImageView *imgBorderUserlike;
@property (nonatomic, strong) UIImageView *imgProfileUser;

@property (nonatomic, strong) UIImageView *imgBorderOtherUserlike;
@property (nonatomic, strong) UIImageView *imgProfileOtherUser;

@property (nonatomic, strong) UIImageView *imgplusicon;
@property (nonatomic, strong) UIImageView *imageFlower;
@property (nonatomic, strong) UIImageView *imageCancel;
@property (nonatomic, strong) UIImageView *imageAccepet;
@property (nonatomic, strong) UIImageView *imageCahticon;
@property (nonatomic, strong) UIButton *btnuser;
@property (nonatomic, strong) UIButton *btnOtheruser;
@property (nonatomic, strong) UIButton *btnFlower;
@property (nonatomic, strong) UIButton *btnCancel;
@property (nonatomic, strong) UIButton *btnAccepet;
@property (nonatomic, strong) UIButton *btnCahticon;

@property (nonatomic, strong) UILabel *lbldate;;
//-(void)setImage:(UIImage *)image :(NSString *)srtUrl :(NSString *)title;

@end
